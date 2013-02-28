%% Evapotranspiration GUI
% Author: Trevor Stanhope
% Organization: McGill University, Department of Bioresource Engineering
% Last Updated: Februar7 26th, 2013

function varargout = main(varargin)
% Begin initialization code - DO NOT EDIT
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
% End initialization code - DO NOT EDIT
end
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

% --- ACTIONS
function pushbuttonExit_Callback(~, ~, ~) %#ok<DEFNU>
close all;
end

function pushbuttonCalculate_Callback(~, ~, handles) %#ok<DEFNU>
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
Tmin = cell2mat(data(:,1));
Tmax = cell2mat(data(:,2));
RH = cell2mat(data(:,3));
u2 = cell2mat(data(:,4));
n = cell2mat(data(:,5));
N = cell2mat(data(:,6));
Rs = cell2mat(data(:,7));

% 3b. Import Editbox Data
a = str2double(get(handles.editA, 'Value'));
b = str2double(get(handles.editB, 'Value'));
L = str2double(get(handles.editLat, 'Value'));
z = str2double(get(handles.editZ, 'Value'));
Krs = str2double(get(handles.editKRS, 'Value'));

% 4a. Check for errors, if good -> Calculate Radiation
if methodR(1)
    if (length(n) == 12) && (length(N) == 12) && (length(a) == 12) && (length(b) == 12) && (length(L) == 12)
        Rs = R_AP(n, N, a, b, L);
    else
        % ERROR
        ERR = 1;
    end
elseif methodR(2)
    if (length(Tmin) == 12) && (length(Tmax) == 12) && (length(Krs) == 1) && (length(L) == 1)
        Rs = R_Hargreaves(Tmin, Tmax, Krs, L);
    else
        % ERROR
        ERR = 1;
    end
end

% 4b. Check for errors, if good -> calculate ETO
% The primary method to check for errors is if there are 12 entries
% in the required columns.
if methodETO(1)
    if (length(u2) == 12) && (length(Tmin) == 12) && (length(Tmax) == 12) && (length(Rs) == 12)
        eto(:,1) = ETO_FAO(Tmin,Tmax,u2,Rs);
    else
        % ERROR
        ERR = 1;
    end
end

if methodETO(2)
    if (length(Tmin) == 12) && (length(Tmax) == 12) && (length(Ra) == 12)
        eto(:,2) = ETO_Hargreaves(Tmin, Tmax, Ra);
    else
        % ERROR
        ERR = 1;
    end
end

if methodETO(3)
    if (length(Tmin) == 12) && (length(Tmax) == 12) && (length(Rs) == 12) && (length(RH) == 12)
        eto(:,3) = ETO_Turc(Tmin,Tmax,Rs,RH);
    else
        % ERROR
        ERR = 1;
    end
end

if methodETO(4)
    if (length(Tmin) == 12) && (length(Tmax) == 12) && (length(u2) == 12) && (length(Rs) == Rs)
        eto(:,4) = ETO_ASCE(Tmin,Tmax,u2,z,Rs);
    else
        % ERROR
        ERR = 1;
    end
end

% 6. Return complete results
if (ERR == 1)
    % ERROR MSG
else
    set(handles.bargraph, eto)
    set(handles.bargraph,'xticklabel',{ 'january',...
        'februaru',...
        'march',...
        'april',...
        'may',...
        'june',...
        'july',...
        'august',...
        'september',...
        'october',...
        'november',...
        'december'})
end
end
