function varargout = Requirements(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Requirements_OpeningFcn, ...
                   'gui_OutputFcn',  @Requirements_OutputFcn, ...
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

function Requirements_OpeningFcn(hObject, ~, handles, varargin)
guidata(hObject, handles);
end

function varargout = Requirements_OutputFcn(~, ~, handles) 
varargout{1} = handles;
end

function pushbutton_Exit_Callback(~, ~, ~)
close all;
end

function pushbuttonClear_Callback(~, ~, handles)
set(handles.importTable,'Data', zeros(2,12));
set(handles.uitableDisplay, 'Data', zeros(1,12));
end

function pushbutton_Calculate_Callback(~, ~, handles)
%% Read inputs
% Precipitation/ETO
data = get(handles.importTable,'Data');
P = data(1,:);
ETO = data(2,:);
methodP(1) = get(handles.radiobutton80, 'Value');
methodP(2) = get(handles.radiobuttonAlt, 'Value');

if (methodP(1) == 1)
    PE = 0.8.*P;
    data(3,:) = PE;
else
    for i = 1:length(P)
        if (P(i) > 0)
            PE = ((P - 0.5)*0.75);
        else
            PE = 0;
        end
    end
    data(3,:) = PE;
end


% Field Conditions
A = str2double(get(handles.editA, 'String'));
FC = str2double(get(handles.editFC, 'String'));
RD_init = str2double(get(handles.editRD_init, 'String'));
RD_mid = str2double(get(handles.editRD_mid, 'String'));
RD_end = str2double(get(handles.editRD_end, 'String'));
PWP = str2double(get(handles.editPWP, 'String'));
IE = str2double(get(handles.editIE, 'String'));

% Growth Stages
K_init = str2double(get(handles.editK_init, 'String'));
K_mid = str2double(get(handles.editK_mid, 'String'));
K_end = str2double(get(handles.editK_end, 'String'));
day = str2double(get(handles.editDay, 'String'));
T_end = str2double(get(handles.editT_end, 'String'));
T_mid = str2double(get(handles.editT_mid, 'String'));
T_init = str2double(get(handles.editT_init, 'String'));
month = str2double(get(handles.editMonth, 'String'));

% --- ERRORS -- %
if (month < 1 || month > 12 ) % if 
    errordlg('There is no zero-th month');
end
if (T_init < 1 || T_init > 12)
    errordlg('Initial growth phase length not possible!'); % ERROR
end
if (T_mid < 1 || T_mid > 12)
    errordlg('Middle growth phase length not possible!'); % ERROR
end
if (T_end < 1 || T_end > 12)
    errordlg('End growth phase length not possible!'); % ERROR
end
if (T_end + T_mid + T_init > 12)
    errordlg('Growth phase too long!'); % ERROR
end

%% Computation
% Compute values
AWC_init = (1 - (FC-A)/(FC-PWP))*RD_init;
AWC_mid = (1 - (FC-A)/(FC-PWP))*RD_mid;
AWC_end = (1 - (FC-A)/(FC-PWP))*RD_end;


% Build circular array
circular = zeros(1,12);
for i = 0:11
    if month+i > 12;  
        circular(i+1) = abs(month+i)-12 ;
    else
        circular(i+1) = month+i;
    end
end        

% Find IWR Init
IWR = zeros(1,12);
j = 0;
for i = circular
    j = j + 1;
    if (j >= 1) && (j <= T_init)
        IWR(i) = (K_init*ETO(i) - AWC_init - PE(i))/IE;
        V(i) = (10*A*RD_init);
    elseif (j > T_init) && (j <= T_init + T_mid)
        IWR(i) = (K_mid*ETO(i) - AWC_mid - PE(i))/IE;
        V(i) = (10*A*RD_mid);
    elseif (j > T_init + T_mid) && (j <= T_init + T_mid + T_end)
        IWR(i) = (K_end*ETO(i) - AWC_end - PE(i))/IE;
        V(i) = (10*A*RD_end);
    else
        IWR(i) = 0;
    end
end

%% Display
results = [IWR; V];
set(handles.importTable, 'Data', data);
set(handles.uitableDisplay, 'Data', results);
end