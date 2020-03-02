function varargout = tool_page(varargin)
% TOOL_PAGE MATLAB code for tool_page.fig
%      TOOL_PAGE, by itself, creates a new TOOL_PAGE or raises the existing
%      singleton*.
%
%      H = TOOL_PAGE returns the handle to a new TOOL_PAGE or the handle to
%      the existing singleton*.
%
%      TOOL_PAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TOOL_PAGE.M with the given input arguments.
%
%      TOOL_PAGE('Property','Value',...) creates a new TOOL_PAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tool_page_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tool_page_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tool_page

% Last Modified by GUIDE v2.5 06-Jun-2019 15:31:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tool_page_OpeningFcn, ...
                   'gui_OutputFcn',  @tool_page_OutputFcn, ...
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


% --- Executes just before tool_page is made visible.
function tool_page_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tool_page (see VARARGIN)

% Choose default command line output for tool_page
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tool_page wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tool_page_OutputFcn(hObject, eventdata, handles) 
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
  figure(1);
  imshow(file_name);
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
  gray = rgb2gray(I);
 figure(1);
  imshow(gray);
  imwrite(gray,strcat('gray_',file_name));
  set(handles.edit2,'string',strcat('gray_',file_name));
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=get(handles.edit1,'string');
if exist(file_name,'file')==0
   disp('file not exist！');
else
  I = imread(file_name);
  [X,map] = rgb2ind(I,32);
  figure(1);imshow(X,map),colorbar
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=get(handles.edit1,'string');
if exist(file_name,'file')==0
   disp('file not exist！');
else
  I = imread(file_name);
  WB = im2bw(I);
  figure(1);imshow(WB)
  imwrite(I,strcat('wb_',file_name));
  set(handles.edit2,'string',strcat('wb_',file_name));
end
% --- Executes on button press in pushbutton7.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_add
% --- Executes on button press in pushbutton7.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
send_data =get(handles.edit1,'string');
setappdata(0,'h_move',send_data);
h_move;


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
send_data =get(handles.edit1,'string');
setappdata(0,'h_move',send_data);
mirror;

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
send_data =get(handles.edit1,'string');
setappdata(0,'h_move',send_data);
rrshape;

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
send_data =get(handles.edit1,'string');
setappdata(0,'h_move',send_data);
rotate_img;

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
send_data =get(handles.edit1,'string');
setappdata(0,'h_move',send_data);
log_boost;

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
send_data =get(handles.edit1,'string');
setappdata(0,'h_move',send_data);
img_gamma;

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=get(handles.edit1,'string');
if exist(file_name,'file')==0
   disp('file not exist！');
else
  I = imread(file_name);
  hsv=rgb2hsv(I);
  v = hsv( :, :, 3 );
  v=double(v);
  g = histeq(v);
  hsv( :, :, 3 )=g;
  J = hsv2rgb(hsv);
  figure(1);imshow(J)
  imwrite(J,strcat('histeq_',file_name));
  set(handles.edit2,'string',strcat('histeq_',file_name));
end

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=get(handles.edit1,'string');
if exist(file_name,'file')==0
   disp('file not exist！');
else
  I = imread(file_name);
  hsv=rgb2hsv(I);
  v = hsv( :, :, 3 );
  v=double(v);
  g = adapthisteq(v);
  hsv( :, :, 3 )=g;
  J = hsv2rgb(hsv);
  figure(1);imshow(J)
  imwrite(J,strcat(' adapthisteq_',file_name));
  set(handles.edit2,'string',strcat(' adapthisteq_',file_name));
end

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=get(handles.edit1,'string');
if exist(file_name,'file')==0
   disp('file not exist！');
else
    I = imread(file_name);
    I = rgb2gray(I);
    figure(1);
    subplot(1,3,1),imshow(I);title('原图像');
    I = double(I);
    I2=fftshift(fft2(I));
    subplot(1,3,2),imshow(log(abs(I2)), [ ]);title('二维傅立叶变换');
    C= ifft2(I2);
    subplot(1,3,3),imshow(log(abs(C)), [ ]);title('逆变换后图像'); 
end

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
send_data =get(handles.edit1,'string');
setappdata(0,'h_move',send_data);
high_wave;

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
send_data =get(handles.edit1,'string');
setappdata(0,'h_move',send_data);
low_wave;

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
send_data =get(handles.edit1,'string');
setappdata(0,'h_move',send_data);
l_avg;

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
send_data =get(handles.edit1,'string');
setappdata(0,'h_move',send_data);
l_med;

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=get(handles.edit1,'string');
if exist(file_name,'file')==0
   disp('file not exist！');
else
    I = imread(file_name);
    I = rgb2gray(I);
    level=graythresh(I);
    threshold=num2str(level*255);
    BW2=im2bw(I,level);
    figure(1);
    subplot(1,2,1),imshow(I);title('原图像');
    subplot(1,2,2),imshow(BW2);title(strcat('阈值:',threshold));
    imwrite(BW2,strcat('cut_',file_name));
  set(handles.edit2,'string',strcat('cut_',file_name));
end

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=get(handles.edit1,'string');
if exist(file_name,'file')==0
   disp('file not exist！');
else
    I = imread(file_name);
    I = rgb2gray(I);
    [r1,rt1] = edge(I,'roberts');
fprintf('Roberts自动确定阈值 rt1 = %.4f\n',rt1)
r2 = edge(I,'roberts','horizontal');
r3 = edge(I,'roberts','vertical');
r4 = edge(I,'roberts',0.15);
r5 = edge(I,'roberts',0.05);
figure('name','Roberts')
subplot(231),imshow(I),title('原始图像')
subplot(232),imshow(r4),title('t = 0.15')
subplot(233),imshow(r5),title('t = 0.05')
subplot(234),imshow(r1),title('both')
subplot(235),imshow(r2),title('horizontal')
subplot(236),imshow(r3),title('vertical')
    imwrite(r1,strcat('roberts_',file_name));
  set(handles.edit2,'string',strcat('roberts_',file_name));
end

% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=get(handles.edit1,'string');
if exist(file_name,'file')==0
   disp('file not exist！');
else
    I = imread(file_name);
    I = rgb2gray(I);
    [s1,st1] = edge(I,'sobel');
    fprintf('sobel自动确定阈值 st1 = %.4f\n',st1)
    s2 = edge(I,'sobel','horizontal');
    s3 = edge(I,'sobel','vertical');
    s4 = edge(I,'sobel',0.15);
    s5 = edge(I,'sobel',0.05);
    figure('name','sobel')
    subplot(231),imshow(I),title('原始图像')
    subplot(232),imshow(s4),title('t = 0.15')
    subplot(233),imshow(s5),title('t = 0.05')
    subplot(234),imshow(s1),title('both')
    subplot(235),imshow(s2),title('horizontal')
    subplot(236),imshow(s3),title('vertical')
    imwrite(s1,strcat('sobel_',file_name));
  set(handles.edit2,'string',strcat('sobel_',file_name));
end

% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=get(handles.edit1,'string');
if exist(file_name,'file')==0
   disp('file not exist！');
else
    I = imread(file_name);
    I = rgb2gray(I);
    [p1,pt1] = edge(I,'prewitt');
fprintf('prewitt自动确定阈值 pt1 = %.4f\n',pt1)
p2 = edge(I,'prewitt','horizontal');
p3 = edge(I,'prewitt','vertical');
p4 = edge(I,'prewitt',0.15);
p5 = edge(I,'prewitt',0.05);
figure('name','prewitt')
subplot(231),imshow(I),title('原始')
subplot(232),imshow(p4),title('t = 0.15')
subplot(233),imshow(p5),title('t = 0.05')
subplot(234),imshow(p1),title('both')
subplot(235),imshow(p2),title('horizontal')
subplot(236),imshow(p3),title('vertical')
    imwrite(p1,strcat('prewitt_',file_name));
  set(handles.edit2,'string',strcat('prewitt_',file_name));
end

% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=get(handles.edit1,'string');
if exist(file_name,'file')==0
   disp('file not exist！');
else
    I = imread(file_name);
    I = rgb2gray(I);
     [g1,t1] = edge(I,'log');
g2 = edge(I,'log',0);
g3 = edge(I,'log',[],2.25);
fprintf('LoG自动确定阈值 t1 = %.4f\n',t1)
figure('name','LoG')
subplot(221),imshow(I),title('原始图像')
subplot(222),imshow(g1),title('LoG检测器')
subplot(223),imshow(g2),title('T = 0')
subplot(224),imshow(g3),title('sigma = 2.25')
    imwrite(g1,strcat('log_',file_name));
  set(handles.edit2,'string',strcat('log_',file_name));
end

% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=get(handles.edit1,'string');
if exist(file_name,'file')==0
   disp('file not exist！');
else
    img = imread(file_name);
    img1 = im2bw(img);%（图像分割）转化为二值图
    img1 = not(img1);%把图像想表达的内容变成1
    figure(1)
    subplot(2,2,1);imshow(img);xlabel('原图');
    subplot(2,2,2);imshow(img1);xlabel('二值化'); 

img = imread(file_name);
img1 = im2bw(img);%（图像分割）转化为二值图
img2 = not(img1);%把图像想表达的内容变成1
[B,L] = bwboundaries(img2);
subplot(2,2,3);imshow(img2);xlabel('标记边界');hold on
for k = 1:length(B)
 boundary = B{k};
 plot(boundary(:,2),boundary(:,1),'g','LineWidth',2);
end
[I,N] = bwlabel(img2);
img_rgb = label2rgb(L,'hsv',[.5 .5 .5],'shuffle');
subplot(2,2,4);imshow(img_rgb);xlabel('标记区域');hold on
for k =1:length(B)
 boundary = B{k};
 plot(boundary(:,2),boundary(:,1),'w','LineWidth',2);
 text(boundary(1,2)-11,boundary(1,1)+11,num2str(k),'Color','y','Fontsize',14,'FontWeight','bold');
end 
stats = regionprops(I,'all');%统计的数保留在stats内
figure
cmap = colormap(lines(21));
areas = zeros(1,N);
for k = 1:N
 areas(k) = stats(k).Area; 
end
TR = zeros(1,N);
for k = 1: N
 TR(k) = k;
end
for k = 1:N
 scatter(TR(k),areas(k),[],cmap(k,:),'filled');
 ylabel('Area'),xlabel('k');
 hold on
end
figure
Perimeters = zeros(1,N);
for k = 1:N
 Perimeters(k) = stats(k).Perimeter;
end
for k = 1:N
 scatter(TR(k),Perimeters(k),[],cmap(k,:),'filled');
 ylabel('Perimeter'),xlabel('k');
 hold on
end
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton47.
function pushbutton47_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton48.
function pushbutton48_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_name=get(handles.uipanel2,'Visible');
if  strcmp(file_name,'on')
    set(handles.uipanel2,'Visible','off')
else 
    set(handles.uipanel2,'Visible','on')
end


% --- Executes on button press in pushbutton49.
function pushbutton49_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axis off %关闭坐标轴显示
[filename, pathname] = uigetfile({'*.jpg';'*.bmp';'*.*'},'打开图像');
str = [pathname filename];
im = imread(str);
axes(handles.axes1);
imshow(im);
set(handles.edit1,'string',str);
