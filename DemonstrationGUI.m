function varargout = DemonstrationGUI(varargin)
% DEMONSTRATIONGUI MATLAB code for DemonstrationGUI.fig
%      DEMONSTRATIONGUI, by itself, creates a new DEMONSTRATIONGUI or raises the existing
%      singleton*.
%
%      H = DEMONSTRATIONGUI returns the handle to a new DEMONSTRATIONGUI or the handle to
%      the existing singleton*.
%
%      DEMONSTRATIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMONSTRATIONGUI.M with the given input arguments.
%
%      DEMONSTRATIONGUI('Property','Value',...) creates a new DEMONSTRATIONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DemonstrationGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DemonstrationGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DemonstrationGUI

% Last Modified by GUIDE v2.5 07-Mar-2013 03:18:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DemonstrationGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @DemonstrationGUI_OutputFcn, ...
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


% --- Executes just before DemonstrationGUI is made visible.
function DemonstrationGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DemonstrationGUI (see VARARGIN)

% Choose default command line output for DemonstrationGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DemonstrationGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DemonstrationGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnFile.
function btnFile_Callback(hObject, eventdata, handles)
% hObject    handle to btnFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
addpath voicebox;
[filename, directoryname] = uigetfile(['*.wav']);
filepath = strcat(directoryname, filename);
[wav{1}, fs] = readwav(filepath);
wav{1} = RemoveSilence(wav{1},fs);
handles.player = audioplayer(wav{1}, fs);
plot(handles.axesWave, wav{1});
result = demoClassify(wav, fs)
result2 = imresize(result, [1, length(wav{1})], 'nearest');

% Update handles structure
guidata(hObject, handles);
reds = find(result2 == 1);
hold on, plot(result2,'r.')
hold off


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1



% --- Executes on button press in btnPause.
function btnPause_Callback(hObject, eventdata, handles)
% hObject    handle to btnPause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pause(handles.player);

% --- Executes on button press in btnStop.
function btnStop_Callback(hObject, eventdata, handles)
% hObject    handle to btnStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.player);


% --- Executes on button press in btnPlay.
function btnPlay_Callback(hObject, eventdata, handles)
% hObject    handle to btnPlay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if( get(hObject,'Value') == get(hObject,'Max'))
    resume(handles.player);
else
    pause(handles.player);
end;
% Hint: get(hObject,'Value') returns toggle state of btnPlay
