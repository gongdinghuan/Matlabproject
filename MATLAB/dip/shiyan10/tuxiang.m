function varargout = tuxiang(varargin)
% TUXIANG MATLAB code for tuxiang.fig
%      TUXIANG, by itself, creates a new TUXIANG or raises the existing
%      singleton*.
%
%      H = TUXIANG returns the handle to a new TUXIANG or the handle to
%      the existing singleton*.
%
%      TUXIANG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUXIANG.M with the given input arguments.
%
%      TUXIANG('Property','Value',...) creates a new TUXIANG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tuxiang_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tuxiang_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tuxiang

% Last Modified by GUIDE v2.5 12-Jun-2019 14:45:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tuxiang_OpeningFcn, ...
                   'gui_OutputFcn',  @tuxiang_OutputFcn, ...
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


% --- Executes just before tuxiang is made visible.
function tuxiang_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tuxiang (see VARARGIN)

% Choose default command line output for tuxiang
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tuxiang wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tuxiang_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axis off  %%关闭坐标轴显示  
[filename pathname] =uigetfile({'*.jpg';'*.bmp';'*.*'},'打开图片');
global str;
str=[pathname filename]; 
global im;
%%打开图像  
im=imread(str);  
%%打开axes1的句柄 进行axes1的操作  
axes(handles.axes1);  
%%在axes1中显示 图像  
imshow(im);  


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%图像处理部分
global im;
X=im;
I=rgb2gray(X);
BW1=edge(I,'canny'); %用canny算子进行边缘检测
path1='/Users/gongdinghuan/Documents/MATLAB/dip/shiyan10/tuxiang/'; 
name='lena.jpg';
imwrite(BW1,[path1 name]);

str1=[path1 name];  
im1=imread(str1);  
axes(handles.axes2);  
imshow(im1);title('边缘检测');  


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
X=im;
I=rgb2gray(X);
BW1=flip(I,2); %用canny算子进行边缘检测
path1='/Users/gongdinghuan/Documents/MATLAB/dip/shiyan10/tuxiang/'; 
name='lena.jpg';
imwrite(BW1,[path1 name]);

str1=[path1 name];  
im1=imread(str1);  
axes(handles.axes2);  
imshow(im1);title('水平镜像');  


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
X=im;
I=X;
c=str2num(get(handles.edit3,'String'));
BW1=imrotate(I, c); %用canny算子进行边缘检测
path1='/Users/gongdinghuan/Documents/MATLAB/dip/shiyan10/tuxiang/'; 
name='lena3.jpg';
imwrite(BW1,[path1 name]);

str1=[path1 name];  
im1=imread(str1);  
axes(handles.axes2);  
imshow(im1);title('旋转后图像');  


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
X=im;
I=rgb2gray(X);
a = str2num(get(handles.edit1,'String'));
d = get(handles.edit4,'String');
BW1=imnoise(I,d,a); %用canny算子进行边缘检测
path1='/Users/gongdinghuan/Documents/MATLAB/dip/shiyan10/tuxiang/'; 
name='lena.jpg';
imwrite(BW1,[path1 name]);

str1=[path1 name];  
im1=imread(str1);  
axes(handles.axes2);  
imshow(im1);title('添加噪声'); 



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


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
X=im;
I=rgb2gray(X);
h=[1,2,1;0,0,0;-1,-2,-1];%Sobel算子
BW1=filter2(h,I); 
path1='/Users/gongdinghuan/Documents/MATLAB/dip/shiyan10/tuxiang/'; 
name='lena.jpg';
imwrite(BW1,[path1 name]);

str1=[path1 name];  
im1=imread(str1);  
axes(handles.axes2);  
imshow(im1);title('Sobel算子锐化图像');  


% --- Executes on selection change in popupmenu1.




% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
X=im;
I=im2bw(X);
img2 = not(I);
[B,L] = bwboundaries(img2);
path1='/Users/gongdinghuan/Documents/MATLAB/dip/shiyan10/tuxiang/'; 
name='lena1.jpg';
imwrite(img2,[path1 name]);

str1=[path1 name];  
im1=imread(str1);  
axes(handles.axes2);  
imshow(im1);title('标记边界');  


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
X=im;
I=im2bw(X);
img2 = not(I);
[B,L] = bwboundaries(img2);
for k = 1:length(B)
boundary = B{k};
plot(boundary(:,2),boundary(:,1),'g','LineWidth',2); end
[I,N] = bwlabel(img2);
img_rgb = label2rgb(L,'hsv',[.5 .5 .5],'shuffle');
path1='/Users/gongdinghuan/Documents/MATLAB/dip/shiyan10/tuxiang/'; 
name='lena1.jpg';
imwrite(img_rgb,[path1 name]);

str1=[path1 name];  
im1=imread(str1);  
axes(handles.axes2);  
imshow(im1);title('标记区域'); 


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
X=im;
I=rgb2gray(X);
[width height]=size(I);
th=str2num(get(handles.edit2,'String')); 
for i=1:width
    for j=1:height 
        if(I(i,j)<th)
            BW1(i,j)=0; 
        else
            BW1(i,j)=1; 
        end
    end
end
path1='/Users/gongdinghuan/Documents/MATLAB/dip/shiyan10/tuxiang/'; 
name='lena.jpg';
imwrite(BW1,[path1 name]);

str1=[path1 name];  
im1=imread(str1);  
axes(handles.axes2);  
imshow(im1);title('全局阈值'); 



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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
X=im;
I=rgb2gray(X);
a = str2num(get(handles.edit1,'String'));
d = get(handles.edit4,'String');
BW1=imnoise(I,d,a); %用canny算子进行边缘检测
N=medfilt2(BW1,[5 5]);
path1='/Users/gongdinghuan/Documents/MATLAB/dip/shiyan10/tuxiang/'; 
name='lena.jpg';
imwrite(N,[path1 name]);

str1=[path1 name];  
im1=imread(str1);  
axes(handles.axes2);  
imshow(im1);title('去噪后图像'); 
