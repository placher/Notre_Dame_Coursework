function varargout = CoasterTool(varargin)

%Author: J. Patrick Lacher

% COASTERTOOL MATLAB code for CoasterTool.fig
%      COASTERTOOL, by itself, creates a new COASTERTOOL or raises the existing
%      singleton*.
%
%      H = COASTERTOOL returns the handle to a new COASTERTOOL or the handle to
%      the existing singleton*.
%
%      COASTERTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COASTERTOOL.M with the given input arguments.
%
%      COASTERTOOL('Property','Value',...) creates a new COASTERTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CoasterTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CoasterTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CoasterTool

% Last Modified by GUIDE v2.5 26-Feb-2015 12:05:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CoasterTool_OpeningFcn, ...
                   'gui_OutputFcn',  @CoasterTool_OutputFcn, ...
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


% --- Executes just before CoasterTool is made visible.
function CoasterTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CoasterTool (see VARARGIN)

% Choose default command line output for CoasterTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CoasterTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);
plotCoasterF(handles)

% --- Outputs from this function are returned to the command line.
function varargout = CoasterTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in plotPopUp.
function plotPopUp_Callback(hObject, eventdata, handles)
% hObject    handle to plotPopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns plotPopUp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from plotPopUp
plotCoasterF(handles)

% --- Executes during object creation, after setting all properties.
function plotPopUp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plotPopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function dSlider_Callback(hObject, eventdata, handles)
% hObject    handle to dSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%get current value of slider
myVal = handles.dSlider.Value;

%set current value of edit box
myString = num2str(myVal);
handles.PowerEditBox.String = myString;
plotCoasterF(handles)


% --- Executes during object creation, after setting all properties.
function dSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function dText_Callback(hObject, eventdata, handles)
% hObject    handle to dText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dText as text
%        str2double(get(hObject,'String')) returns contents of dText as a double

%get current value of edit box
myString = handles.dText.String;
%convert string to a number
myVal = str2double(myString);

%set the value of the slider
handles.dSlider.Value = myVal;
plotCoasterF(handles)

% --- Executes during object creation, after setting all properties.
function dText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in gridCheckbox.
function gridCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to gridCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gridCheckbox
plotCoasterF(handles)
