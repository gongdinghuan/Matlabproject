function varargout = rrshape(varargin)
% RRSHAPE MATLAB code for rrshape.fig
%      RRSHAPE, by itself, creates a new RRSHAPE or raises the existing
%      singleton*.
%
%      H = RRSHAPE returns the handle to a new RRSHAPE or the handle to
%      the existing singleton*.
%
%      RRSHAPE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RRSHAPE.M with the given input arguments.
%
%      RRSHAPE('Property','Value',...) creates a new RRSHAPE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rrshape_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rrshape_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rrshape

% Last Modified by GUIDE v2.5 29-May-2019 20:19:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rrshape_OpeningFcn, ...
                   'gui_OutputFcn',  @rrshape_OutputFcn, ...
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


% --- Executes just before rrshape is made visible.
function rrshape_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rrshape (see VARARGIN)

% Choose default command line output for rrshape
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
s_file_name = char(getappdata(0,'h_move'));
set(handles.edit1,'string',s_file_name);
% UIWAIT makes rrshape wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = rrshape_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=get(handles.edit1,'string');
if exist(file_name,'file')==0
   disp('file not exist£¡');
else
  rsize_num =get(handles.edit3,'string');
  rsize_num = str2num(rsize_num);
  I = imread(file_name);
  I1 = imresize(I,rsize_num, 'nearest');
  figure(1);imshow(I1)
  imwrite(I1,strcat('nearest_',file_name));
  set(handles.edit2,'string',strcat('nearest_',file_name));
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=get(handles.edit1,'string');
if exist(file_name,'file')==0
   disp('file not exist£¡');
else
  rsize_num = get(handles.edit3,'string');
  rsize_num = str2num(rsize_num);
  I = imread(file_name);
  I1 = imresize(I,rsize_num, 'bilinear');
  figure(1);imshow(I1)
  imwrite(I1,strcat('bilinear_',file_name));
  set(handles.edit2,'string',strcat('bilinear_',file_name));
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=get(handles.edit1,'string');
if exist(file_name,'file')==0
   disp('file not exist£¡');
else
  rsize_num = get(handles.edit3,'string');
  rsize_num = str2num(rsize_num);
  I = imread(file_name);
  I1 = imresize(I,rsize_num, 'bicubic');
  figure(1);imshow(I1)
  imwrite(I1,strcat('bicubic_',file_name));
  set(handles.edit2,'string',strcat('bicubic_',file_name));
end
