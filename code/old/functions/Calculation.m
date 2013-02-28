function varargout = Calculation(varargin)
%CALCULATION M-file for Calculation.fig
%      CALCULATION, by itself, creates a new CALCULATION or raises the existing
%      singleton*.
%
%      H = CALCULATION returns the handle to a new CALCULATION or the handle to
%      the existing singleton*.
%
%      CALCULATION('Property','Value',...) creates a new CALCULATION using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Calculation_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      CALCULATION('CALLBACK') and CALCULATION('CALLBACK',hObject,...) call the
%      local function named CALLBACK in CALCULATION.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Calculation

% Last Modified by GUIDE v2.5 26-Jul-2012 12:57:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Calculation_OpeningFcn, ...
                   'gui_OutputFcn',  @Calculation_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before Calculation is made visible.
function Calculation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Calculation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Calculation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Calculation_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function file_menu_Callback(hObject, eventdata, handles)
% hObject    handle to file_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function edit_menu_Callback(hObject, eventdata, handles)
% hObject    handle to edit_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function calculation_menu_Callback(hObject, eventdata, handles)
% hObject    handle to calculation_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function report_menu_Callback(hObject, eventdata, handles)
% hObject    handle to report_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function expdata_menu_Callback(hObject, eventdata, handles)
% hObject    handle to expdata_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function refETo_calc_Callback(hObject, eventdata, handles)
% hObject    handle to refETo_calc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ETo

% --------------------------------------------------------------------
function IWR_calc_Callback(hObject, eventdata, handles)
% hObject    handle to IWR_calc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
IWR

% --------------------------------------------------------------------
function Irrsched_calc_Callback(hObject, eventdata, handles)
% hObject    handle to Irrsched_calc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function location_edit_Callback(hObject, eventdata, handles)
% hObject    handle to location_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function addloc_edit_Callback(hObject, eventdata, handles)
% hObject    handle to addloc_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function crop_edit_Callback(hObject, eventdata, handles)
% hObject    handle to crop_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function addcrop_edit_Callback(hObject, eventdata, handles)
% hObject    handle to addcrop_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function existingfile_menu_Callback(hObject, eventdata, handles)
% hObject    handle to existingfile_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function newfile_menu_Callback(hObject, eventdata, handles)
% hObject    handle to newfile_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function exit_menu_Callback(hObject, eventdata, handles)
% hObject    handle to exit_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function table_report_Callback(hObject, eventdata, handles)
% hObject    handle to table_report (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function graph_report_Callback(hObject, eventdata, handles)
% hObject    handle to graph_report (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
