function varargout = TriadTool(varargin)
% TRIADTOOL MATLAB code for TriadTool.fig
%      TRIADTOOL, by itself, creates a new TRIADTOOL or raises the existing
%      singleton*.
%
%      H = TRIADTOOL returns the handle to a new TRIADTOOL or the handle to
%      the existing singleton*.
%
%      TRIADTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRIADTOOL.M with the given input arguments.
%
%      TRIADTOOL('Property','Value',...) creates a new TRIADTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TriadTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TriadTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TriadTool

% Last Modified by GUIDE v2.5 08-Apr-2015 19:16:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TriadTool_OpeningFcn, ...
                   'gui_OutputFcn',  @TriadTool_OutputFcn, ...
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


% --- Executes just before TriadTool is made visible.
function TriadTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TriadTool (see VARARGIN)

% Choose default command line output for TriadTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TriadTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TriadTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function frequencySlider_Callback(hObject, eventdata, handles)
% hObject    handle to frequencySlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

TriadF(handles)

% --- Executes during object creation, after setting all properties.
function frequencySlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frequencySlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in playsoundCheckbox.
function playsoundCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to playsoundCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of playsoundCheckbox

TriadF(handles)

function durationText_Callback(hObject, eventdata, handles)
% hObject    handle to durationText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of durationText as text
%        str2double(get(hObject,'String')) returns contents of durationText as a double

TriadF(handles)

% --- Executes during object creation, after setting all properties.
function durationText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to durationText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tonicCheckbox.
function tonicCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to tonicCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tonicCheckbox

TriadF(handles)

% --- Executes on button press in majorthirdCheckbox.
function majorthirdCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to majorthirdCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of majorthirdCheckbox

TriadF(handles)

% --- Executes on button press in perfectfifthCheckbox.
function perfectfifthCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to perfectfifthCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of perfectfifthCheckbox

TriadF(handles)

% --- Executes on button press in octaveCheckbox.
function octaveCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to octaveCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of octaveCheckbox

TriadF(handles)
