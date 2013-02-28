function varargout = ETo_ASCE(varargin)
% ETO_ASCE MATLAB code for ETo_ASCE.fig
%      ETO_ASCE, by itself, creates a new ETO_ASCE or raises the existing
%      singleton*.
%
%      H = ETO_ASCE returns the handle to a new ETO_ASCE or the handle to
%      the existing singleton*.
%
%      ETO_ASCE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ETO_ASCE.M with the given input arguments.
%
%      ETO_ASCE('Property','Value',...) creates a new ETO_ASCE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ETo_ASCE_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ETo_ASCE_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ETo_ASCE

% Last Modified by GUIDE v2.5 17-Aug-2012 18:06:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ETo_ASCE_OpeningFcn, ...
                   'gui_OutputFcn',  @ETo_ASCE_OutputFcn, ...
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


% --- Executes just before ETo_ASCE is made visible.
function ETo_ASCE_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ETo_ASCE (see VARARGIN)

% Choose default command line output for ETo_ASCE
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ETo_ASCE wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ETo_ASCE_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
L=str2num(get(handles.edit2,'String'));
z=str2num(get(handles.edit6,'String'));
as=str2num(get(handles.edit4,'String'));
bs=str2num(get(handles.edit5,'String'));
NS=get(handles.popupmenu1,'String');
L=str2num(get(handles.edit1,'String'));
if NS == 'S'
    L=-L;
end

dat= get(handles.uitable2,'Data');
Tmin=zeros(12,1);
Tmax=zeros(12,1);
Rs=zeros(12,1);
u2=zeros(12,1);
n=zeros(12,1);
N=zeros(12,1);

for i=1:12
     Tmin(i)=cell2mat(dat(i,1));
    Tmax(i)=cell2mat(dat(i,2));
    u2(i)=cell2mat(dat(i,4));
    n(i)=cell2mat(dat(i,5));
    N(i)=cell2mat(dat(i,6));
    
    days=[15 46 76 107 137 167 198 228 259 289 319 350];
    dr(i)=1+0.033*cos(0.017214*days(i));
    p=101.3*(((293-(0.0065*z))/293)^5.26);
    j=(3.141593/180)*L;
    c(i)=(0.017214206*days(i))-1.39;
    d(i)=0.409*sin(c(i));
    m(i)=-tan(j)*tan(d(i));
    ws(i)=acos(m(i));
    a(i)=sin(j)*sin(d(i));
    b(i)=cos(j)*cos(d(i));
    Ra(i)=37.58603*(dr(i))*((ws(i)*a(i))+(b(i)*(sin(ws(i)))));
    if n(i)== 0
        if N(i)== 0
        Rs(i)= cell2mat(dat(i,7));
        end
    else    
    Rs(i)= (as+bs*(n(i)/N(i)))* Ra(i);
    end

 Rns(i)=0.77*Rs(i);
    Rso(i)=(0.75+2*z/100000)*Ra(i);
    eo_Tmin(i)=0.6108*exp(17.27*Tmin(i)/(Tmin(i)+237.3));
    ea(i)=eo_Tmin(i);
    alpha=(4.903e-09);
    q1(i)=((Tmax(i)+273.16)^4)*alpha;
    q2(i)=((Tmin(i)+273.16)^4)*alpha;
    r(i)=0.34-0.14*sqrt(ea(i));
    s(i)=1.35*(Rs(i)/Rso(i))-0.35;
    Rnl(i)=((q1(i)+q2(i))/2)*r(i)*s(i);
    Rn(i)=Rns(i)-Rnl(i);
    
    if i>11
         p=101.3*((293-(0.0065*z))/293)^5.26;
    phi=(1.013e-3*p)/(0.622*2.45);
    Tmean(i-1)=(Tmax(i-1)+Tmin(i-1)/2);
    Tmean(i)=(Tmax(i)+Tmin(i))/2;
    eo_Tmax(i)=0.6108.*exp(17.27.*Tmax(i)/(Tmax(i)+237.3));
    eo_Tmin(i)=0.6108.*exp(17.27.*Tmin(i)/(Tmin(i)+237.3));
    es(i)=(eo_Tmax(i)+eo_Tmin(i))/2;
    ea(i)=0.6108.*exp(17.27.*Tdew(i)/(Tdew(i)+237.3));
   delta=4098.*(0.6108.*exp(17.27.*Tmean(i)./(Tmean(i)+237.3)))./(Tmean(i)+237.3).^2;
    G(i)=0.14*(Tmean(i)-Tmean(i-1));
    
eto(i)=((0.408*delta*(Rn(i)-G(i)))+(phi*(1600/(Tmean(i)+273))*u2(i)*(es(i)-ea(i))))/...
     (delta+(phi*(1+(0.38*u2(i)))));
 
    elseif i<2
       % eto(i)=calculate_eto(z,minT(i),maxT(i),minT(i+1),maxT(i+1),minT(12),maxT(12),u2(i),Rn(i));
    p=101.3*((293-(0.0065*z))/293)^5.26;
    phi=(1.013e-3*p)/(0.622*2.45);
    Tmean(i+1)=(Tmax(i+1)+Tmin(i+1)/2);
    Tmean(i+11)=(Tmax(i+11)+Tmin(i+11))/2;
    Tmean(i)=(Tmax(i)+Tmin(i))/2;
    eo_Tmax(i)=0.6108.*exp(17.27.*Tmax(i)./(Tmax(i)+237.3));
    eo_Tmin(i)=0.6108.*exp(17.27.*Tmin(i)./(Tmin(i)+237.3));
    es(i)=(eo_Tmax(i)+eo_Tmin(i))/2;
    ea(i)=0.6108.*exp(17.27.*Tdew(i)/(Tdew(i)+237.3));
   delta=4098.*(0.6108.*exp(17.27.*Tmean(i)./(Tmean(i)+237.3)))./(Tmean(i)+237.3).^2;
    G=0.07*(Tmean(i+1)-Tmean(i+11));
    
eto(i)=((0.408*delta*(Rn(i)-G(i)))+(phi*(1600/(Tmean(i)+273))*u2(i)*(es(i)-ea(i))))/...
     (delta+(phi*(1+(0.38*u2(i)))));
 
    else
        %eto(i)=calculate_eto(z,minT(i),maxT(i),minT(i+1),maxT(i+1),minT(i-1),maxT(i-1),u2(i),Rn(i));
         p=101.3*((293-(0.0065*z))/293)^5.26;
    phi=(1.013e-3*p)/(0.622*2.45);
    Tmean(i+1)=(Tmax(i+1)+Tmin(i+1)/2);
    Tmean(i-1)=(Tmax(i-1)+Tmin(i-1))/2;
    Tmean(i)=(Tmax(i)+Tmin(i))/2;
    eo_Tmax(i)=0.6108.*exp(17.27.*Tmax(i)./(Tmax(i)+237.3));
    eo_Tmin(i)=0.6108.*exp(17.27.*Tmin(i)./(Tmin(i)+237.3));
    Tdew(i)=(-0.036*Tmean(i))+(0.9679*Tmin(i))+(0.0072*(Tmax(i)-Tmin(i)))+1.0119;
    es(i)=(eo_Tmax(i)+eo_Tmin(i))/2;
    ea(i)=0.6108.*exp(17.27.*Tdew(i)/(Tdew(i)+237.3));
   delta=4098.*(0.6108.*exp(17.27.*Tmean(i)./(Tmean(i)+237.3)))./(Tmean(i)+237.3).^2;
    G(i)=0.07*(Tmean(i+1)-Tmean(i-1));
    
eto(i)=((0.408*delta*(Rn(i)-G(i)))+(phi*(1600/(Tmean(i)+273))*u2(i)*(es(i)-ea(i))))/...
     (delta+(phi*(1+(0.38*u2(i)))));
 
end

end
dat(:,6)=num2cell(Rs);
dat(:,7) = num2cell(eto);
set (handles.uitable1, 'Data', dat)
        
function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Calculation
close(ETo_ASCE)
