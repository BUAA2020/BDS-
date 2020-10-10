function varargout = gui1(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui1_OpeningFcn, ...
                   'gui_OutputFcn',  @gui1_OutputFcn, ...
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
end


function gui1_OpeningFcn(hObject, eventdata, handles, varargin)

% 打开平台使用说明
url='http://gps.buaa.edu.cn/expr/BDSplatform/Platformreadme.html';
web(url,'-browser');

url='http://gps.buaa.edu.cn/expr/BDSexperiment/num.txt';
filenames = sprintf('num.txt');
[f, status] = urlwrite(url,filenames);
n=load('num.txt');

% 读取实验数目
url='http://gps.buaa.edu.cn/expr/BDSexperiment/num.txt';
filenames = sprintf('num.txt');
[f, status] = urlwrite(url,filenames);
n=load('num.txt');

% 读取logo图
url='http://gps.buaa.edu.cn/expr/BDSexperiment/beidou_logo.png';
filenames = sprintf('beidou_logo.png');
[f, status] = urlwrite(url,filenames);
image(imread('beidou_logo.png'));
set( gca, 'XTick', [], 'YTick', [],'XColor', [0.234,0.738,0.879],'YColor', [0.234,0.738,0.879] ); 


set(handles.figure1,'units','pixels','position',[200,200,1000,400],'color',[0.234,0.738,0.879]);
% [200,200,1000,400]);
% [300,-240,650,1000]
handles.uipanel1=uipanel(handles.figure1,'units','pixels','position',[300,-240,680,1000+(n-17)*50],'title','',...
    'bordertype','none','backgroundcolor',[0.23,0.74,0.88]);
%set(handles.uipanel2,'units','pixels','position',[0,-250,540,600],'title','','parent',handles.uipanel1);
set(handles.slider1,'units','pixels','position',[980,0,20,400],'value',1,'parent',handles.figure1);
% handles.order = cell(17,1);


for i=1:n
    handles.order{i} = uicontrol(handles.uipanel1,'units','pixels','position',[50,50+(n-i)*50,100,40],...
        'style','pushbutton','string',['实验 ',num2str(i)],'backgroundcolor',[1,1,1],...
        'foregroundcolor',[0,0,0],'fontsize',20,'fontname','楷体');
    
    handles.readme{i} = uicontrol(handles.uipanel1,'units','pixels','position',[180,50+(n-i)*50,200,40],...
        'style','pushbutton','string',['说明 ',num2str(i)],'backgroundcolor',[1,1,1],...
        'foregroundcolor',[0,0,0],'fontsize',20,'fontname','楷体','tag',['readme_pushbutton',num2str(i)],...
        'callback',@(hObject,eventdata)gui1(['readme',num2str(i)],hObject,eventdata,guidata(hObject)));
    
    handles.download{i} = uicontrol(handles.uipanel1,'units','pixels','position',[400,50+(n-i)*50,100,40],...
        'style','pushbutton','string',['下载 ',num2str(i)],'backgroundcolor',[1,1,1],...
        'foregroundcolor',[0,0,0],'fontsize',20,'fontname','楷体','tag',['download_pushbutton',num2str(i)],...
        'callback',@(hObject,eventdata)gui1(['download',num2str(i)],hObject,eventdata,guidata(hObject)));
    
    handles.run{i} = uicontrol(handles.uipanel1,'units','pixels','position',[520,50+(n-i)*50,100,40],...
        'style','pushbutton','string',['运行 ',num2str(i)],'backgroundcolor',[1,1,1],...
        'foregroundcolor',[0,0,0],'fontsize',20,'fontname','楷体','tag',['run_pushbutton',num2str(i)],...
        'callback',@(hObject,eventdata)gui1(['run',num2str(i)],hObject,eventdata,guidata(hObject)));
%     set(handles.run{i},'UserData',value);
end

handles.title = uicontrol(handles.uipanel1,'units','pixels','position',[50,50+n*50,570,80],...
        'style','text','string','                                            BDS学生实验平台 ','backgroundcolor',[0.0508,0.3164,0.5117],...
        'foregroundcolor',[1,1,1],'fontsize',20,'fontname','楷体');

% A=imread('beidou_logo.png');   
% set(handles.readme{1},'CData',A);  %按钮换背景

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

end


% --- Outputs from this function are returned to the command line.
function varargout = gui1_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;
end

function pushbutton11_Callback(hObject, eventdata, handles)
inputurl=get(handles.edit1,'String');
handles.pushbutton11=inputurl;
guidata(hObject, handles);
end

function axes9_CreateFcn(hObject, eventdata, handles)
% image(imread('beidou_logo.png'));
% set( gca, 'XTick', [], 'YTick', [],'XColor', [0.234,0.738,0.879],'YColor', [0.234,0.738,0.879] ); 
end

% function judge_pressed(hObject, eventdata, handles)
% % 读取实验数目
% url='http://gps.buaa.edu.cn/expr/BDSexperiment/num.txt';
% filenames = sprintf('num.txt');
% [f, status] = urlwrite(url,filenames);
% n=load('num.txt');
% for k=1:n
%     value{k}=get(handles.run{k},'Userdata');
%     if(value{k}==1)
%         handles.num{k}=k;
%     end
% end
% end

function ButtonDownFcn(hObject, eventdata, handles)

end
% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)

% 读取实验数目
url='http://gps.buaa.edu.cn/expr/BDSexperiment/num.txt';
filenames = sprintf('num.txt');
[f, status] = urlwrite(url,filenames);
n=load('num.txt');

pos = get(hObject,'value');
set(handles.uipanel1,'position',[300,-240*pos,680,1000+(n-17)*50]);
guidata(hObject,handles)
end

function slider1_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end

% --- Executes on scroll wheel click while the figure is in focus.
function figure1_WindowScrollWheelFcn(hObject, eventdata, handles)
slidervalue = get(handles.slider1,'value');
scrollvalue = eventdata.VerticalScrollCount/10;
movevalue = slidervalue - scrollvalue;
if movevalue >1
    movevalue = 1;
elseif movevalue < 0
    movevalue = 0;
end
set(handles.slider1,'value',movevalue);
figure1pos = get(handles.figure1,'position');
panelpos = get(handles.uipanel1,'position');
panelpos(2) = -(panelpos(4)-figure1pos(4))*movevalue;
set(handles.uipanel1,'position',panelpos);
guidata(hObject,handles);
end

function figure1_CloseRequestFcn(hObject, eventdata, handles)
delete(hObject);
end
function figure1_DeleteFcn(hObject, eventdata, handles)
end

function edit1_Callback(hObject, eventdata, handles)
end

function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function download1(hObject, eventdata, handles)
mkdir ex1;
num = 1:10;
URLs = cell(size(num));
folder_filenames = cell(size(num));
filenames = cell(size(num));
inputurl=handles.pushbutton11;

  URLs{1} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex1/start1.m']);
  filenames{1} = sprintf('ex1/start1.m');
  URLs{2} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex1/start1.fig']);
  filenames{2} = sprintf('ex1/start1.fig');

for idx  = 3:length(num)
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex1/sub1_%d.m'],num(idx)-2);
    filenames{idx} = sprintf('ex1/sub1_%d.m',num(idx)-2);
end

for idx = 1:length(num)
     fprintf(1,'正在下载%s...\n',filenames{idx});
    [f, status] = urlwrite(URLs{idx},filenames{idx});
    if status == 1
        fprintf(1,'%s成功下载！\n',filenames{idx});
    else
        fprintf(1,'%s下载失败！\n',filenames{idx});
    end
end
end

function download2(hObject, eventdata, handles)
mkdir ex2;
num=1:2;
URLs = cell(size(num));
folder_filenames = cell(size(num));
filenames = cell(size(num));
inputurl=handles.pushbutton11;

  URLs{1} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex2/start2.m']);
  filenames{1} = sprintf('ex2/start2.m');
  URLs{2} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex2/start2.fig']);
  filenames{2} = sprintf('ex2/start2.fig');

for idx = 1:length(num)
    fprintf(1,'正在下载%s...\n',filenames{idx});
    [f, status] = urlwrite(URLs{idx},filenames{idx});
    if status == 1
        fprintf(1,'%s成功下载！\n',filenames{idx});
    else
        fprintf(1,'%s下载失败！\n',filenames{idx});
    end
end
end

function download3(hObject, eventdata, handles)
mkdir ex3;
num = 1:6;
URLs = cell(size(num));
folder_filenames = cell(size(num));
filenames = cell(size(num));
inputurl=handles.pushbutton11;

  URLs{1} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex3/start3.m']);
  filenames{1} = sprintf('ex3/start3.m');
  URLs{2} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex3/start3.fig']);
  filenames{2} = sprintf('ex3/start3.fig');
  URLs{3} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex3/sub3_1.mat']);
  filenames{3} = sprintf('ex3/sub3_1.mat');
  
for idx  = 4:5
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex3/sub3_%d.txt'],num(idx)-2);
    filenames{idx} = sprintf('ex3/sub3_%d.txt',num(idx)-2);
end

  URLs{6} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex3/sub3_4.pdf']);
  filenames{6} = sprintf('ex3/sub3_4.pdf');

for idx = 1:length(num)
    fprintf(1,'正在下载%s...\n',filenames{idx});
    [f, status] = urlwrite(URLs{idx},filenames{idx});
    if status == 1
        fprintf(1,'%s成功下载！\n',filenames{idx});
    else
        fprintf(1,'%s下载失败！\n',filenames{idx});
    end
end
end

function download4(hObject, eventdata, handles)
mkdir ex4;
num = 1:10;
URLs = cell(size(num));
folder_filenames = cell(size(num));
filenames = cell(size(num));
inputurl=handles.pushbutton11;

for idx  = 1:3
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex4/start4_%d.m'],num(idx));
    filenames{idx} = sprintf('ex4/start4_%d.m',num(idx));
end

for idx  = 4:6
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex4/start4_%d.fig']',num(idx)-3);
    filenames{idx} = sprintf('ex4/start4_%d.fig',num(idx)-3);
end

for idx  = 7:8
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex4/sub4_%d.m'],num(idx)-6);
    filenames{idx} = sprintf('ex4/sub4_%d.m',num(idx)-6);
end

  URLs{9} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex4/sub4_3.mat']);
  filenames{9} = sprintf('ex4/sub4_3.mat');
  URLs{10} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex4/sub4_4.txt']);
  filenames{10} = sprintf('ex4/sub4_4.txt');

for idx = 1:length(num)
     fprintf(1,'正在下载%s...\n',filenames{idx});
    [f, status] = urlwrite(URLs{idx},filenames{idx});
    if status == 1
        fprintf(1,'%s成功下载！\n',filenames{idx});
    else
        fprintf(1,'%s下载失败！\n',filenames{idx});
    end
end
end

function download5(hObject, eventdata, handles)
mkdir ex5;
num = 1:7;
URLs = cell(size(num));
folder_filenames = cell(size(num));
filenames = cell(size(num));
inputurl=handles.pushbutton11;

  URLs{1} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex5/start5.m']);
  filenames{1} = sprintf('ex5/start5.m');
  URLs{2} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex5/start5.fig']);
  filenames{2} = sprintf('ex5/start5.fig');
  URLs{3} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex5/sub5_1.m']);
  filenames{3} = sprintf('ex5/sub5_1.m');
  URLs{4} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex5/sub5_2.mat']);
  filenames{4} = sprintf('ex5/sub5_2.mat');
  URLs{5} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex5/sub5_3.txt']);
  filenames{5} = sprintf('ex5/sub5_3.txt');
  
for idx  = 6:7
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex5/sub5_%d.mat'],num(idx)-2);
    filenames{idx} = sprintf('ex5/sub5_%d.mat',num(idx)-2);
end

for idx = 1:length(num)
    fprintf(1,'正在下载%s...\n',filenames{idx});
    [f, status] = urlwrite(URLs{idx},filenames{idx});
    if status == 1
        fprintf(1,'%s成功下载！\n',filenames{idx});
    else
        fprintf(1,'%s下载失败！\n',filenames{idx});
    end
end
end

function download6(hObject, eventdata, handles)
mkdir ex6;
num = 1:8;
URLs = cell(size(num));
folder_filenames = cell(size(num));
filenames = cell(size(num));
inputurl=handles.pushbutton11;

  URLs{1} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex6/start6.m']);
  filenames{1} = sprintf('ex6/start6.m');
  URLs{2} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex6/start6.fig']);
  filenames{2} = sprintf('ex6/start6.fig');
  
for idx  = 3:5
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex6/sub6_%d.mat'],num(idx)-2);
    filenames{idx} = sprintf('ex6/sub6_%d.mat',num(idx)-2);
end
  
for idx  = 6:8
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex6/sub6_%d.txt'],num(idx)-2);
    filenames{idx} = sprintf('ex6/sub6_%d.txt',num(idx)-2);
end

for idx = 1:length(num)
    fprintf(1,'正在下载%s...\n',filenames{idx});
    [f, status] = urlwrite(URLs{idx},filenames{idx});
    if status == 1
        fprintf(1,'%s成功下载！\n',filenames{idx});
    else
        fprintf(1,'%s下载失败！\n',filenames{idx});
    end
end
end

function download7(hObject, eventdata, handles)
mkdir ex7;
num = 1:12;
URLs = cell(size(num));
folder_filenames = cell(size(num));
filenames = cell(size(num));
inputurl=handles.pushbutton11;

  URLs{1} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex7/start7.m']);
  filenames{1} = sprintf('ex7/start7.m');
  URLs{2} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex7/start7.fig']);
  filenames{2} = sprintf('ex7/start7.fig');
  
for idx  = 3:11
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex7/sub7_%d.m'],num(idx)-2);
    filenames{idx} = sprintf('ex7/sub7_%d.m',num(idx)-2);
end

  URLs{12} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex7/sub7_10.mat']);
  filenames{12} = sprintf('ex7/sub7_10.mat');

for idx = 1:length(num)
    fprintf(1,'正在下载%s...\n',filenames{idx});
    [f, status] = urlwrite(URLs{idx},filenames{idx});
    if status == 1
        fprintf(1,'%s成功下载！\n',filenames{idx});
    else
        fprintf(1,'%s下载失败！\n',filenames{idx});
    end
end
end

function download8(hObject, eventdata, handles)
mkdir ex8;
num = 1:2;
URLs = cell(size(num));
folder_filenames = cell(size(num));
filenames = cell(size(num));
inputurl=handles.pushbutton11;

  URLs{1} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex8/start8.m']);
  filenames{1} = sprintf('ex8/start8.m');
  URLs{2} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex8/start8.fig']);
  filenames{2} = sprintf('ex8/start8.fig');

for idx = 1:length(num)
    fprintf(1,'正在下载%s...\n',filenames{idx});
    [f, status] = urlwrite(URLs{idx},filenames{idx});
    if status == 1
        fprintf(1,'%s成功下载！\n',filenames{idx});
    else
        fprintf(1,'%s下载失败！\n',filenames{idx});
    end
end
end

function download9(hObject, eventdata, handles)
mkdir ex9;
num = 1:22;
URLs = cell(size(num));
folder_filenames = cell(size(num));
filenames = cell(size(num));
inputurl=handles.pushbutton11;

  URLs{1} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex9/start9.m']);
  filenames{1} = sprintf('ex9/start9.m');
  URLs{2} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex9/start9.fig']);
  filenames{2} = sprintf('ex9/start9.fig');
  URLs{3} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex9/sub9_1.m']);
  filenames{3} = sprintf('ex9/sub9_1.m');
  URLs{4} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex9/sub9_2.m']);
  filenames{4} = sprintf('ex9/sub9_2.m');
  URLs{5} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex9/sub9_3.exe']);
  filenames{5} = sprintf('ex9/sub9_3.exe');
  
for idx  = 6:12
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex9/sub9_%d.m'],num(idx)-2);
    filenames{idx} = sprintf('ex9/sub9_%d.m',num(idx)-2);
end
  
  URLs{13} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex9/sub9_11.mat']);
  filenames{13} = sprintf('ex9/sub9_11.mat');
  URLs{14} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex9/sub9_12.mat']);
  filenames{14} = sprintf('ex9/sub9_12.mat');
  
for idx  = 15:21
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex9/sub9_%d.txt'],num(idx)-2);
    filenames{idx} = sprintf('ex9/sub9_%d.txt',num(idx)-2);
end

  URLs{22} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex9/sub9_20.docx']);
  filenames{22} = sprintf('ex9/sub9_20.docx');

for idx = 1:length(num)
    fprintf(1,'正在下载%s...\n',filenames{idx});
    [f, status] = urlwrite(URLs{idx},filenames{idx});
    if status == 1
        fprintf(1,'%s成功下载！\n',filenames{idx});
    else
        fprintf(1,'%s下载失败！\n',filenames{idx});
    end
end
end

function download10(hObject, eventdata, handles)
mkdir ex10;
num = 1:9;
URLs = cell(size(num));
folder_filenames = cell(size(num));
filenames = cell(size(num));
inputurl=handles.pushbutton11;

  URLs{1} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex10/start10.m']);
  filenames{1} = sprintf('ex10/start10.m');
  URLs{2} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex10/start10.fig']);
  filenames{2} = sprintf('ex10/start10.fig');
  
for idx  = 3:6
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex10/sub10_%d.m'],num(idx)-2);
    filenames{idx} = sprintf('ex10/sub10_%d.m',num(idx)-2);
end

for idx  = 7:9
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex10/sub10_%d.mat'],num(idx)-2);
    filenames{idx} = sprintf('sub10_%d.mat',num(idx)-2);
end

for idx = 1:length(num)
    fprintf(1,'正在下载%s...\n',filenames{idx});
    [f, status] = urlwrite(URLs{idx},filenames{idx});
    if status == 1
        fprintf(1,'%s成功下载！\n',filenames{idx});
    else
        fprintf(1,'%s下载失败！\n',filenames{idx});
    end
end
end

function download11(hObject, eventdata, handles)
mkdir ex11;
num = 1:2;
URLs = cell(size(num));
folder_filenames = cell(size(num));
filenames = cell(size(num));
inputurl=handles.pushbutton11;

  URLs{1} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex11/start11.m']);
  filenames{1} = sprintf('ex11/start11.m');
  URLs{2} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex11/start11.fig']);
  filenames{2} = sprintf('ex11/start11.fig');

for idx = 1:length(num)
    fprintf(1,'正在下载%s...\n',filenames{idx});
    [f, status] = urlwrite(URLs{idx},filenames{idx});
    if status == 1
        fprintf(1,'%s成功下载！\n',filenames{idx});
    else
        fprintf(1,'%s下载失败！\n',filenames{idx});
    end
end
end

function download12(hObject, eventdata, handles)
mkdir ex12;
num = 1:2;
URLs = cell(size(num));
folder_filenames = cell(size(num));
filenames = cell(size(num));
inputurl=handles.pushbutton11;

  URLs{1} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex12/start12.m']);
  filenames{1} = sprintf('ex12/start12.m');
  URLs{2} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex12/start12.fig']);
  filenames{2} = sprintf('ex12/start12.fig');

for idx = 1:length(num)
    fprintf(1,'正在下载%s...\n',filenames{idx});
    [f, status] = urlwrite(URLs{idx},filenames{idx});
    if status == 1
        fprintf(1,'%s成功下载！\n',filenames{idx});
    else
        fprintf(1,'%s下载失败！\n',filenames{idx});
    end
end
end

function download13(hObject, eventdata, handles)
mkdir ex13;
num = 1:2;
URLs = cell(size(num));
folder_filenames = cell(size(num));
filenames = cell(size(num));
inputurl=handles.pushbutton11;

  URLs{1} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex13/start13.m']);
  filenames{1} = sprintf('ex13/start13.m');
  URLs{2} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex13/start13.fig']);
  filenames{2} = sprintf('ex13/start13.fig');

for idx = 1:length(num)
    fprintf(1,'正在下载%s...\n',filenames{idx});
    [f, status] = urlwrite(URLs{idx},filenames{idx});
    if status == 1
        fprintf(1,'%s成功下载！\n',filenames{idx});
    else
        fprintf(1,'%s下载失败！\n',filenames{idx});
    end
end
end

function download14(hObject, eventdata, handles)
mkdir ex14;
num = 1:13;
URLs = cell(size(num));
folder_filenames = cell(size(num));
filenames = cell(size(num));
inputurl=handles.pushbutton11;

  URLs{1} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex14/start14.m']);
  filenames{1} = sprintf('ex14/start14.m');
  URLs{2} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex14/start14.fig']);
  filenames{2} = sprintf('ex14/start14.fig');
  
for idx  = 3:13
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex14/sub14_%d.m'],num(idx)-2);
    filenames{idx} = sprintf('ex14/sub14_%d.m',num(idx)-2);
end
 

for idx = 1:length(num)
    fprintf(1,'正在下载%s...\n',filenames{idx});
    [f, status] = urlwrite(URLs{idx},filenames{idx});
    if status == 1
        fprintf(1,'%s成功下载！\n',filenames{idx});
    else
        fprintf(1,'%s下载失败！\n',filenames{idx});
    end
end
end

function download15(hObject, eventdata, handles)
mkdir ex15;
num = 1:29;
URLs = cell(size(num));
folder_filenames = cell(size(num));
filenames = cell(size(num));
inputurl=handles.pushbutton11;

  URLs{1} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex15/start15.m']);
  filenames{1} = sprintf('ex15/start15.m');
  URLs{2} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex15/start15.fig']);
  filenames{2} = sprintf('ex15/start15.fig');
  
for idx  = 3:13
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex15/sub15_%d.m'],num(idx)-2);
    filenames{idx} = sprintf('ex15/sub15_%d.m',num(idx)-2);
end

  URLs{14} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex15/sub15_12.mat']);
  filenames{14} = sprintf('ex15/sub15_12.mat');
  URLs{15} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex15/sub15_13.txt']);
  filenames{15} = sprintf('ex15/sub15_13.txt');
  
for idx  = 16:28
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex15/include/include15_%d.m'],num(idx)-15);
    filenames{idx} = sprintf('ex15/include15_%d.m',num(idx)-15);
end  

  URLs{29} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex15/include/include15_14.txt']);
  filenames{29} = sprintf('ex15/include15_14.txt');   

for idx = 1:length(num)
    fprintf(1,'正在下载%s...\n',filenames{idx});
    [f, status] = urlwrite(URLs{idx},filenames{idx});
    if status == 1
        fprintf(1,'%s成功下载！\n',filenames{idx});
    else
        fprintf(1,'%s下载失败！\n',filenames{idx});
    end
end
end

function download16(hObject, eventdata, handles)
mkdir ex16;
num = 1:37;
URLs = cell(size(num));
folder_filenames = cell(size(num));
filenames = cell(size(num));
inputurl=handles.pushbutton11;
  
for idx  = 1:2
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex16/start16_%d.m'],num(idx));
    filenames{idx} = sprintf('ex16/start16_%d.m',num(idx));
end

for idx  = 3:4
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex16/start16_%d.fig'],num(idx)-2);
    filenames{idx} = sprintf('ex16/start16_%d.fig',num(idx)-2);
end

for idx  = 5:8
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex16/sub16_%d.m'],num(idx)-4);
    filenames{idx} = sprintf('ex16/sub16_%d.m',num(idx)-4);
end

for idx  = 9:11
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex16/sub16_%d.mat'],num(idx)-4);
    filenames{idx} = sprintf('ex16/sub16_%d.mat',num(idx)-4);
end

% % getFunctions
for idx  = 12:24
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex16/geoFunctions/geoFun16_%d.m'],num(idx)-11);
    filenames{idx} = sprintf('ex16/geoFun16_%d.m',num(idx)-11);
end  

% %   include
for idx  = 25:36
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex16/include/include16_%d.m'],num(idx)-24);
    filenames{idx} = sprintf('ex16/include16_%d.m',num(idx)-24);
end  
  URLs{37} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex16/include/include16_13.mat']);
  filenames{37} = sprintf('ex16/include16_13.mat');

for idx = 1:length(num)
    fprintf(1,'正在下载%s...\n',filenames{idx});
    [f, status] = urlwrite(URLs{idx},filenames{idx});
    if status == 1
        fprintf(1,'%s成功下载！\n',filenames{idx});
    else
        fprintf(1,'%s下载失败！\n',filenames{idx});
    end
end
end

function download17(hObject, eventdata, handles)
mkdir ex17;
num = 1:27;
URLs = cell(size(num));
folder_filenames = cell(size(num));
filenames = cell(size(num));
inputurl=handles.pushbutton11;

for idx  = 1:13
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex17/include/include17_%d.m'],num(idx));
    filenames{idx} = sprintf('ex17/include17_%d.m',num(idx));
end  

  URLs{14} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex17/start17.m']);
  filenames{14} = sprintf('ex17/start17.m');
  URLs{15} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex17/start17.fig']);
  filenames{15} = sprintf('ex17/start17.fig');
  
for idx  = 16:26
    URLs{idx} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex17/sub17_%d.m'],num(idx)-15);
    filenames{idx} = sprintf('ex17/sub17_%d.m',num(idx)-15);
end
  
  URLs{27} = sprintf(['http://',inputurl,'/BDSexperiment/code/ex17/sub17_12.mat']);
  filenames{27} = sprintf('ex17/sub17_12.mat');

for idx = 1:length(num)
    fprintf(1,'正在下载%s...\n',filenames{idx});
    [f, status] = urlwrite(URLs{idx},filenames{idx});
    if status == 1
        fprintf(1,'%s成功下载！\n',filenames{idx});
    else
        fprintf(1,'%s下载失败！\n',filenames{idx});
    end
end
end

function readme1(hObject, eventdata, handles)
num=1;
inputurl=handles.pushbutton11;
url=sprintf(['http://',inputurl,'/BDSexperiment/readme/readme%d.html'],num);
web(url,'-browser');
end

function readme2(hObject, eventdata, handles)
num=2;
inputurl=handles.pushbutton11;
url=sprintf(['http://',inputurl,'/BDSexperiment/readme/readme%d.html'],num);
web(url,'-browser');
end

function readme3(hObject, eventdata, handles)
num=3;
inputurl=handles.pushbutton11;
url=sprintf(['http://',inputurl,'/BDSexperiment/readme/readme%d.html'],num);
web(url,'-browser');
end

function readme4(hObject, eventdata, handles)
num=4;
inputurl=handles.pushbutton11;
url=sprintf(['http://',inputurl,'/BDSexperiment/readme/readme%d.html'],num);
web(url,'-browser');
end

function readme5(hObject, eventdata, handles)
num=5;
inputurl=handles.pushbutton11;
url=sprintf(['http://',inputurl,'/BDSexperiment/readme/readme%d.html'],num);
web(url,'-browser');
end

function readme6(hObject, eventdata, handles)
num=6;
inputurl=handles.pushbutton11;
url=sprintf(['http://',inputurl,'/BDSexperiment/readme/readme%d.html'],num);
web(url,'-browser');
end

function readme7(hObject, eventdata, handles)
num=7;
inputurl=handles.pushbutton11;
url=sprintf(['http://',inputurl,'/BDSexperiment/readme/readme%d.html'],num);
web(url,'-browser');
end

function readme8(hObject, eventdata, handles)
num=8;
inputurl=handles.pushbutton11;
url=sprintf(['http://',inputurl,'/BDSexperiment/readme/readme%d.html'],num);
web(url,'-browser');
end

function readme9(hObject, eventdata, handles)
num=9;
inputurl=handles.pushbutton11;
url=sprintf(['http://',inputurl,'/BDSexperiment/readme/readme%d.html'],num);
web(url,'-browser');
end

function readme10(hObject, eventdata, handles)
num=10;
inputurl=handles.pushbutton11;
url=sprintf(['http://',inputurl,'/BDSexperiment/readme/readme%d.html'],num);
web(url,'-browser');
end

function readme11(hObject, eventdata, handles)
num=11;
inputurl=handles.pushbutton11;
url=sprintf(['http://',inputurl,'/BDSexperiment/readme/readme%d.html'],num);
web(url,'-browser');
end

function readme12(hObject, eventdata, handles)
num=12;
inputurl=handles.pushbutton11;
url=sprintf(['http://',inputurl,'/BDSexperiment/readme/readme%d.html'],num);
web(url,'-browser');
end

function readme13(hObject, eventdata, handles)
num=13;
inputurl=handles.pushbutton11;
url=sprintf(['http://',inputurl,'/BDSexperiment/readme/readme%d.html'],num);
web(url,'-browser');
end

function readme14(hObject, eventdata, handles)
num=14;
inputurl=handles.pushbutton11;
url=sprintf(['http://',inputurl,'/BDSexperiment/readme/readme%d.html'],num);
web(url,'-browser');
end

function readme15(hObject, eventdata, handles)
num=15;
inputurl=handles.pushbutton11;
url=sprintf(['http://',inputurl,'/BDSexperiment/readme/readme%d.html'],num);
web(url,'-browser');
end

function readme16(hObject, eventdata, handles)
num=16;
inputurl=handles.pushbutton11;
url=sprintf(['http://',inputurl,'/BDSexperiment/readme/readme%d.html'],num);
web(url,'-browser');
end

function readme17(hObject, eventdata, handles)
num=17;
inputurl=handles.pushbutton11;
url=sprintf(['http://',inputurl,'/BDSexperiment/readme/readme%d.html'],num);
web(url,'-browser');
end


% function run(hObject, eventdata, handles)
% judge_pressed;
% ex=handles.num{k};
% if(ex==4)
%     run('ex4\start4_1.m');run('ex4\start4_2.m');run('ex4\start4_3.m');
% else if(ex==15||ex==17)
%         fopen(['ex',ex,'\','start',ex,'.m']);load(['ex',ex,'\','sub',ex,'_12.mat']);run(['ex',ex,'\','start',ex,'.m']);
%     else
%         run(['ex',ex,'\','start',ex,'.m']);
%     end
% end
% end

function run1(hObject, eventdata, handles);addpath(genpath(pwd));run('ex1\start1.m');end
function run2(hObject, eventdata, handles);addpath(genpath(pwd));run('ex2\start2.m');end
function run3(hObject, eventdata, handles);addpath(genpath(pwd));run('ex3\start3.m');end
function run4(hObject, eventdata, handles);addpath(genpath(pwd));run('ex4\start4_1.m');run('ex4\start4_2.m');run('ex4\start4_3.m');end
function run5(hObject, eventdata, handles);addpath(genpath(pwd));run('ex5\start5.m');end
function run6(hObject, eventdata, handles);addpath(genpath(pwd));run('ex6\start6.m');end
function run7(hObject, eventdata, handles);addpath(genpath(pwd));run('ex7\start7.m');end
function run8(hObject, eventdata, handles);addpath(genpath(pwd));run('ex8\start8.m');end
function run9(hObject, eventdata, handles);addpath(genpath(pwd));run('ex9\start9.m');end
function run10(hObject, eventdata, handles);addpath(genpath(pwd));run('ex10\start10.m');end
function run11(hObject, eventdata, handles);addpath(genpath(pwd));run('ex11\start11.m');end
function run12(hObject, eventdata, handles);addpath(genpath(pwd));run('ex12\start12.m');end
function run13(hObject, eventdata, handles);addpath(genpath(pwd));run('ex13\start13.m');end
function run14(hObject, eventdata, handles);addpath(genpath(pwd));run('ex14\start14.m');end
function run15(hObject, eventdata, handles);addpath(genpath(pwd));fopen('ex15\start15.m');evalin('base','load(''ex15\sub15_12.mat'')');run('ex15\start15.m');end
function run16(hObject, eventdata, handles);addpath(genpath(pwd));run('ex16\start16_1.m');run('ex16\start16_2.m');end
function run17(hObject, eventdata, handles);addpath(genpath(pwd));fopen('ex17\start17.m');evalin('base','load(''ex17\sub17_12.mat'')');run('ex17\start17.m');end


