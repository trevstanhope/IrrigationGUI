function varargout = Irr_reqmt(varargin)
% IRR_REQMT MATLAB code for Irr_reqmt.fig
%      IRR_REQMT, by itself, creates a new IRR_REQMT or raises the existing
%      singleton*.
%
%      H = IRR_REQMT returns the handle to a new IRR_REQMT or the handle to
%      the existing singleton*.
%
%      IRR_REQMT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IRR_REQMT.M with the given input arguments.
%
%      IRR_REQMT('Property','Value',...) creates a new IRR_REQMT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Irr_reqmt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Irr_reqmt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Irr_reqmt

% Last Modified by GUIDE v2.5 30-Aug-2012 16:39:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Irr_reqmt_OpeningFcn, ...
                   'gui_OutputFcn',  @Irr_reqmt_OutputFcn, ...
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


% --- Executes just before Irr_reqmt is made visible.
function Irr_reqmt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Irr_reqmt (see VARARGIN)

% Choose default command line output for Irr_reqmt
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Irr_reqmt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Irr_reqmt_OutputFcn(hObject, eventdata, handles) 
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
