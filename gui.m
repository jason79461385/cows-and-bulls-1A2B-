
function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 02-Jun-2020 09:36:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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
function frequency_axes_Createfcn(varargin)
end
% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end
% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end
% --- Executes on button press in AI.
function AI_Callback(hObject, eventdata, handles)
% hObject    handle to AI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=sprintf("It's AI time!");
set(handles.pushbutton4,'Enable','Off');
set(handles.LETAIGOT,'Enable','On');
set(handles.showwhoguess,'String',str);

set(handles.whenwin,'string','');
global gList nList k g  G  

    
    combs = nchoosek(1:9, 4);%йте|н╙
    nCombs = size(combs, 1);
    nPermsPerComb = factorial(4);
    gList = zeros(nCombs.*nPermsPerComb, 4);
    for k = 1:nCombs
        gList(nPermsPerComb*(k-1)+1:nPermsPerComb*k, :) = perms(combs(k, :));
    end
    
      
         nList = size(gList, 1);
        g = gList(randi(nList),:);     
        G=get(handles.edit5,'string');
        G=g(1)*1000+g(2)*100+g(3)*10+g(4);
        set(handles.edit5,'string',G);
        guidata(hObject,handles);
        
  end
     
    
        

function human_Callback(hObject, eventdata, handles)
% hObject    handle to human (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=sprintf("It's Ur time!");
set(handles.LETAIGOT,'Enable','Off');
set(handles.pushbutton4,'Enable','On');
set(handles.showwhoguess,'String',str);
set(handles.whenwin,'string','');
tdata=zeros(16,3);
set(handles.uitable3,'data',tdata);
global RightNum Round 

num=[0,1,2,3,4,5,6,7,8,9];
positionNum = randperm(10); 
RightNum=[0 0 0 0];
while(1)
    if positionNum(1)==1
    positionNum = randperm(10);     
    else 
        break;
    end
        
end
for i=1:4
  
RightNum(i)=num(positionNum(i));

end
Round=0;
end
% --- Executes on selection change in message.
function message_Callback(hObject, eventdata, handles)
% hObject    handle to message (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns message contents as cell array
%        contents{get(hObject,'Value')} returns selected item from message
end

% --- Executes during object creation, after setting all properties.
function message_CreateFcn(hObject, eventdata, handles)
% hObject    handle to message (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function answer_Callback(hObject, eventdata, handles)
% hObject    handle to answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of answer as text
%        str2double(get(hObject,'String')) returns contents of answer as a double

end

% --- Executes during object creation, after setting all properties.
function answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on button press in start.


% --- Executes when entered data in editable cell(s) in output.
function output_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to output (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
end
% --- Executes during object creation, after setting all properties.
function output_CreateFcn(hObject, eventdata, handles)

% hObject    handle to output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end

function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
end

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
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global RightNum Round tdata
InputStr=get(handles.answer,'string');
set(handles.answer,'string',' ');
    Round = Round + 1;
    I1=fix(str2num(InputStr)/1000);
     I2=fix(str2num(InputStr)/100)-I1*10;
      I3=fix(str2num(InputStr)/10)-I1*100-I2*10;
       I4=str2num(InputStr)-I1*1000-I2*100-I3*10;
       IA=[I1 I2 I3 I4];
   AP=zeros(1,4);
   for i = 1:4
        AP(i) = IA(i);
    end
    AS = 0;
    BS = 0;
    for i = 1:4
        apple = find(AP == RightNum(i));
        if(apple == i) 
            AS = AS + 1;
        elseif (apple ~= i) 
            BS = BS + 1;
        end
    end  
    AD=str2num(InputStr);
   
       
    Array=[AD AS BS];
    tdata=get(handles.uitable3,'data');
    tdata(Round,:)=Array;
    set(handles.uitable3,'data',tdata);
    guidata(hObject,handles);
    if AS == 4 
        set(handles.whenwin,'string','congratulations,you found the right answer!!!!!!!!!!!!<3<3<3');
        guidata(hObject, handles);
        
    end
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
end

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function A_Callback(hObject, eventdata, handles)
% hObject    handle to A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of A as text
%        str2double(get(hObject,'String')) returns contents of A as a double


% --- Executes during object creation, after setting all properties.

end
function A_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function B_Callback(hObject, eventdata, handles)
% hObject    handle to B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of B as text
%        str2double(get(hObject,'String')) returns contents of B as a double

end
% --- Executes during object creation, after setting all properties.
function B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end
% --- Executes on button press in LETAIGOT.
function LETAIGOT_Callback(hObject, eventdata, handles)
% hObject    handle to LETAIGOT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  b gList nList  g del G  
    
     a=0;
     k=isempty(gList);
     x=1;   
        
     
   
    while (a<4)&&(k~=1)
        if(x~=1)
        nList = size(gList, 1);
        g = gList(randi(nList),:);     
        G=get(handles.edit5,'string');
        G=g(1)*1000+g(2)*100+g(3)*10+g(4);
        set(handles.edit5,'string',G);
        guidata(hObject,handles);
        
        end
        A=get(handles.A,'string');
        a=str2num(A);
        set(handles.A,'string','');
         x=x+1;
        if (a < 4)
           B=get(handles.B,'string');
           b=str2num(B);
           set(handles.B,'string',''); 
           
            del = false(nList, 1);
            for k = 1:nList    
            del(k) = any([a b] ~= CountBullsCows(g, gList(k, :)));
            end
           gList(del, :) = [];
            
        end 
         k=isempty(gList);
    end
    if ~isempty(gList)
        set(handles.B,'string',''); 
        set(handles.A,'string','');
        set(handles.whenwin,'string','Yeah, I won!');
        set(handles.edit5,'string','');
        guidata(hObject,handles);
    end
    
    
    end

    
    
    
    function score = CountBullsCows(guess, correct)
% Checks the guessed array of digits against the correct array to find the score
% Assumes arrays of same length and valid numbers
    bulls = guess == correct;
    cows = ismember(guess(~bulls), correct);
    score = [sum(bulls) sum(cows)];   
    end
   
