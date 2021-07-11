function varargout = decryptgui(varargin)
gui_Singleton = 1; 
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @decryptgui_OpeningFcn, ...
                   'gui_OutputFcn',  @decryptgui_OutputFcn, ...
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
function decryptgui_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles)
function varargout = decryptgui_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function pushbutton1_Callback(hObject, eventdata, handles)
keyvalue = get(handles.edit1,'String');
k = get(handles.edit2,'String');
k = str2num(k);

[width height channel] = size(imread('share1.png'));
key = keyGen(width*height,keyvalue);
kn_decrypt(k);
figure();
Y = imshow('Kn_merge.png');

output_image = imageProcess(imread('Kn_merge.png'),key);
imwrite(output_image,'Final_output.png','png');
axes(handles.axes1)
imshow('Final_output.png');
guidata(hObject, handles);

function edit1_Callback(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
