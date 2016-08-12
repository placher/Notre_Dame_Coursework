function varargout = StartToolS2(varargin)
% STARTTOOLS2 MATLAB code for StartToolS2.fig
%      STARTTOOLS2, by itself, creates a new STARTTOOLS2 or raises the existing
%      singleton*.
%
%      H = STARTTOOLS2 returns the handle to a new STARTTOOLS2 or the handle to
%      the existing singleton*.
%
%      STARTTOOLS2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STARTTOOLS2.M with the given input arguments.
%
%      STARTTOOLS2('Property','Value',...) creates a new STARTTOOLS2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before StartToolS2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to StartToolS2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help StartToolS2

% Last Modified by GUIDE v2.5 24-Feb-2015 11:18:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @StartToolS2_OpeningFcn, ...
                   'gui_OutputFcn',  @StartToolS2_OutputFcn, ...
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


% --- Executes just before StartToolS2 is made visible.
function StartToolS2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to StartToolS2 (see VARARGIN)

% Choose default command line output for StartToolS2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
disp(['About to show you my amazing button']);
% UIWAIT makes StartToolS2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = StartToolS2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in PushMeButton.
function PushMeButton_Callback(hObject, eventdata, handles)
% hObject    handle to PushMeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%this makes myVal keep its value even when the function ends
persistent myVal;

%this statement sets the value to 0 the first time it is called
if isempty(myVal)
    myVal = 0;
end
myVal = myVal+1;
if myVal == 1
    disp(['You pushed me ',num2str(myVal),' time.'])
elseif myVal > 1 && myVal < 14
    disp(['You pushed me ',num2str(myVal),' times.'])
else
    disp(['Stop pushing me'])
end