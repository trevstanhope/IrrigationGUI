%% Evapotranspiration GUI
% Author: Trevor Stanhope
% Organization: McGill University, Department of Bioresource Engineering
% Updated: February 28th, 2013

% --- INITIALIZATION CODE (DO NOT EDIT)
function varargout = ETO(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',   mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @ETO_OpeningFcn, ...
    'gui_OutputFcn',  @ETO_OutputFcn, ...
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

% --- Executes just before ETO is made visible.
function ETO_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
handles.output = hObject; % Choose default command line output for main
guidata(hObject, handles); % Update handles structure
end

% --- Outputs from this function are returned to the command line.
function varargout = ETO_OutputFcn(~, ~, handles)
varargout{1} = handles.output; % Get default command line output from handles structure
end

% --- Executes on button press in pushbuttonImport.
function pushbuttonImport_Callback(~, ~, handles) %#ok<DEFNU>
[name path] = uigetfile({'*.xls'}, 'Please select Excel file to import');
if (name)
    fullpath = strcat(path,name);
    data = importdata(fullpath);
    set(handles.importTable, 'Data', data.Sheet1);
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
methodCO2(1) = get(handles.radiobuttonNone, 'Value');
methodCO2(2) = get(handles.radiobutton30to40, 'Value');
methodCO2(3) = get(handles.radiobutton45to50, 'Value');

% 3a. Import Table Data
data = get(handles.importTable,'Data');
Tmin = data(:,1);
Tmax = data(:,2);
RH = data(:,3);
u2 = data(:,4);
n = data(:,5);
N = data(:,6);
Rs = data(:,7);
Ra = data(:,8);

% 3b. Import Editbox Data
a = str2double(get(handles.editA, 'String'));
b = str2double(get(handles.editB, 'String'));
L = str2double(get(handles.editLat, 'String'));
z = str2double(get(handles.editZ, 'String'));
Krs = str2double(get(handles.editKRS, 'String'));

% 4a. Check for errors, if good -> Calculate Radiation
if methodR(1) % AP
    if (length(n) == 12) && (length(N) == 12) && (length(a) == 1) && (length(b) == 1) && (length(L) == 1)
        [Rs Ra] = R_AP(n, N, a, b, L);
        newData = data;
        newData(:,7) = Rs;
        newData(:,8) = Ra;
        set(handles.importTable, 'Data', newData);
    else
        errordlg('The Angston-Prescott Radiation Method requires n, N, A, B and Latitude!'); % ERROR
    end
elseif methodR(2) % Hargreaves
    if (length(Tmin) == 12) && (length(Tmax) == 12) && (length(Krs) == 1) && (length(L) == 1)
        [Rs Ra] = R_Hargreaves(Tmin, Tmax, Krs, L);
        newData = data;
        newData(:,7) = Rs;
        newData(:,8) = Ra;
        set(handles.importTable, 'Data', newData);
    else
        errordlg('The Hargreaves Radiation Method requires Tmin, Tmax, KRS and Latitude!');% ERROR
    end
end

% 4b. Check for errors, if good -> calculate ETO
% The primary method to check for errors is if there are 12 entries
% in the required columns.
if methodCO2(1)
    C = 0.34;
elseif methodCO2(2)
    C = 0.40;
else
    C = 0.95;
end

if methodETO(1) % FAO
    if (length(u2) == 12) && (length(Tmin) == 12) && (length(Tmax) == 12) && (length(Rs) == 12)
        eto(1,:) = ETO_FAO(Tmin,Tmax,u2,Rs,Ra,z,C);
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
        eto(4,:) = ETO_ASCE(Tmin,Tmax,u2,Rs,Ra,z,C);
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
    ylabel(handles.bargraph,'mm/day');
else
    errordlg('Something went wrong');
end
save;
end


% --- Executes on selection change in popupmenuLocations.
function popupmenuLocations_Callback(hObject, ~, handles)
contents = get(hObject, 'String');
selection = contents{get(hObject, 'Value')};
switch selection
    case 'Ottawa'
        set(handles.editA, 'String', 0.25);
        set(handles.editB, 'String', 0.48);
        set(handles.editLat, 'String', 45.38);
        set(handles.editLong, 'String', 75.72);
        set(handles.editZ, 'String', 79.2);
        set(handles.editKRS, 'String', 0.16);
    case 'Montreal'
        set(handles.editA, 'String', 0.17);
        set(handles.editB, 'String', 0.63);
        set(handles.editLat, 'String', 45.47);
        set(handles.editLong, 'String', 73.75);
        set(handles.editZ, 'String', 35.97);
        set(handles.editKRS, 'String', 0.15);
    case 'Beaverlodge'
         set(handles.editA, 'String', 0.29);
        set(handles.editB, 'String', 0.44);
        set(handles.editLat, 'String', 55.2);
        set(handles.editLong, 'String', 119.4);
        set(handles.editZ, 'String', 744.9);
        set(handles.editKRS, 'String', 0.15);
    case 'Winnipeg'
        set(handles.editA, 'String', 0.31);
        set(handles.editB, 'String', 0.36);
        set(handles.editLat, 'String', 49.92);
        set(handles.editLong, 'String', 97.23);
        set(handles.editZ, 'String', 238.7);
        set(handles.editKRS, 'String', 0.15);
    case 'Summerland'
        set(handles.editA, 'String', 0.23);
        set(handles.editB, 'String', 0.52);
        set(handles.editLat, 'String', 49.57);
        set(handles.editLong, 'String', 119.65);
        set(handles.editZ, 'String', 454.2);
        set(handles.editKRS, 'String', 0.16);
    case 'Swift Current'
        set(handles.editA, 'String', 0.34);
        set(handles.editB, 'String', 0.40);
        set(handles.editLat, 'String', 50.27);
        set(handles.editLong, 'String', 107.73);
        set(handles.editZ, 'String', 825);
        set(handles.editKRS, 'String', 0.16);
   case 'Toronto'
        set(handles.editA, 'String', 0.21);
        set(handles.editB, 'String', 0.55);
        set(handles.editLat, 'String', 43.67);
        set(handles.editLong, 'String', 79.4);
        set(handles.editZ, 'String', 112.5);
        set(handles.editKRS, 'String', 0.17);
    case 'Elora'
        set(handles.editA, 'String', 0.22);
        set(handles.editB, 'String', 0.54);
        set(handles.editLat, 'String', 43.65);
        set(handles.editLong, 'String', 80.42);
        set(handles.editZ, 'String', 376.4);
        set(handles.editKRS, 'String', 0.15);
    otherwise
        set(handles.editA, 'String', 0);
        set(handles.editB, 'String', 0);
        set(handles.editLat, 'String', 0);
        set(handles.editLong, 'String', 0);
        set(handles.editZ, 'String', 0);
        set(handles.editKRS, 'String', 0);
end  
end
