function varargout = integraltool(varargin)
% INTEGRALTOOL MATLAB code for integraltool.fig
%      INTEGRALTOOL, by itself, creates a new INTEGRALTOOL or raises the existing
%      singleton*.
%
%      H = INTEGRALTOOL returns the handle to a new INTEGRALTOOL or the handle to
%      the existing singleton*.
%
%      INTEGRALTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTEGRALTOOL.M with the given input arguments.
%
%      INTEGRALTOOL('Property','Value',...) creates a new INTEGRALTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before integraltool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to integraltool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help integraltool

% Last Modified by GUIDE v2.5 25-Mar-2015 21:23:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @integraltool_OpeningFcn, ...
                   'gui_OutputFcn',  @integraltool_OutputFcn, ...
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


% --- Executes just before integraltool is made visible.
function integraltool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to integraltool (see VARARGIN)

% Choose default command line output for integraltool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes integraltool wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = integraltool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function xleftslider_Callback(hObject, eventdata, handles)
% hObject    handle to xleftslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%get current value of slider
myVal = handles.xleftslider.Value;

%set current value of edit box
myString = num2str(myVal);
handles.xleftEdit.String = myString;
calcIntegral(handles)

% --- Executes during object creation, after setting all properties.
function xleftslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xleftslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function xrightslider_Callback(hObject, eventdata, handles)
% hObject    handle to xrightslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%get current value of slider
myVal = handles.xrightslider.Value;

%set current value of edit box
myString = num2str(myVal);
handles.xrightEdit.String = myString;
calcIntegral(handles)

% --- Executes during object creation, after setting all properties.
function xrightslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xrightslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function xleftEdit_Callback(hObject, eventdata, handles)
% hObject    handle to xleftEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xleftEdit as text
%        str2double(get(hObject,'String')) returns contents of xleftEdit as a double

%get current value of edit box
myString = handles.xleftEdit.String;
%convert string to a number
myVal = str2double(myString);

%set the value of the slider
handles.xleftslider.Value = myVal;
calcIntegral(handles)

% --- Executes during object creation, after setting all properties.
function xleftEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xleftEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xrightEdit_Callback(hObject, eventdata, handles)
% hObject    handle to xrightEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xrightEdit as text
%        str2double(get(hObject,'String')) returns contents of xrightEdit as a double

%get current value of edit box
myString = handles.xrightEdit.String;
%convert string to a number
myVal = str2double(myString);

%set the value of the slider
handles.xrightslider.Value = myVal;
calcIntegral(handles)

% --- Executes during object creation, after setting all properties.
function xrightEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xrightEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function integralEdit_Callback(hObject, eventdata, handles)
% hObject    handle to integralEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of integralEdit as text
%        str2double(get(hObject,'String')) returns contents of integralEdit as a double


% --- Executes during object creation, after setting all properties.
function integralEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to integralEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
