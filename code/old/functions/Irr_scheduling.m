function varargout = Irr_scheduling(varargin)
% IRR_SCHEDULING MATLAB code for Irr_scheduling.fig
%      IRR_SCHEDULING, by itself, creates a new IRR_SCHEDULING or raises the existing
%      singleton*.
%
%      H = IRR_SCHEDULING returns the handle to a new IRR_SCHEDULING or the handle to
%      the existing singleton*.
%
%      IRR_SCHEDULING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IRR_SCHEDULING.M with the given input arguments.
%
%      IRR_SCHEDULING('Property','Value',...) creates a new IRR_SCHEDULING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Irr_scheduling_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Irr_scheduling_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Irr_scheduling

% Last Modified by GUIDE v2.5 30-Aug-2012 16:40:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Irr_scheduling_OpeningFcn, ...
                   'gui_OutputFcn',  @Irr_scheduling_OutputFcn, ...
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


% --- Executes just before Irr_scheduling is made visible.
function Irr_scheduling_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Irr_scheduling (see VARARGIN)

% Choose default command line output for Irr_scheduling
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Irr_scheduling wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Irr_scheduling_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
