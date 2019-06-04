function varargout = selector(varargin)
% SELECTOR MATLAB code for selector.fig
%      SELECTOR, by itself, creates a new SELECTOR or raises the existing
%      singleton*.
%
%      H = SELECTOR returns the handle to a new SELECTOR or the handle to
%      the existing singleton*.
%
%      SELECTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECTOR.M with the given input arguments.
%
%      SELECTOR('Property','Value',...) creates a new SELECTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before selector_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to selector_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help selector

% Last Modified by GUIDE v2.5 04-Jun-2019 14:39:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @selector_OpeningFcn, ...
                   'gui_OutputFcn',  @selector_OutputFcn, ...
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


% --- Executes just before selector is made visible.
function selector_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to selector (see VARARGIN)

% Choose default command line output for selector
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes selector wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = selector_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
var = get(handles.edit_muelle, 'String');
find_system('Name', 'Proyecto_Final');
open_system('Proyecto_Final');
set_param('Proyecto_Final/cons_pos_ini', 'Value',var)
set_param(gcs, 'SimulationCommand', 'Start')



function edit_muelle_Callback(hObject, eventdata, handles)
% hObject    handle to edit_muelle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_muelle as text
%        str2double(get(hObject,'String')) returns contents of edit_muelle as a double


% --- Executes during object creation, after setting all properties.
function edit_muelle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_muelle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_barco_Callback(hObject, eventdata, handles)
% hObject    handle to edit_barco (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_barco as text
%        str2double(get(hObject,'String')) returns contents of edit_barco as a double


% --- Executes during object creation, after setting all properties.
function edit_barco_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_barco (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_hacia_Callback(hObject, eventdata, handles)
% hObject    handle to edit_hacia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_hacia as text
%        str2double(get(hObject,'String')) returns contents of edit_hacia as a double


% --- Executes during object creation, after setting all properties.
function edit_hacia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_hacia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
var = get(handles.edit_barco, 'String');
find_system('Name', 'Proyecto_Final');
open_system('Proyecto_Final');
set_param('Proyecto_Final/cons_pos_fin', 'Value',var)
set_param(gcs, 'SimulationCommand', 'Start')
%assignin('base', 'pos_fin', pos_fin)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
var = get(handles.edit_hacia, 'String');
find_system('Name', 'Proyecto_Final');
open_system('Proyecto_Final');
set_param('Proyecto_Final/cons_to_ship', 'Value',var)
set_param(gcs, 'SimulationCommand', 'Start')


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
open_system('Proyecto_Final');
set_param('Proyecto_Final/submit_GUI', 'Value','1')
set_param(gcs, 'SimulationCommand', 'Start')


% --- Executes on key press with focus on pushbutton6 and none of its controls.
function pushbutton6_KeyPressFcn(hObject, eventdata, handles)
%find_system('Name', 'Proyecto_Final');


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton6.
function pushbutton6_ButtonDownFcn(hObject, eventdata, handles)
open_system('Proyecto_Final');
set_param('Proyecto_Final/submit_GUI', 'Value','0')
set_param(gcs, 'SimulationCommand', 'Start')


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open_system('Proyecto_Final');
set_param('Proyecto_Final/submit_GUI', 'Value','0')
set_param(gcs, 'SimulationCommand', 'Start')
% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
open_system('Proyecto_Final');
set_param('Proyecto_Final/submit_GUI', 'Value','0')
set_param(gcs, 'SimulationCommand', 'Start')
