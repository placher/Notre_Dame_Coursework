function varargout = LJTool(varargin)
% LJTOOL MATLAB code for LJTool.fig
%      LJTOOL, by itself, creates a new LJTOOL or raises the existing
%      singleton*.
%
%      H = LJTOOL returns the handle to a new LJTOOL or the handle to
%      the existing singleton*.
%
%      LJTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LJTOOL.M with the given input arguments.
%
%      LJTOOL('Property','Value',...) creates a new LJTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LJTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LJTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LJTool

% Last Modified by GUIDE v2.5 18-Mar-2015 21:38:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LJTool_OpeningFcn, ...
                   'gui_OutputFcn',  @LJTool_OutputFcn, ...
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


% --- Executes just before LJTool is made visible.
function LJTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LJTool (see VARARGIN)

% Choose default command line output for LJTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LJTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LJTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function Aslider_Callback(hObject, eventdata, handles)
% hObject    handle to Aslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%get current value of slider
myVal = handles.Aslider.Value;

%set current value of edit box
myString = num2str(myVal);
handles.Aedit.String = myString;
plotLJ(handles)

% --- Executes during object creation, after setting all properties.
function Aslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Aslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Bslider_Callback(hObject, eventdata, handles)
% hObject    handle to Bslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%get current value of slider
myVal = handles.Bslider.Value;

%set current value of edit box
myString = num2str(myVal);
handles.Bedit.String = myString;
plotLJ(handles)

% --- Executes during object creation, after setting all properties.
function Bslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Rslider_Callback(hObject, eventdata, handles)
% hObject    handle to Rslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%get current value of slider
myVal = handles.Rslider.Value;

%set current value of edit box
myString = num2str(myVal);
handles.Redit.String = myString;
plotLJ(handles)

% --- Executes during object creation, after setting all properties.
function Rslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Phislider_Callback(hObject, eventdata, handles)
% hObject    handle to Phislider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%get current value of slider
myVal = handles.Phislider.Value;

%set current value of edit box
myString = num2str(myVal);
handles.Phiedit.String = myString;
plotLJ(handles)

% --- Executes during object creation, after setting all properties.
function Phislider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Phislider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Aedit_Callback(hObject, eventdata, handles)
% hObject    handle to Aedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Aedit as text
%        str2double(get(hObject,'String')) returns contents of Aedit as a double

%get current value of edit box
myString = handles.Aedit.String;
%convert string to a number
myVal = str2double(myString);

%set the value of the slider
handles.Aslider.Value = myVal;
plotLJ(handles)

% --- Executes during object creation, after setting all properties.
function Aedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Aedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Bedit_Callback(hObject, eventdata, handles)
% hObject    handle to Bedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Bedit as text
%        str2double(get(hObject,'String')) returns contents of Bedit as a double

%get current value of edit box
myString = handles.Bedit.String;
%convert string to a number
myVal = str2double(myString);

%set the value of the slider
handles.Bedit.Value = myVal;
plotLJ(handles)

% --- Executes during object creation, after setting all properties.
function Bedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Redit_Callback(hObject, eventdata, handles)
% hObject    handle to Redit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Redit as text
%        str2double(get(hObject,'String')) returns contents of Redit as a double

%get current value of edit box
myString = handles.Redit.String;
%convert string to a number
myVal = str2double(myString);

%set the value of the slider
handles.Rslider.Value = myVal;
plotLJ(handles)

% --- Executes during object creation, after setting all properties.
function Redit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Redit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Phiedit_Callback(hObject, eventdata, handles)
% hObject    handle to Phiedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Phiedit as text
%        str2double(get(hObject,'String')) returns contents of Phiedit as a double

%get current value of edit box
myString = handles.Phiedit.String;
%convert string to a number
myVal = str2double(myString);

%set the value of the slider
handles.Phiedit.Value = myVal;
plotLJ(handles)

% --- Executes during object creation, after setting all properties.
function Phiedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Phiedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
