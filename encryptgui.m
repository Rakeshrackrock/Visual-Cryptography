function varargout = encryptgui(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @encryptgui_OpeningFcn, ...
                   'gui_OutputFcn',  @encryptgui_OutputFcn, ...
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
function encryptgui_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
function varargout = encryptgui_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function pushbutton1_Callback(hObject, eventdata, handles)
global im; global width; global height;
X = uigetfile('*.jpg;*.png');
im = imread(X);
[width, height, ~] = size(im);
axes(handles.axes1)
imshow(im);
guidata(hObject, handles);


function edit1_Callback(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton2_Callback(hObject, eventdata, handles)
global width; global height; global im;
keyvalue = get(handles.edit1,'String');
key = keyGen(width*height,keyvalue);
encrypted_im = imageProcess(im,key);
figure();
imshow(encrypted_im);

k = get(handles.edit2,'String');
k = str2num(k);
n = get(handles.edit3,'String');
n = str2num(n);
im = encrypted_im;
kn_encrypt(k,n,im);
guidata(hObject, handles);

function edit2_Callback(hObject, eventdata, handles)
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit3_Callback(hObject, eventdata, handles)
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
