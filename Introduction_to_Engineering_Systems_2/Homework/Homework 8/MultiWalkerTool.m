function varargout = MultiWalkerTool(varargin)
% MULTIWALKERTOOL MATLAB code for MultiWalkerTool.fig
%      MULTIWALKERTOOL, by itself, creates a new MULTIWALKERTOOL or raises the existing
%      singleton*.
%
%      H = MULTIWALKERTOOL returns the handle to a new MULTIWALKERTOOL or the handle to
%      the existing singleton*.
%
%      MULTIWALKERTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MULTIWALKERTOOL.M with the given input arguments.
%
%      MULTIWALKERTOOL('Property','Value',...) creates a new MULTIWALKERTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MultiWalkerTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MultiWalkerTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MultiWalkerTool

% Last Modified by GUIDE v2.5 08-Apr-2015 20:49:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MultiWalkerTool_OpeningFcn, ...
                   'gui_OutputFcn',  @MultiWalkerTool_OutputFcn, ...
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


% --- Executes just before MultiWalkerTool is made visible.
function MultiWalkerTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MultiWalkerTool (see VARARGIN)

% Choose default command line output for MultiWalkerTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MultiWalkerTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MultiWalkerTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function NwText_Callback(hObject, eventdata, handles)
% hObject    handle to NwText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NwText as text
%        str2double(get(hObject,'String')) returns contents of NwText as a double


% --- Executes during object creation, after setting all properties.
function NwText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NwText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NsText_Callback(hObject, eventdata, handles)
% hObject    handle to NsText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NsText as text
%        str2double(get(hObject,'String')) returns contents of NsText as a double


% --- Executes during object creation, after setting all properties.
function NsText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NsText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function rSlider_Callback(hObject, eventdata, handles)
% hObject    handle to rSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function rSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function x0Slider_Callback(hObject, eventdata, handles)
% hObject    handle to x0Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function x0Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function y0Slider_Callback(hObject, eventdata, handles)
% hObject    handle to y0Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function y0Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y0Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in abortButton.
function abortButton_Callback(hObject, eventdata, handles)
% hObject    handle to abortButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

disp('Type "quit" to Exit MATLAB or "dbquit" to Continue');
keyboard;

% --- Executes on button press in runButton.
function runButton_Callback(hObject, eventdata, handles)
% hObject    handle to runButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

MultiWalkerF(handles)
