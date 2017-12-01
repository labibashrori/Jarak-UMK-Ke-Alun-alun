function varargout = gui_kamal(varargin)
% GUI_KAMAL MATLAB code for gui_kamal.fig
%      GUI_KAMAL, by itself, creates a new GUI_KAMAL or raises the existing
%      singleton*.
%
%      H = GUI_KAMAL returns the handle to a new GUI_KAMAL or the handle to
%      the existing singleton*.
%
%      GUI_KAMAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_KAMAL.M with the given input arguments.
%
%      GUI_KAMAL('Property','Value',...) creates a new GUI_KAMAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_kamal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_kamal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_kamal

% Last Modified by GUIDE v2.5 22-Nov-2017 19:40:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_kamal_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_kamal_OutputFcn, ...
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


% --- Executes just before gui_kamal is made visible.
function gui_kamal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_kamal (see VARARGIN)

% Choose default command line output for gui_kamal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_kamal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_kamal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtkecepatan_Callback(hObject, eventdata, handles)
% hObject    handle to txtkecepatan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtkecepatan as text
%        str2double(get(hObject,'String')) returns contents of txtkecepatan as a double


% --- Executes during object creation, after setting all properties.
function txtkecepatan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtkecepatan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtjarak_Callback(hObject, eventdata, handles)
% hObject    handle to txtjarak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtjarak as text
%        str2double(get(hObject,'String')) returns contents of txtjarak as a double
txtjarak=str2double (get(hObject,'string'));
handles.txtjarak=txtjarak;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function txtjarak_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtjarak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtkerataan_Callback(hObject, eventdata, handles)
% hObject    handle to txtkerataan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtkerataan as text
%        str2double(get(hObject,'String')) returns contents of txtkerataan as a double
txtkerataan=str2double (get(hObject,'string'));
handles.txtkerataan=txtkerataan;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function txtkerataan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtkerataan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnhitung.
function btnhitung_Callback(hObject, eventdata, handles)
% hObject    handle to btnhitung (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=readfis('kamal')
out=evalfis([handles.txtkerataan handles.txtjarak],a)
set(handles.txtkecepatan, 'string', out);

if out>=1 && out>=25
    set(handles.txthasil, 'string', 'Cepat');
elseif out>=15 && out>=45
    set(handles.txthasil, 'string', 'Sedang');
else
    set(handles.txthasil, 'string', 'Lambat');
end;


% --- Executes on button press in btnkeluar.
function btnkeluar_Callback(hObject, eventdata, handles)
% hObject    handle to btnkeluar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close



function txthasil_Callback(hObject, eventdata, handles)
% hObject    handle to txthasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txthasil as text
%        str2double(get(hObject,'String')) returns contents of txthasil as a double


% --- Executes during object creation, after setting all properties.
function txthasil_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txthasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
