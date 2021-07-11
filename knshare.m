function varargout = knshare(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @knshare_OpeningFcn, ...
                   'gui_OutputFcn',  @knshare_OutputFcn, ...
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

function knshare_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = knshare_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function pushbutton1_Callback(hObject, eventdata, handles)
run encryptgui

function pushbutton2_Callback(hObject, eventdata, handles)
run decryptgui