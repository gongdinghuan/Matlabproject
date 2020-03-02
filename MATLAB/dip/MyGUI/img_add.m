function varargout = img_add(varargin)
% IMG_ADD MATLAB code for img_add.fig
%      IMG_ADD, by itself, creates a new IMG_ADD or raises the existing
%      singleton*.
%
%      H = IMG_ADD returns the handle to a new IMG_ADD or the handle to
%      the existing singleton*.
%
%      IMG_ADD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMG_ADD.M with the given input arguments.
%
%      IMG_ADD('Property','Value',...) creates a new IMG_ADD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before img_add_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to img_add_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help img_add

% Last Modified by GUIDE v2.5 29-May-2019 19:08:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @img_add_OpeningFcn, ...
                   'gui_OutputFcn',  @img_add_OutputFcn, ...
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


% --- Executes just before img_add is made visible.
function img_add_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to img_add (see VARARGIN)

% Choose default command line output for img_add
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes img_add wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = img_add_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=char(get(handles.edit1,'string'));
if exist(file_name,'file')==0
   disp('file not exist！');
else
    file_name2=char(get(handles.edit2,'string'));
    if strfind(file_name2,'.') & exist(file_name2,'file')~=0
        I = imread(file_name);
        J = imread(file_name2);
        [m,n,l]=size(J);
        I = imresize(I,[m,n]);
        K = imadd(I,J);
        figure(1);
        imshow(K);
    else
        I = imread(file_name);
        add_num = str2num(file_name2);
        K = imadd(I,add_num);
        figure(1);
        imshow(K);
    end
  
  imwrite(K,strcat('add_',file_name));
  set(handles.edit3,'string',strcat('输出：add_',file_name));
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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=char(get(handles.edit1,'string'));
if exist(file_name,'file')==0
   disp('file not exist！');
else
    file_name2=char(get(handles.edit2,'string'));
    if strfind(file_name2,'.') & exist(file_name2,'file')~=0
        I = imread(file_name);
        J = imread(file_name2);
        [m,n,l]=size(J);
        I = imresize(I,[m,n]);
        K = imsubtract(I,J);
        figure(1);
        imshow(K);
    else
        I = imread(file_name);
        subtract_num = str2num(file_name2);
        K = imsubtract(I,subtract_num);
        figure(1);
        imshow(K);
    end
  
  imwrite(K,strcat('subtract_',file_name));
  set(handles.edit3,'string',strcat('输出：subtract_',file_name));
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=char(get(handles.edit1,'string'));
if exist(file_name,'file')==0
   disp('file not exist！');
else
    file_name2=char(get(handles.edit2,'string'));
    if strfind(file_name2,'.') & exist(file_name2,'file')~=0
        I = imread(file_name);
        J = imread(file_name2);
        [m,n,l]=size(J);
        I = imresize(I,[m,n]);
        K = immultiply(I,J);
        figure(1);
        imshow(K);
    else
        I = imread(file_name);
        multiply_num = str2num(file_name2);
        K = immultiply(I,multiply_num);
        figure(1);
        imshow(K);
    end
  
  imwrite(K,strcat('multiply_',file_name));
  set(handles.edit3,'string',strcat('输出：multiply_',file_name));
end

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=char(get(handles.edit1,'string'));
if exist(file_name,'file')==0
   disp('file not exist！');
else
    file_name2=char(get(handles.edit2,'string'));
    if strfind(file_name2,'.') & exist(file_name2,'file')~=0
        I = imread(file_name);
        J = imread(file_name2);
        [m,n,l]=size(J);
        I = imresize(I,[m,n]);
        K = imdivide(I,J);
        figure(1);
        imshow(K);
    else
        I = imread(file_name);
        divide_num = str2num(file_name2);
        K = imdivide(I,divide_num);
        figure(1);
        imshow(K);
    end
  
  imwrite(K,strcat('divide_',file_name));
  set(handles.edit3,'string',strcat('输出：divide_',file_name));
end
