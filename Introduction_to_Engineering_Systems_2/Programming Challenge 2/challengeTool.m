function varargout = challengeTool(varargin)
% CHALLENGETOOL MATLAB code for challengeTool.fig
%      CHALLENGETOOL, by itself, creates a new CHALLENGETOOL or raises the existing
%      singleton*.
%
%      H = CHALLENGETOOL returns the handle to a new CHALLENGETOOL or the handle to
%      the existing singleton*.
%
%      CHALLENGETOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHALLENGETOOL.M with the given input arguments.
%
%      CHALLENGETOOL('Property','Value',...) creates a new CHALLENGETOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before challengeTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to challengeTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help challengeTool

% Last Modified by GUIDE v2.5 02-Apr-2015 11:12:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @challengeTool_OpeningFcn, ...
                   'gui_OutputFcn',  @challengeTool_OutputFcn, ...
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


% --- Executes just before challengeTool is made visible.
function challengeTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to challengeTool (see VARARGIN)

% Choose default command line output for challengeTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes challengeTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);

plotFuncF(handles)

% --- Outputs from this function are returned to the command line.
function varargout = challengeTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function bSlider_Callback(hObject, eventdata, handles)
% hObject    handle to bSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.bText.String = num2str(handles.bSlider.Value);
plotFuncF(handles)

% --- Executes during object creation, after setting all properties.
function bSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function bText_Callback(hObject, eventdata, handles)
% hObject    handle to bText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bText as text
%        str2double(get(hObject,'String')) returns contents of bText as a double

handles.bSlider.Value = str2double(handles.bText.String);
plotFuncF(handles)

% --- Executes during object creation, after setting all properties.
function bText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in gridonCheckbox.
function gridonCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to gridonCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gridonCheckbox

plotFuncF(handles)
