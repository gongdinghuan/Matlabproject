function varargout = l_avg(varargin)
% L_AVG MATLAB code for l_avg.fig
%      L_AVG, by itself, creates a new L_AVG or raises the existing
%      singleton*.
%
%      H = L_AVG returns the handle to a new L_AVG or the handle to
%      the existing singleton*.
%
%      L_AVG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in L_AVG.M with the given input arguments.
%
%      L_AVG('Property','Value',...) creates a new L_AVG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before l_avg_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to l_avg_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help l_avg

% Last Modified by GUIDE v2.5 31-May-2019 19:17:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @l_avg_OpeningFcn, ...
                   'gui_OutputFcn',  @l_avg_OutputFcn, ...
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


% --- Executes just before l_avg is made visible.
function l_avg_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to l_avg (see VARARGIN)

% Choose default command line output for l_avg
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
s_file_name = char(getappdata(0,'h_move'));
set(handles.edit1,'string',s_file_name);
% UIWAIT makes l_avg wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = l_avg_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=get(handles.edit1,'string');
if exist(file_name,'file')==0
   disp('file not exist！');
else
  I = imread(file_name);
  ave1=fspecial('average',3);
  I = rgb2gray(I);
  K1 = filter2(ave1,I)/255; 
  figure(1);
  subplot(1,2,1)
  imshow(I);
  title('原图');
  subplot(1,2,2)
  imshow(K1);
  title('均值处理后');
  imwrite(K1,strcat('avg_',file_name));
  set(handles.edit2,'string',strcat('avg_',file_name));
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=get(handles.edit1,'string');
if exist(file_name,'file')==0
   disp('file not exist！');
else
  I = imread(file_name);
  ave1=fspecial('average',5);
  I = rgb2gray(I);
  K1 = filter2(ave1,I)/255; 
  figure(1);
  subplot(1,2,1)
  imshow(I);
  title('原图');
  subplot(1,2,2)
  imshow(K1);
  title('均值处理后');
  imwrite(K1,strcat('avg_',file_name));
  set(handles.edit2,'string',strcat('avg_',file_name));
end
