function varargout = ManhattanProjectTool(varargin)
% MANHATTANPROJECTTOOL MATLAB code for ManhattanProjectTool.fig
%      MANHATTANPROJECTTOOL, by itself, creates a new MANHATTANPROJECTTOOL or raises the existing
%      singleton*.
%
%      H = MANHATTANPROJECTTOOL returns the handle to a new MANHATTANPROJECTTOOL or the handle to
%      the existing singleton*.
%
%      MANHATTANPROJECTTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MANHATTANPROJECTTOOL.M with the given input arguments.
%
%      MANHATTANPROJECTTOOL('Property','Value',...) creates a new MANHATTANPROJECTTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ManhattanProjectTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ManhattanProjectTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ManhattanProjectTool

% Last Modified by GUIDE v2.5 20-Apr-2015 16:11:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ManhattanProjectTool_OpeningFcn, ...
                   'gui_OutputFcn',  @ManhattanProjectTool_OutputFcn, ...
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


% --- Executes just before ManhattanProjectTool is made visible.
function ManhattanProjectTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ManhattanProjectTool (see VARARGIN)

% Choose default command line output for ManhattanProjectTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ManhattanProjectTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = ManhattanProjectTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function xSlider_Callback(hObject, eventdata, handles)
% hObject    handle to xSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%sync slider to edit box
a=handles.xSlider.Value;
handles.xText.String=num2str(a);

% --- Executes during object creation, after setting all properties.
function xSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function ySlider_Callback(hObject, eventdata, handles)
% hObject    handle to ySlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%sync slider to edit box
a=handles.ySlider.Value;
handles.yText.String=num2str(a);

% --- Executes during object creation, after setting all properties.
function ySlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ySlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function xText_Callback(hObject, eventdata, handles)
% hObject    handle to xText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xText as text
%        str2double(get(hObject,'String')) returns contents of xText as a double

%sync edit box to slider
astr=handles.xText.String;
handles.xSlider.Value=str2double(astr);



% --- Executes during object creation, after setting all properties.
function xText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yText_Callback(hObject, eventdata, handles)
% hObject    handle to yText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yText as text
%        str2double(get(hObject,'String')) returns contents of yText as a double

%sync edit box to slider
astr=handles.yText.String;
handles.ySlider.Value=str2double(astr);

% --- Executes during object creation, after setting all properties.
function yText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in runButton.
function runButton_Callback(hObject, eventdata, handles)
% hObject    handle to runButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ManhattanF3(handles);


function ximpactText_Callback(hObject, eventdata, handles)
% hObject    handle to ximpactText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ximpactText as text
%        str2double(get(hObject,'String')) returns contents of ximpactText as a double


% --- Executes during object creation, after setting all properties.
function ximpactText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ximpactText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yimpactText_Callback(hObject, eventdata, handles)
% hObject    handle to yimpactText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yimpactText as text
%        str2double(get(hObject,'String')) returns contents of yimpactText as a double


% --- Executes during object creation, after setting all properties.
function yimpactText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yimpactText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function zimpactText_Callback(hObject, eventdata, handles)
% hObject    handle to zimpactText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zimpactText as text
%        str2double(get(hObject,'String')) returns contents of zimpactText as a double


% --- Executes during object creation, after setting all properties.
function zimpactText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zimpactText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L2vAngleText_Callback(hObject, eventdata, handles)
% hObject    handle to L2vAngleText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L2vAngleText as text
%        str2double(get(hObject,'String')) returns contents of L2vAngleText as a double


% --- Executes during object creation, after setting all properties.
function L2vAngleText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L2vAngleText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L2hAngleText_Callback(hObject, eventdata, handles)
% hObject    handle to L2hAngleText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L2hAngleText as text
%        str2double(get(hObject,'String')) returns contents of L2hAngleText as a double


% --- Executes during object creation, after setting all properties.
function L2hAngleText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L2hAngleText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L1vAngleText_Callback(hObject, eventdata, handles)
% hObject    handle to L1vAngleText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L1vAngleText as text
%        str2double(get(hObject,'String')) returns contents of L1vAngleText as a double


% --- Executes during object creation, after setting all properties.
function L1vAngleText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L1vAngleText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function L1vAngleSlider_Callback(hObject, eventdata, handles)
% hObject    handle to L1vAngleSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a=handles.L1vAngleSlider.Value;
if a<32.5
    handles.L1vAngleSlider.Value=30;
elseif a<37.5
    handles.L1vAngleSlider.Value=35;
elseif a<42.5
    handles.L1vAngleSlider.Value=40;
elseif a<47.5
    handles.L1vAngleSlider.Value=45;
else handles.L1vAngleSlider.Value=50;
end     
handles.L1vAngleText.String=num2str(handles.L1vAngleSlider.Value);



% --- Executes during object creation, after setting all properties.
function L1vAngleSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L1vAngleSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function L1hAngleSlider_Callback(hObject, eventdata, handles)
% hObject    handle to L1hAngleSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
a=handles.L1hAngleSlider.Value;
handles.L1hAngleText.String=num2str(a);


% --- Executes during object creation, after setting all properties.
function L1hAngleSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L1hAngleSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function L1hAngleText_Callback(hObject, eventdata, handles)
% hObject    handle to L1hAngleText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L1hAngleText as text
%        str2double(get(hObject,'String')) returns contents of L1hAngleText as a double


% --- Executes during object creation, after setting all properties.
function L1hAngleText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L1hAngleText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function collisionText_Callback(hObject, eventdata, handles)
% hObject    handle to collisionText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of collisionText as text
%        str2double(get(hObject,'String')) returns contents of collisionText as a double


% --- Executes during object creation, after setting all properties.
function collisionText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to collisionText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
