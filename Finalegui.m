function varargout = Finalegui(varargin)
% FINALEGUI M-file for Finalegui.fig
%      FINALEGUI, by itself, creates a new FINALEGUI or raises the existing
%      singleton*.
%
%      H = FINALEGUI returns the handle to a new FINALEGUI or the handle to
%      the existing singleton*.
%
%      FINALEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINALEGUI.M with the given input arguments.
%
%      FINALEGUI('Property','Value',...) creates a new FINALEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Finalegui_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Finalegui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
count=1;
flag2=0;
% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help Finalegui

% Last Modified by GUIDE v2.5 20-Apr-2011 16:28:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Finalegui_OpeningFcn, ...
                   'gui_OutputFcn',  @Finalegui_OutputFcn, ...
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


% --- Executes just before Finalegui is made visible.
function Finalegui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Finalegui (see VARARGIN)

% Choose default command line output for Finalegui
handles.output = hObject;
handles.count=1;
handles.check=1;
clc;
% Update handles structure
guidata(hObject, handles);
set(handles.uipanel1,'SelectionChangeFcn',@uipanel1_SelectionChangeFcn);
set(handles.uipanel2,'SelectionChangeFcn',@uipanel2_SelectionChangeFcn);
set(handles.pushbutton1,'Callback',@pushbutton1_Callback);
% UIWAIT makes Finalegui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Finalegui_OutputFcn(hObject, eventdata, handles) 
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
handles = guidata(hObject);
handles.machine = str2double(get(hObject,'string'));
if isnan(handles.machine)
  errordlg('You must enter a numeric value...!!!!!','Wrong Input','modal');
  uicontrol(hObject);
	return;
end
guidata(hObject, handles);
%display(handles.machine);
%display(machine);
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
handles = guidata(hObject);
handles.request = str2double(get(hObject,'string'));
if isnan(handles.request)
  errordlg('You must enter a numeric value...!!!!!','Wrong Input','modal');
  uicontrol(hObject);
	return;
end
guidata(hObject, handles);
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
handles = guidata(hObject);
%display(count);
%display(flag2);
%if(flag==1)
 %   msgbox('Ureka');
%end

x=handles.machine;
y=handles.request;
display(x);
display(y);
if(handles.count==1)
    if(handles.check==1)
        calling3(x,y);
    else calling4(x,y);
    end
else if(handles.count==2)
    if(handles.check==1)
        calling1(x,y);
        else calling2(x,y);
        end
    end
end
%main1
%display(b.machine);
%display(machine);
%m=edit1_Callback();
%display(m);
%guidata(hObject, handles);
%calling3(20,20)

% ---1-----------------------------------------------------------------
function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject); 
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'radiobutton1'
        % Code for when radiobutton1 is selected.
        handles.count=1;
        
    case 'radiobutton2'
        % Code for when radiobutton2 is selected.
        handles.count=2;   
        
    otherwise
        % Code for when there is no match.
        msgbox('Select any Algorithm');
end
%display(count);
guidata(hObject, handles);

% --------------------------------------------------------------------
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject); 
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'radiobutton3'
        % Code for when radiobutton1 is selected.
        handles.check=1;
    case 'radiobutton4'
        % Code for when radiobutton2 is selected.
        handles.check=2;
    otherwise
        % Code for when there is no match.
        msgbox('Select any Algorithm');
end
guidata(hObject, handles);
