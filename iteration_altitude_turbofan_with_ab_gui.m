function varargout = iteration_altitude_turbofan_with_ab_gui(varargin)
% iteration_altitude_turbofan_with_ab_gui MATLAB code for iteration_altitude_turbofan_with_ab_gui.fig
%      iteration_altitude_turbofan_with_ab_gui, by itself, creates a new iteration_altitude_turbofan_with_ab_gui or raises the existing
%      singleton*.
%
%      H = iteration_altitude_turbofan_with_ab_gui returns the handle to a new iteration_altitude_turbofan_with_ab_gui or the handle to
%      the existing singleton*.
%
%      iteration_altitude_turbofan_with_ab_gui('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in iteration_altitude_turbofan_with_ab_gui.M with the given input arguments.
%
%      iteration_altitude_turbofan_with_ab_gui('Property','Value',...) creates a new iteration_altitude_turbofan_with_ab_gui or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before iteration_altitude_turbofan_with_ab_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to iteration_altitude_turbofan_with_ab_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help iteration_altitude_turbofan_with_ab_gui

% Last Modified by GUIDE v2.5 13-Jun-2015 21:52:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @iteration_altitude_turbofan_with_ab_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @iteration_altitude_turbofan_with_ab_gui_OutputFcn, ...
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


% --- Executes just before iteration_altitude_turbofan_with_ab_gui is made visible.
function iteration_altitude_turbofan_with_ab_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to iteration_altitude_turbofan_with_ab_gui (see VARARGIN)

% Choose default command line output for iteration_altitude_turbofan_with_ab_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%SAVING DEFAULT VALUES
handles.level = 1;
handles.Wu = 42e6;
handles.inlet = 1;
handles.turbine = 1;
handles.nozzle = 1;
handles.height = 0;
handles.step = 1000;
handles.end = 10000;
handles.M0 = 0.5;
handles.mdot0 = 400;
handles.M1 = -1;
handles.M2 = -1;
handles.M5 = -1;
handles.M7 = -1;
handles.M3i2 = -1;
handles.BR = 1.5;
handles.piF = 3.5;
handles.piC = 35;
handles.FtoLPC = 1;
handles.temperature = 1890;
handles.temperature7 = 2000;
handles.vc = 0.01;
handles.cool1 = 0.05;
handles.cool2 = 0.05;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes iteration_altitude_turbofan_with_ab_gui wait for user response (see UIRESUME)
% uiwait(handles.iteration_altitude_turbofan_with_ab_gui);


% --- Outputs from this function are returned to the command line.
function varargout = iteration_altitude_turbofan_with_ab_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in engine_level_menu.
function engine_level_menu_Callback(hObject, eventdata, handles)
% hObject    handle to engine_level_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns engine_level_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from engine_level_menu

contents = cellstr(get(hObject,'String'));
selected = contents{get(hObject,'Value')};
switch selected
    case 'Oldest engine'
        handles.level = 1;
    case 'Old engine'
        handles.level = 2;
    case 'Modern engine'
        handles.level = 3;
    case 'Future engine'
        handles.level = 4;
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function engine_level_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to engine_level_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in inlet_level_menu.
function inlet_level_menu_Callback(hObject, eventdata, handles)
% hObject    handle to inlet_level_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns inlet_level_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from inlet_level_menu

contents = cellstr(get(hObject,'String'));
selected = contents{get(hObject,'Value')};
switch selected
    case 'Subsonic in nacelle'
        handles.inlet = 1;
    case 'Subsonic in airframe'
        handles.inlet = 2;
    case 'Supersonic in airframe'
        handles.inlet = 3;
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function inlet_level_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inlet_level_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in turbine_level_menu.
function turbine_level_menu_Callback(hObject, eventdata, handles)
% hObject    handle to turbine_level_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns turbine_level_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from turbine_level_menu

contents = cellstr(get(hObject,'String'));
selected = contents{get(hObject,'Value')};
switch selected
    case 'Uncooled turbine'
        handles.turbine = 1;
    case 'Cooled turbine'
        handles.turbine = 2;
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function turbine_level_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to turbine_level_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in nozzle_level_menu.
function nozzle_level_menu_Callback(hObject, eventdata, handles)
% hObject    handle to nozzle_level_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns nozzle_level_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from nozzle_level_menu

contents = cellstr(get(hObject,'String'));
selected = contents{get(hObject,'Value')};
switch selected
    case 'Fixed-area convergent nozzle'
        handles.nozzle = 1;
    case 'Variable-area convergent nozzle'
        handles.nozzle = 2;
    case 'Variable-area convergent-divergent nozzle'
        handles.nozzle = 3;
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function nozzle_level_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nozzle_level_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function flight_height_value_Callback(hObject, eventdata, handles)
% hObject    handle to flight_height_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of flight_height_value as text
%        str2double(get(hObject,'String')) returns contents of flight_height_value as a double

handles.height = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function flight_height_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to flight_height_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function flight_mach_value_Callback(hObject, eventdata, handles)
% hObject    handle to flight_mach_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of flight_mach_value as text
%        str2double(get(hObject,'String')) returns contents of flight_mach_value as a double

handles.M0 = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function flight_mach_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to flight_mach_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mdot_value_Callback(hObject, eventdata, handles)
% hObject    handle to mdot_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mdot_value as text
%        str2double(get(hObject,'String')) returns contents of mdot_value as a double

handles.mdot0 = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function mdot_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mdot_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m1_value_Callback(hObject, eventdata, handles)
% hObject    handle to m1_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m1_value as text
%        str2double(get(hObject,'String')) returns contents of m1_value as a double

handles.M1 = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function m1_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m1_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m2_value_Callback(hObject, eventdata, handles)
% hObject    handle to m2_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m2_value as text
%        str2double(get(hObject,'String')) returns contents of m2_value as a double

handles.M2 = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function m2_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m2_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function m5_value_Callback(hObject, eventdata, handles)
% hObject    handle to m5_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m5_value as text
%        str2double(get(hObject,'String')) returns contents of m5_value as a double

handles.M5 = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function m5_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m5_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function m32_value_Callback(hObject, eventdata, handles)
% hObject    handle to m32_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m32_value as text
%        str2double(get(hObject,'String')) returns contents of m32_value as a double

handles.M3i2 = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function m32_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m32_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function br_value_Callback(hObject, eventdata, handles)
% hObject    handle to br_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of br_value as text
%        str2double(get(hObject,'String')) returns contents of br_value as a double

handles.BR = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function br_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to br_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pif_value_Callback(hObject, eventdata, handles)
% hObject    handle to pif_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pif_value as text
%        str2double(get(hObject,'String')) returns contents of pif_value as a double

handles.piF = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function pif_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pif_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pic_value_Callback(hObject, eventdata, handles)
% hObject    handle to pic_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pic_value as text
%        str2double(get(hObject,'String')) returns contents of pic_value as a double

handles.piC = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function pic_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pic_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ftolpc_value_Callback(hObject, eventdata, handles)
% hObject    handle to ftolpc_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ftolpc_value as text
%        str2double(get(hObject,'String')) returns contents of ftolpc_value as a double

handles.FtoLPC = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function ftolpc_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ftolpc_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function tt4_value_Callback(hObject, eventdata, handles)
% hObject    handle to tt4_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tt4_value as text
%        str2double(get(hObject,'String')) returns contents of tt4_value as a double

handles.temperature = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function tt4_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tt4_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function bleedair_value_Callback(hObject, eventdata, handles)
% hObject    handle to bleedair_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bleedair_value as text
%        str2double(get(hObject,'String')) returns contents of bleedair_value as a double

handles.vc = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function bleedair_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bleedair_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function coolingair_1_value_Callback(hObject, eventdata, handles)
% hObject    handle to coolingair_1_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of coolingair_1_value as text
%        str2double(get(hObject,'String')) returns contents of coolingair_1_value as a double

handles.cool1 = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function coolingair_1_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to coolingair_1_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function coolingair_2_value_Callback(hObject, eventdata, handles)
% hObject    handle to coolingair_2_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of coolingair_2_value as text
%        str2double(get(hObject,'String')) returns contents of coolingair_2_value as a double

handles.cool2 = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function coolingair_2_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to coolingair_2_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in calculate_button.
function calculate_button_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Update handles structure
guidata(hObject, handles);

assignin('base', 'level', handles.level);
assignin('base', 'Wu', handles.Wu);
assignin('base', 'inlet', handles.inlet);
assignin('base', 'turbine', handles.turbine);
assignin('base', 'nozzle', handles.nozzle);
assignin('base', 'height', handles.height);
assignin('base', 'M0', handles.M0);
assignin('base', 'mdot0', handles.mdot0);
assignin('base', 'M1', handles.M1);
assignin('base', 'M2', handles.M2);
assignin('base', 'M5', handles.M5);
assignin('base', 'M3i2', handles.M3i2);
assignin('base', 'BR', handles.BR);
assignin('base', 'piF', handles.piF);
assignin('base', 'piC', handles.piC);
assignin('base', 'FtoLPC', handles.FtoLPC);
assignin('base', 'temperature', handles.temperature);
assignin('base', 'temperature7', handles.temperature7);
assignin('base', 'vc', handles.vc);
assignin('base', 'cool1', handles.cool1);
assignin('base', 'cool2', handles.cool2);

% Update handles structure
guidata(hObject, handles);

% step counter initializing
i = 1;
iterations = (handles.end-handles.height)/handles.step+1;
height = handles.height;

%initializing output matrix
out = zeros(round(iterations),11);

%iterations
while height<handles.end+handles.step
    [parameters, nozzle_int, out_int, out_ext, out_int_plot, mdot_f, mdot_fAB, alpha, alpha_AB, lf, lHPT, lHPC, lLPT, lLPC, f, kj, Tr, bj, etat, etap, eta ] = turbofan_with_ab(handles.level, handles.Wu, handles.inlet, handles.turbine, handles.nozzle, height, handles.M0, handles.mdot0, handles.M1, handles.M2, handles.M3i2, handles.M5, handles.M7, handles.BR, handles.piF, handles.piC, handles.FtoLPC, handles.temperature, handles.temperature7, handles.vc, handles.cool1, handles.cool2);
    
    out(i,1) = height;
    out(i,2) = kj;
    out(i,3) = mdot_f;
    out(i,4) = mdot_fAB;
    out(i,5) = bj;
    out(i,6) = out_int(13,5)/out_int(13,7); %pt9/p9
    out(i,7) = out_int(1,7)/out_int(13,7); %p0/p9
    out(i,8) = out_int(13,10)/out_int(1,10); %v9/v0
    out(i,9) = etat;
    out(i,10) = etap;
    out(i,11) = eta;
    
    i = i + 1;
    height = height + handles.step;
end

if isreal(out)==0
    errordlg('Complex values in output! Propably too high BR or other parameters wrong.')
end

assignin('base', 'parameters', parameters);
assignin('base', 'out', out);

close(iteration_altitude_turbofan_with_ab_gui)
run('iteration_altitude_postproc_with_ab');


function wu_value_Callback(hObject, eventdata, handles)
% hObject    handle to wu_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wu_value as text
%        str2double(get(hObject,'String')) returns contents of wu_value as a double

handles.Wu = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function wu_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wu_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save_workspace.
function save_workspace_Callback(hObject, eventdata, handles)
% hObject    handle to save_workspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function tt7_value_Callback(hObject, eventdata, handles)
% hObject    handle to tt7_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tt7_value as text
%        str2double(get(hObject,'String')) returns contents of tt7_value as a double

handles.temperature7 = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function tt7_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tt7_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m7_value_Callback(hObject, eventdata, handles)
% hObject    handle to m7_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m7_value as text
%        str2double(get(hObject,'String')) returns contents of m7_value as a double

handles.M7 = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function m7_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m7_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function step_value_text_Callback(hObject, eventdata, handles)
% hObject    handle to step_value_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of step_value_text as text
%        str2double(get(hObject,'String')) returns contents of step_value_text as a double

handles.step = str2double(get(hObject,'String'));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function step_value_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to step_value_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function end_value_text_Callback(hObject, eventdata, handles)
% hObject    handle to end_value_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of end_value_text as text
%        str2double(get(hObject,'String')) returns contents of end_value_text as a double

handles.end = str2double(get(hObject,'String'));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function end_value_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to end_value_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in back_button.
function back_button_Callback(hObject, eventdata, handles)
% hObject    handle to back_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(iteration_altitude_turbofan_with_ab_gui)
run('iteration_engine_choose')
