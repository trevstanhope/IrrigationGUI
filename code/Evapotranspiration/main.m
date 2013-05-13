%% Evapotranspiration GUI
% Author: Trevor Stanhope
% Organization: McGill University, Department of Bioresource Engineering
% Updated: February 28th, 2013

% --- INITIALIZATION CODE (DO NOT EDIT)
function varargout = ETO(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',   mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @main_OpeningFcn, ...
    'gui_OutputFcn',  @main_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
end % End initialization code - DO NOT EDIT

% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
handles.output = hObject; % Choose default command line output for main
guidata(hObject, handles); % Update handles structure
end

% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(~, ~, handles)
varargout{1} = handles.output; % Get default command line output from handles structure
end

% --- Executes on button press in pushbuttonImport.
function pushbuttonImport_Callback(~, ~, handles) %#ok<DEFNU>
[name path] = uigetfile({'*.xls'}, 'Please select Excel file to import');
if (name)
    fullpath = strcat(path,name);
    data = importdata(fullpath);
    set(handles.importTable, 'Data', data);
else
    errordlg('No file selected');
end
end


% --- EXIT BUTTON
function pushbuttonExit_Callback(~, ~, ~) %#ok<DEFNU>
close all;
end

% --- CALCULATE BUTTON
function pushbuttonCalculate_Callback(~, ~, handles) %#ok<DEFNU>
ERR = 0;
eto = zeros(1,12);

% 1. Get States from checkboxes, returns an array
methodETO(1) = get(handles.checkboxPM, 'Value');
methodETO(2) = get(handles.checkboxHargreaves, 'Value');
methodETO(3) = get(handles.checkboxTurc, 'Value');
methodETO(4) = get(handles.checkboxASCE, 'Value');

% 2. Get states from radiobuttons and editboxes, return an array
methodR(1) = get(handles.radiobuttonAP, 'Value');
methodR(2) = get(handles.radiobuttonHargreaves, 'Value');

% 3a. Import Table Data
data = get(handles.importTable,'Data');
Tmin = data(:,1);
Tmax = data(:,2);
RH = data(:,3);
u2 = data(:,4);
n = data(:,5);
N = data(:,6);
Ra = data(:,7);

% 3b. Import Editbox Data
a = str2double(get(handles.editA, 'String'));
b = str2double(get(handles.editB, 'String'));
L = str2double(get(handles.editLat, 'String'));
z = str2double(get(handles.editZ, 'String'));
Krs = str2double(get(handles.editKRS, 'String'));

% 4a. Check for errors, if good -> Calculate Radiation
if methodR(1) % AP
    if (length(n) == 12) && (length(N) == 12) && (length(a) == 1) && (length(b) == 1) && (length(L) == 1)
        Rs = R_AP(n, N, a, b, L);
    else
        errordlg('The Angston-Prescott Radiation Method requires n, N, A, B and Latitude!'); % ERROR
    end
elseif methodR(2) % Hargreaves
    if (length(Tmin) == 12) && (length(Tmax) == 12) && (length(Krs) == 1) && (length(L) == 1)
        Rs = R_Hargreaves(Tmin, Tmax, Krs, L);
    else
        errordlg('The Hargreaves Radiation Method requires Tmin, Tmax, KRS and Latitude!');% ERROR
    end
end

% 4b. Check for errors, if good -> calculate ETO
% The primary method to check for errors is if there are 12 entries
% in the required columns.
if methodETO(1) % FAO
    if (length(u2) == 12) && (length(Tmin) == 12) && (length(Tmax) == 12) && (length(Rs) == 12)
        eto(1,:) = ETO_FAO(Tmin,Tmax,u2,Rs,Ra,z);
    else
        errordlg('The FAO-56PM ETO Method requires Tmin, Tmax, Windspeed!'); % ERROR
    end
end

if methodETO(2) % Hargreaves
    if (length(Tmin) == 12) && (length(Tmax) == 12) && (length(Ra) == 12)
        eto(2,:) = ETO_Hargreaves(Tmin, Tmax, Ra);
    else
        errordlg('The Hargreaves ETO Method requires Tmin, Tmax and Ra!'); % ERROR
    end
end

if methodETO(3) % Turc
    if (length(Tmin) == 12) && (length(Tmax) == 12) && (length(Rs) == 12) && (length(RH) == 12)
        eto(3,:) = ETO_Turc(Tmin,Tmax,Rs,RH);
    else
        errordlg('The Turc ETO Method requires Tmin, Tmax, and RH!'); % ERROR
    end
end

if methodETO(4) % ASCE
    if (length(Tmin) == 12) && (length(Tmax) == 12) && (length(u2) == 12) && (length(Rs) == 12)
        eto(4,:) = ETO_ASCE(Tmin,Tmax,u2,Ra,Rs,z);
    else
        errordlg('The ASCE ETO Method requires Tmin, Tmax, and Windspeed!');
    end
end

% 6. Return complete results
if (ERR == 0)
    bar(handles.bargraph, eto')
    legend(handles.bargraph,'FAO', 'Hargreaves', 'Turc', 'ASCE');
    set(handles.bargraph,'xticklabel',{ 
        'jan',...
        'feb',...
        'mar',...
        'apr',...
        'may',...
        'jun',...
        'jul',...
        'aug',...
        'sep',...
        'oct',...
        'nov',...
        'dec'})
    ylabel(handles.bargraph,'mm/hr');
else
    errordlg('Something went wrong');
end
save;
end