function varargout = Scheduling(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Scheduling_OpeningFcn, ...
                   'gui_OutputFcn',  @Scheduling_OutputFcn, ...
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

function Scheduling_OpeningFcn(hObject, ~, handles, varargin)
% Choose default command line output for Scheduling
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
end

function varargout = Scheduling_OutputFcn(~, ~, handles) 
varargout{1} = handles.output;

end

function popupmenuSoils_Callback(hObject, ~, handles)
contents = get(hObject, 'String');
selection = contents{get(hObject, 'Value')};
switch selection
    case 'Custom'
        set(handles.editFC, 'String', 0);
        set(handles.editPWP, 'String', 0);
    case 'Clay'
        set(handles.editFC, 'String', 0.47);
        set(handles.editPWP, 'String', 0.38);
    case 'Loamy Sand'
        set(handles.editFC, 'String', 0.33);
        set(handles.editPWP, 'String', 0.10);
    case 'Loam'
        set(handles.editFC, 'String', 0.27);
        set(handles.editPWP, 'String', 0.13);
    case 'Sand'
        set(handles.editFC, 'String', 0.13);
        set(handles.editPWP, 'String', 0.05);
    case 'Sandy Loam'
        set(handles.editFC, 'Value', 0.34);
        set(handles.editPWP, 'String', 0.25);
    case 'Sandy Clay'
        set(handles.editFC, 'String', 0.22);
        set(handles.editPWP, 'String', 0.11);
    otherwise
        set(handles.editFC, 'String', 0);
        set(handles.editPWP, 'String', 0);
end  
end

function pushbuttonExit_Callback(~, ~, ~)
close all;
end

function pushbutton2_Callback(~, ~, handles)
    % Get values
    methodP(1) = get(handles.radiobutton80, 'Value');
    methodP(2) = get(handles.radiobuttonAlt, 'Value');
    data = get(handles.uitableClimate, 'Data');
    ETO = data(:,1)';
    P = data(:,2)';
    FC = str2double(get(handles.editFC, 'String'));
    PWP = str2double(get(handles.editPWP, 'String'));
    ASW(1) = str2double(get(handles.editASW, 'String'));
    Kc = str2double(get(handles.editKc, 'String'));
    T = str2double(get(handles.editT, 'String'));
    
    % Get Precipitation method
    if (methodP(1) == 1)
        PE = (0.8*P);
    else
        for i = 1:length(P)
            if (P(i) > 0)
                PE = ((P - 0.5)*0.75);
            else
                PE = 0;
            end
        end
    end
    
    % Calculate
    for i = 2:7
        ASW(i) = ASW(i-1) - Kc*ETO(i-1) + PE(i-1);
        if (ASW(i) <= T*ASW)
            ASW(i) = ASW(1);
        end
    end
    
    % Display
    plot(handles.axes1, ASW);
    xlabel(handles.axes1,'Day');
    ylabel(handles.axes1,'Available Soil Water');
end
