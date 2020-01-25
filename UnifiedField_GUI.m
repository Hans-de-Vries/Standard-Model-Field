function varargout = UnifiedField_GUI(varargin)
% UNIFIEDFIELD_GUI MATLAB code for UnifiedField_GUI.fig
%      UNIFIEDFIELD_GUI, by itself, creates a new UNIFIEDFIELD_GUI or raises the existing
%      singleton*.
%
%      H = UNIFIEDFIELD_GUI returns the handle to a new UNIFIEDFIELD_GUI or the handle to
%      the existing singleton*.
%
%      UNIFIEDFIELD_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNIFIEDFIELD_GUI.M with the given input arguments.
%
%      UNIFIEDFIELD_GUI('Property','Value',...) creates a new UNIFIEDFIELD_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UnifiedField_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UnifiedField_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UnifiedField_GUI

% Last Modified by GUIDE v2.5 01-Oct-2018 17:39:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UnifiedField_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @UnifiedField_GUI_OutputFcn, ...
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


% --- Executes just before UnifiedField_GUI is made visible.
function UnifiedField_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UnifiedField_GUI (see VARARGIN)

% Choose default command line output for UnifiedField_GUI
handles.output = hObject;
global EVENT

EVENT.handles     = handles;
EVENT.figure_Main = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UnifiedField_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure_Main_Window);


% --- Outputs from this function are returned to the command line.
function varargout = UnifiedField_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;







% ----------------------------------------------------------------------------------------------------------
%% slider_Time
% ----------------------------------------------------------------------------------------------------------

% --- Executes on slider movement.
function slider_Time_Callback(hObject, eventdata, handles)
% hObject    handle to slider_Time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global EVENT

EVENT.slider_Time_value = round(get(hObject,'Value'));

entry  = round(get(hObject,'Value'));
maxpos = round(get(hObject,'Max'));
width  = EVENT.Timeline_Cursor_Position(3);
 
set(EVENT.handles.uipanel_Cursor_Line,'Position', EVENT.Timeline_Cursor_Position + [2*(entry-1)*720/maxpos/width,0,0,0] );

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
EVENT.signal_GUI_visualization_event = true;


% --- Executes during object creation, after setting all properties.
function slider_Time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_Time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end







% ----------------------------------------------------------------------------------------------------------
%% popupmenu_Sequence
% ----------------------------------------------------------------------------------------------------------


% --- Executes on selection change in popupmenu_Sequence.
function popupmenu_Sequence_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Sequence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Sequence_choice = get(hObject,'Value');
EVENT.signal_GUI_data_input_event = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Sequence contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Sequence


% --- Executes during object creation, after setting all properties.
function popupmenu_Sequence_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Sequence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end







% ----------------------------------------------------------------------------------------------------------
%% popupmenu_Visualize
% ----------------------------------------------------------------------------------------------------------

% --- Executes on selection change in popupmenu_Visualize.
function popupmenu_Visualize_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Visualize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Visualization_choice = get(hObject,'Value');
EVENT.signal_GUI_data_input_event = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Visualize contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Visualize


% --- Executes during object creation, after setting all properties.
function popupmenu_Visualize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Visualize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end













% ----------------------------------------------------------------------------------------------------------
%% pushbutton_Generator_Type
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in pushbutton_Generator_Type1.
function pushbutton_Generator_Type1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Generator_Type1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Show_Operator_Field_choice      = 1;
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Field1_Selections, 'Visible','Off');
set(EVENT.handles.uipanel_Special_Generator1,'Visible','On' );

% --- Executes on button press in pushbutton_Generator_Type2.
function pushbutton_Generator_Type2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Generator_Type2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Show_Operator_Field_choice      = 2;
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Field2_Selections, 'Visible','Off');
set(EVENT.handles.uipanel_Special_Generator2,'Visible','On' );

% --- Executes on button press in pushbutton_Generator_Type3.
function pushbutton_Generator_Type3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Generator_Type3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Show_Operator_Field_choice      = 3;
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Field3_Selections, 'Visible','Off');
set(EVENT.handles.uipanel_Special_Generator3,'Visible','On' );






% ----------------------------------------------------------------------------------------------------------
%% pushbutton_Generator_FieldNr
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in pushbutton_Generator_FieldNr1.
function pushbutton_Generator_FieldNr1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Generator_FieldNr1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

if  EVENT.Generator_FieldNr(1) < 3
    EVENT.Generator_FieldNr(1)  = EVENT.Generator_FieldNr(1) + 1;
else    
    EVENT.Generator_FieldNr(1)  = 1;
end
if EVENT.Use_generators_for_all_particles
   EVENT.Generator_FieldNr(2) = EVENT.Generator_FieldNr(1);
   EVENT.Generator_FieldNr(3) = EVENT.Generator_FieldNr(1);
end

EVENT.signal_GUI_data_input_event     = true;


% --- Executes on button press in pushbutton_Generator_FieldNr2.
function pushbutton_Generator_FieldNr2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Generator_FieldNr2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

if  EVENT.Generator_FieldNr(2) < 3
    EVENT.Generator_FieldNr(2)  = EVENT.Generator_FieldNr(2) + 1;
else    
    EVENT.Generator_FieldNr(2)  = 1;
end
EVENT.signal_GUI_data_input_event     = true;


% --- Executes on button press in pushbutton_Generator_FieldNr3.
function pushbutton_Generator_FieldNr3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Generator_FieldNr3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

if  EVENT.Generator_FieldNr(3) < 3
    EVENT.Generator_FieldNr(3)  = EVENT.Generator_FieldNr(3) + 1;
else    
    EVENT.Generator_FieldNr(3)  = 1;
end
EVENT.signal_GUI_data_input_event     = true;




% ----------------------------------------------------------------------------------------------------------
%% pushbutton_Generator_ChargeSign
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in pushbutton_Generator_ChargeSign1.
function pushbutton_Generator_ChargeSign1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Generator_ChargeSign1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_ChargeSign(1)     = -EVENT.Generator_ChargeSign(1);
if EVENT.Use_generators_for_all_particles
   EVENT.Generator_ChargeSign(2) = EVENT.Generator_ChargeSign(1);
   EVENT.Generator_ChargeSign(3) = EVENT.Generator_ChargeSign(1);
end

EVENT.signal_GUI_data_input_event = true;


% --- Executes on button press in pushbutton_Generator_ChargeSign2.
function pushbutton_Generator_ChargeSign2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Generator_ChargeSign2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_ChargeSign(2)     = -EVENT.Generator_ChargeSign(2);
EVENT.signal_GUI_data_input_event = true;


% --- Executes on button press in pushbutton_Generator_ChargeSign3.
function pushbutton_Generator_ChargeSign3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Generator_ChargeSign3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_ChargeSign(3)     = -EVENT.Generator_ChargeSign(3);
EVENT.signal_GUI_data_input_event = true;







% ----------------------------------------------------------------------------------------------------------
%% pushbutton_Generator_ChargeValue
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in pushbutton_Generator_ChargeValue1.
function pushbutton_Generator_ChargeValue1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Generator_ChargeValue1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

if  EVENT.Generator_ChargeValue(1) < 3
    EVENT.Generator_ChargeValue(1)  = EVENT.Generator_ChargeValue(1) + 1;
else    
    EVENT.Generator_ChargeValue(1)  = 0;
end

if EVENT.Use_generators_for_all_particles
   EVENT.Generator_ChargeValue(2) = EVENT.Generator_ChargeValue(1);
   EVENT.Generator_ChargeValue(3) = EVENT.Generator_ChargeValue(1);
end

EVENT.signal_GUI_data_input_event     = true;

% --- Executes on button press in pushbutton_Generator_ChargeValue2.
function pushbutton_Generator_ChargeValue2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Generator_ChargeValue2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

if  EVENT.Generator_ChargeValue(2) < 3
    EVENT.Generator_ChargeValue(2)  = EVENT.Generator_ChargeValue(2) + 1;
else    
    EVENT.Generator_ChargeValue(2)  = 0;
end
EVENT.signal_GUI_data_input_event     = true;

% --- Executes on button press in pushbutton_Generator_ChargeValue3.
function pushbutton_Generator_ChargeValue3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Generator_ChargeValue3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

if  EVENT.Generator_ChargeValue(3) < 3
    EVENT.Generator_ChargeValue(3)  = EVENT.Generator_ChargeValue(3) + 1;
else    
    EVENT.Generator_ChargeValue(3)  = 0;
end
EVENT.signal_GUI_data_input_event     = true;







% ----------------------------------------------------------------------------------------------------------
%% pushbutton_Generator_Generation
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in pushbutton_Generator_Generation1.
function pushbutton_Generator_Generation1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Generator_Generation1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

if  EVENT.Generator_Generation(1) < 3
    EVENT.Generator_Generation(1)  = EVENT.Generator_Generation(1) + 1;
else    
    EVENT.Generator_Generation(1)  = 0;
end

if EVENT.Use_generators_for_all_particles
   EVENT.Generator_Generation(2) = EVENT.Generator_Generation(1);
   EVENT.Generator_Generation(3) = EVENT.Generator_Generation(1);
end

EVENT.signal_GUI_data_input_event     = true;

% --- Executes on button press in pushbutton_Generator_Generation2.
function pushbutton_Generator_Generation2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Generator_Generation2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

if  EVENT.Generator_Generation(2) < 3
    EVENT.Generator_Generation(2)  = EVENT.Generator_Generation(2) + 1;
else    
    EVENT.Generator_Generation(2)  = 0;
end
EVENT.signal_GUI_data_input_event     = true;

% --- Executes on button press in pushbutton_Generator_Generation3.
function pushbutton_Generator_Generation3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Generator_Generation3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

if  EVENT.Generator_Generation(3) < 3
    EVENT.Generator_Generation(3)  = EVENT.Generator_Generation(3) + 1;
else    
    EVENT.Generator_Generation(3)  = 0;
end
EVENT.signal_GUI_data_input_event     = true;





% ----------------------------------------------------------------------------------------------------------
%% pushbutton_Generator_LorR
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in pushbutton_Generator_LorR1.
function pushbutton_Generator_LorR1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Generator_LorR1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_LorR(1)     = -EVENT.Generator_LorR(1);
if EVENT.Use_generators_for_all_particles
   EVENT.Generator_LorR(2) = EVENT.Generator_LorR(1);
   EVENT.Generator_LorR(3) = EVENT.Generator_LorR(1);
end
EVENT.signal_GUI_data_input_event = true;

% --- Executes on button press in pushbutton_Generator_LorR2.
function pushbutton_Generator_LorR2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Generator_LorR2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_LorR(2)     = -EVENT.Generator_LorR(2);
EVENT.signal_GUI_data_input_event = true;

% --- Executes on button press in pushbutton_Generator_LorR3.
function pushbutton_Generator_LorR3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Generator_LorR3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_LorR(3)     = -EVENT.Generator_LorR(3);
EVENT.signal_GUI_data_input_event = true;









% ----------------------------------------------------------------------------------------------------------
%% popupmenu_Select_Boson_Field_Generator
% ----------------------------------------------------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%% DUMMY VERSION TO HOLD ALL MENU LISTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on selection change in popupmenu_Select_Boson_Field_Generator0.
function popupmenu_Select_Boson_Field_Generator0_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Boson_Field_Generator0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Boson_Field_Generator0 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Boson_Field_Generator0


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Boson_Field_Generator0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Boson_Field_Generator0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on selection change in popupmenu_Select_Boson_Field_Generator1.
function popupmenu_Select_Boson_Field_Generator1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Boson_Field_Generator1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT


EVENT.EW_Boson_Generator_choice(1) = get(hObject,'Value');

%--- using this popup selects also the class of the generator -----
EVENT.Generator_Select(1) = 0;

if EVENT.Use_generators_for_all_particles
   EVENT.EW_Boson_Generator_choice(2)   = get(hObject,'Value');
   EVENT.EW_Boson_Generator_choice(3)   = get(hObject,'Value');
   set(EVENT.handles.popupmenu_Select_Boson_Field_Generator2,'Value',get(hObject,'Value'));
   set(EVENT.handles.popupmenu_Select_Boson_Field_Generator3,'Value',get(hObject,'Value'));
   EVENT.Generator_Select(2) = 0;
   EVENT.Generator_Select(3) = 0;
end

EVENT.signal_GUI_data_input_event     = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Boson_Field_Generator1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Boson_Field_Generator1


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Boson_Field_Generator1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Boson_Field_Generator1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_Select_Boson_Field_Generator2.
function popupmenu_Select_Boson_Field_Generator2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Boson_Field_Generator2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.EW_Boson_Generator_choice(2) = get(hObject,'Value');

%--- using this popup selects also the class of the generator -----
EVENT.Generator_Select(2) = 0;

EVENT.signal_GUI_data_input_event     = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Boson_Field_Generator2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Boson_Field_Generator2


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Boson_Field_Generator2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Boson_Field_Generator2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_Select_Boson_Field_Generator3.
function popupmenu_Select_Boson_Field_Generator3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Boson_Field_Generator3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.EW_Boson_Generator_choice(3) = get(hObject,'Value');

%--- using this popup selects also the class of the generator -----
EVENT.Generator_Select(3) = 0;

EVENT.signal_GUI_data_input_event     = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Boson_Field_Generator3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Boson_Field_Generator3


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Boson_Field_Generator3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Boson_Field_Generator3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end











% ----------------------------------------------------------------------------------------------------------
%% popupmenu_Select_Lorentz_Field_Generator
% ----------------------------------------------------------------------------------------------------------

% --- Executes on selection change in popupmenu_Select_Poincare_Field_Generator1.
function popupmenu_Select_Poincare_Field_Generator1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Poincare_Field_Generator1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

   EVENT.Poincare_Generator_choice(1) = get(hObject,'Value');
%--- using this popup selects also the class of the generator -----
   EVENT.Generator_Select(1) = 1;
   
if EVENT.Use_generators_for_all_particles
   EVENT.Poincare_Generator_choice(2) = get(hObject,'Value');
   EVENT.Poincare_Generator_choice(3) = get(hObject,'Value');
   set(EVENT.handles.popupmenu_Select_Poincare_Field_Generator2,'Value',get(hObject,'Value'));
   set(EVENT.handles.popupmenu_Select_Poincare_Field_Generator3,'Value',get(hObject,'Value'));
   EVENT.Generator_Select(2) = 1;
   EVENT.Generator_Select(3) = 1;
end
EVENT.Show_Operator_Field_choice  = 1;
EVENT.signal_GUI_data_input_event = true;

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Poincare_Field_Generator1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Poincare_Field_Generator1


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Poincare_Field_Generator1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Poincare_Field_Generator1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenu_Select_Poincare_Field_Generator2.
function popupmenu_Select_Poincare_Field_Generator2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Poincare_Field_Generator2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Poincare_Generator_choice(2) = get(hObject,'Value');
%--- using this popup selects also the class of the generator -----
EVENT.Generator_Select(2) = 1;

EVENT.Show_Operator_Field_choice  = 2;
EVENT.signal_GUI_data_input_event = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Poincare_Field_Generator2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Poincare_Field_Generator2


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Poincare_Field_Generator2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Poincare_Field_Generator2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenu_Select_Poincare_Field_Generator3.
function popupmenu_Select_Poincare_Field_Generator3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Poincare_Field_Generator3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Poincare_Generator_choice(3) = get(hObject,'Value');
%--- using this popup selects also the class of the generator -----
EVENT.Generator_Select(3) = 1;

EVENT.Show_Operator_Field_choice  = 3;
EVENT.signal_GUI_data_input_event = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Poincare_Field_Generator3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Poincare_Field_Generator3


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Poincare_Field_Generator3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Poincare_Field_Generator3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






% ----------------------------------------------------------------------------------------------------------
%% popupmenu_Select_Internal_Field_Generator
% ----------------------------------------------------------------------------------------------------------

% --- Executes on selection change in popupmenu_Select_Internal_Field_Generator1.
function popupmenu_Select_Internal_Field_Generator1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Internal_Field_Generator1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

   EVENT.Internal_Generator_choice(1) = get(hObject,'Value');
%--- using this popup selects also the class of the generator -----
EVENT.Generator_Select(1) = 1;
   
if EVENT.Use_generators_for_all_particles
   EVENT.Internal_Generator_choice(2) = get(hObject,'Value');
   EVENT.Internal_Generator_choice(3) = get(hObject,'Value');
   set(EVENT.handles.popupmenu_Select_Internal_Field_Generator2,'Value',get(hObject,'Value'));
   set(EVENT.handles.popupmenu_Select_Internal_Field_Generator3,'Value',get(hObject,'Value'));
   EVENT.Generator_Select(2) = 1;
   EVENT.Generator_Select(3) = 1;
end
EVENT.Show_Operator_Field_choice   = 1;
EVENT.signal_GUI_data_input_event  = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Internal_Field_Generator1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Internal_Field_Generator1


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Internal_Field_Generator1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Internal_Field_Generator1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_Select_Internal_Field_Generator2.
function popupmenu_Select_Internal_Field_Generator2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Internal_Field_Generator2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Internal_Generator_choice(2) = get(hObject,'Value');
%--- using this popup selects also the class of the generator -----
EVENT.Generator_Select(2) = 1;

EVENT.Show_Operator_Field_choice   = 2;
EVENT.signal_GUI_data_input_event  = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Internal_Field_Generator2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Internal_Field_Generator2


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Internal_Field_Generator2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Internal_Field_Generator2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_Select_Internal_Field_Generator3.
function popupmenu_Select_Internal_Field_Generator3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Internal_Field_Generator3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Internal_Generator_choice(3) = get(hObject,'Value');
%--- using this popup selects also the class of the generator -----
EVENT.Generator_Select(3) = 1;

EVENT.Show_Operator_Field_choice   = 3;
EVENT.signal_GUI_data_input_event  = true;
%Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Internal_Field_Generator3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Internal_Field_Generator3


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Internal_Field_Generator3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Internal_Field_Generator3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end







% ----------------------------------------------------------------------------------------------------------
%% pushbutton_Fermion_Ninv
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in pushbutton_Fermion_Ninv1.
function pushbutton_Fermion_Ninv1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_Ninv1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Ninv_choice(1)       =  -EVENT.Fermion_Ninv_choice(1); % positive mass, false is negative mass
EVENT.signal_GUI_data_input_event  =   true;
if EVENT.Fermion_Ninv_choice(1)    == +1
    set(EVENT.handles.pushbutton_Fermion_Ninv1,'BackgroundColor',[245, 235, 235]/255);
else
    set(EVENT.handles.pushbutton_Fermion_Ninv1,'BackGroundColor',[255, 255, 255]/255);
end

% --- Executes on button press in pushbutton_Fermion_Ninv2.
function pushbutton_Fermion_Ninv2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_Ninv2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Ninv_choice(2)       =  -EVENT.Fermion_Ninv_choice(2); % positive mass, false is negative mass
EVENT.signal_GUI_data_input_event  =   true;
if EVENT.Fermion_Ninv_choice(2)    == +1
    set(EVENT.handles.pushbutton_Fermion_Ninv2,'BackgroundColor',[228, 240, 230]/255);
else
    set(EVENT.handles.pushbutton_Fermion_Ninv2,'BackGroundColor',[255, 255, 255]/255);
end

% --- Executes on button press in pushbutton_Fermion_Ninv3.
function pushbutton_Fermion_Ninv3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_Ninv3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Ninv_choice(3)       =  -EVENT.Fermion_Ninv_choice(3); % positive mass, false is negative mass
EVENT.signal_GUI_data_input_event  =   true;
if EVENT.Fermion_Ninv_choice(3)    == +1
    set(EVENT.handles.pushbutton_Fermion_Ninv3,'BackgroundColor',[222, 235, 250]/255);
else
    set(EVENT.handles.pushbutton_Fermion_Ninv3,'BackGroundColor',[255, 255, 255]/255);
end





% ----------------------------------------------------------------------------------------------------------
%% pushbutton_Fermion_Anti
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in pushbutton_Fermion_Anti1.
function pushbutton_Fermion_Anti1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_Anti1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Anti_choice(1)       =  -EVENT.Fermion_Anti_choice(1); % positive mass, false is negative mass
EVENT.signal_GUI_data_input_event  =   true;
if EVENT.Fermion_Anti_choice(1)    == +1
    set(EVENT.handles.pushbutton_Fermion_Anti1,'BackgroundColor',[245, 235, 235]/255);
else
    set(EVENT.handles.pushbutton_Fermion_Anti1,'BackGroundColor',[255, 255, 255]/255);
end


% --- Executes on button press in pushbutton_Fermion_Anti2.
function pushbutton_Fermion_Anti2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_Anti2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Anti_choice(2)       =  -EVENT.Fermion_Anti_choice(2); % positive mass, false is negative mass
EVENT.signal_GUI_data_input_event  =   true;
if EVENT.Fermion_Anti_choice(2)    == +1
    set(EVENT.handles.pushbutton_Fermion_Anti2,'BackgroundColor',[228, 240, 230]/255);
else
    set(EVENT.handles.pushbutton_Fermion_Anti2,'BackGroundColor',[255, 255, 255]/255);
end


% --- Executes on button press in pushbutton_Fermion_Anti3.
function pushbutton_Fermion_Anti3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_Anti3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Anti_choice(3)       =  -EVENT.Fermion_Anti_choice(3); % positive mass, false is negative mass
EVENT.signal_GUI_data_input_event  =   true;
if EVENT.Fermion_Anti_choice(3)    == +1
    set(EVENT.handles.pushbutton_Fermion_Anti3,'BackgroundColor',[222, 235, 250]/255);
else
    set(EVENT.handles.pushbutton_Fermion_Anti3,'BackGroundColor',[255, 255, 255]/255);
end







% ----------------------------------------------------------------------------------------------------------
%% pushbutton_Fermion_Pinv
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in pushbutton_Fermion_Pinv1.
function pushbutton_Fermion_Pinv1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_Pinv1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Pinv_choice(1)       =  -EVENT.Fermion_Pinv_choice(1); % positive mass, false is negative mass
EVENT.signal_GUI_data_input_event  =   true;
if EVENT.Fermion_Pinv_choice(1)    == +1
    set(EVENT.handles.pushbutton_Fermion_Pinv1,'BackgroundColor',[245, 235, 235]/255);
else
    set(EVENT.handles.pushbutton_Fermion_Pinv1,'BackGroundColor',[255, 255, 255]/255);
end

% --- Executes on button press in pushbutton_Fermion_Pinv2.
function pushbutton_Fermion_Pinv2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_Pinv2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Pinv_choice(2)       =  -EVENT.Fermion_Pinv_choice(2); % positive mass, false is negative mass
EVENT.signal_GUI_data_input_event  =   true;
if EVENT.Fermion_Pinv_choice(2)    == +1
    set(EVENT.handles.pushbutton_Fermion_Pinv2,'BackgroundColor',[228, 240, 230]/255);
else
    set(EVENT.handles.pushbutton_Fermion_Pinv2,'BackGroundColor',[255, 255, 255]/255);
end

% --- Executes on button press in pushbutton_Fermion_Pinv3.
function pushbutton_Fermion_Pinv3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_Pinv3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Pinv_choice(3)       =  -EVENT.Fermion_Pinv_choice(3); % positive mass, false is negative mass
EVENT.signal_GUI_data_input_event  =   true;
if EVENT.Fermion_Pinv_choice(3)    == +1
    set(EVENT.handles.pushbutton_Fermion_Pinv3,'BackgroundColor',[222, 235, 250]/255);
else
    set(EVENT.handles.pushbutton_Fermion_Pinv3,'BackGroundColor',[255, 255, 255]/255);
end






% ----------------------------------------------------------------------------------------------------------
%% pushbutton_Fermion_Tinv
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in pushbutton_Fermion_Tinv1.
function pushbutton_Fermion_Tinv1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_Tinv1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Tinv_choice(1)       =  -EVENT.Fermion_Tinv_choice(1); % positive mass, false is negative mass
EVENT.signal_GUI_data_input_event  =   true;
if EVENT.Fermion_Tinv_choice(1)    == +1
    set(EVENT.handles.pushbutton_Fermion_Tinv1,'BackgroundColor',[245, 235, 235]/255);
else
    set(EVENT.handles.pushbutton_Fermion_Tinv1,'BackGroundColor',[255, 255, 255]/255);
end

% --- Executes on button press in pushbutton_Fermion_Tinv2.
function pushbutton_Fermion_Tinv2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_Tinv2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Tinv_choice(2)       =  -EVENT.Fermion_Tinv_choice(2); % positive mass, false is negative mass
EVENT.signal_GUI_data_input_event  =   true;
if EVENT.Fermion_Tinv_choice(2)    == +1
    set(EVENT.handles.pushbutton_Fermion_Tinv2,'BackgroundColor',[228, 240, 230]/255);
else
    set(EVENT.handles.pushbutton_Fermion_Tinv2,'BackGroundColor',[255, 255, 255]/255);
end

% --- Executes on button press in pushbutton_Fermion_Tinv3.
function pushbutton_Fermion_Tinv3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_Tinv3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Tinv_choice(3)       =  -EVENT.Fermion_Tinv_choice(3); % positive mass, false is negative mass
EVENT.signal_GUI_data_input_event  =   true;
if EVENT.Fermion_Tinv_choice(3)    == +1
    set(EVENT.handles.pushbutton_Fermion_Tinv3,'BackgroundColor',[222, 235, 250]/255);
else
    set(EVENT.handles.pushbutton_Fermion_Tinv3,'BackGroundColor',[255, 255, 255]/255);
end







% ----------------------------------------------------------------------------------------------------------
%% pushbutton_Fermion_Mass
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in pushbutton_Fermion_Mass1.
function pushbutton_Fermion_Mass1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_Mass1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Mass_choice(1)       =  -EVENT.Fermion_Mass_choice(1); % positive mass, false is negative mass
EVENT.signal_GUI_data_input_event  =   true;
if EVENT.Fermion_Mass_choice(1)    == +1
    set(EVENT.handles.pushbutton_Fermion_Mass1,'String','+Mass');
    set(EVENT.handles.pushbutton_Fermion_Mass1,'BackgroundColor',[245, 235, 235]/255);
else
    set(EVENT.handles.pushbutton_Fermion_Mass1,'String','-Mass');
    set(EVENT.handles.pushbutton_Fermion_Mass1,'BackGroundColor',[255, 255, 255]/255);
end


% --- Executes on button press in pushbutton_Fermion_Mass2.
function pushbutton_Fermion_Mass2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_Mass2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Mass_choice(2)       =  -EVENT.Fermion_Mass_choice(2); % positive mass, false is negative mass
EVENT.signal_GUI_data_input_event  =   true;
if EVENT.Fermion_Mass_choice(2)    == +1
    set(EVENT.handles.pushbutton_Fermion_Mass2,'String','+Mass');
    set(EVENT.handles.pushbutton_Fermion_Mass2,'BackgroundColor',[228, 240, 230]/255);
else
    set(EVENT.handles.pushbutton_Fermion_Mass2,'String','-Mass');
    set(EVENT.handles.pushbutton_Fermion_Mass2,'BackGroundColor',[255, 255, 255]/255);
end


% --- Executes on button press in pushbutton_Fermion_Mass3.
function pushbutton_Fermion_Mass3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_Mass3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Mass_choice(3)      =  -EVENT.Fermion_Mass_choice(3); % positive mass, false is negative mass
EVENT.signal_GUI_data_input_event =  true;
if EVENT.Fermion_Mass_choice(3)   == +1
    set(EVENT.handles.pushbutton_Fermion_Mass3,'String','+Mass');
    set(EVENT.handles.pushbutton_Fermion_Mass3,'BackgroundColor',[222, 235, 250]/255);
else
    set(EVENT.handles.pushbutton_Fermion_Mass3,'String','-Mass');
    set(EVENT.handles.pushbutton_Fermion_Mass3,'BackGroundColor',[255, 255, 255]/255);
end













% ----------------------------------------------------------------------------------------------------------
%% pushbutton_Fermion_Pseu
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in pushbutton_Fermion_Pseu1.
function pushbutton_Fermion_Pseu1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_Pseu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Pseu_choice(1)       =  -EVENT.Fermion_Pseu_choice(1); % positive mass, false is negative mass
EVENT.signal_GUI_data_input_event  =   true;
if EVENT.Fermion_Pseu_choice(1)    == +1
    set(EVENT.handles.pushbutton_Fermion_Pseu1,'BackgroundColor',[245, 235, 235]/255);
else
    set(EVENT.handles.pushbutton_Fermion_Pseu1,'BackGroundColor',[255, 255, 255]/255);
end

% --- Executes on button press in pushbutton_Fermion_Pseu2.
function pushbutton_Fermion_Pseu2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_Pseu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Pseu_choice(2)       =  -EVENT.Fermion_Pseu_choice(2); % positive mass, false is negative mass
EVENT.signal_GUI_data_input_event  =   true;
if EVENT.Fermion_Pseu_choice(2)    == +1
    set(EVENT.handles.pushbutton_Fermion_Pseu2,'BackgroundColor',[228, 240, 230]/255);
else
    set(EVENT.handles.pushbutton_Fermion_Pseu2,'BackGroundColor',[255, 255, 255]/255);
end

% --- Executes on button press in pushbutton_Fermion_Pseu3.
function pushbutton_Fermion_Pseu3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_Pseu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Pseu_choice(3)       =  -EVENT.Fermion_Pseu_choice(3); % positive mass, false is negative mass
EVENT.signal_GUI_data_input_event  =   true;
if EVENT.Fermion_Pseu_choice(3)    == +1
    set(EVENT.handles.pushbutton_Fermion_Pseu3,'BackgroundColor',[222, 235, 250]/255);
else
    set(EVENT.handles.pushbutton_Fermion_Pseu3,'BackGroundColor',[255, 255, 255]/255);
end







% ----------------------------------------------------------------------------------------------------------
%% popupmenu_Select_Fermion_Field_Type
% ----------------------------------------------------------------------------------------------------------


% --- Executes on selection change in popupmenu_Select_Fermion_Field_Type1.
function popupmenu_Select_Fermion_Field_Type1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Field_Type1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Type_choice(1) = get(hObject,'Value');
EVENT.Show_Operator_Field_choice  = 1;
EVENT.signal_GUI_data_input_event = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Fermion_Field_Type1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Fermion_Field_Type1


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Fermion_Field_Type1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Field_Type1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_Select_Fermion_Field_Type2.
function popupmenu_Select_Fermion_Field_Type2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Field_Type2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Type_choice(2) = get(hObject,'Value');
EVENT.Show_Operator_Field_choice  = 2;
EVENT.signal_GUI_data_input_event = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Fermion_Field_Type2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Fermion_Field_Type2


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Fermion_Field_Type2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Field_Type2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_Select_Fermion_Field_Type3.
function popupmenu_Select_Fermion_Field_Type3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Field_Type3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Type_choice(3) = get(hObject,'Value');
EVENT.Show_Operator_Field_choice  = 3;
EVENT.signal_GUI_data_input_event = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Fermion_Field_Type3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Fermion_Field_Type3


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Fermion_Field_Type3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Field_Type3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end








% ----------------------------------------------------------------------------------------------------------
%% popupmenu_Select_Fermion_Spin_Direction
% ----------------------------------------------------------------------------------------------------------

% --- Executes on selection change in popupmenu_Select_Fermion_Spin_Direction1.
function popupmenu_Select_Fermion_Spin_Direction1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Spin_Direction1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Spin_Direction_choice(1) = get(hObject,'Value');
EVENT.Show_Operator_Field_choice  = 1;
EVENT.signal_GUI_data_input_event = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Fermion_Spin_Direction1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Fermion_Spin_Direction1


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Fermion_Spin_Direction1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Spin_Direction1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_Select_Fermion_Spin_Direction2.
function popupmenu_Select_Fermion_Spin_Direction2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Spin_Direction2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Spin_Direction_choice(2) = get(hObject,'Value');
EVENT.Show_Operator_Field_choice  = 2;
EVENT.signal_GUI_data_input_event = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Fermion_Spin_Direction2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Fermion_Spin_Direction2


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Fermion_Spin_Direction2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Spin_Direction2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_Select_Fermion_Spin_Direction3.
function popupmenu_Select_Fermion_Spin_Direction3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Spin_Direction3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Spin_Direction_choice(3) = get(hObject,'Value');
EVENT.Show_Operator_Field_choice  = 3;
EVENT.signal_GUI_data_input_event = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Fermion_Spin_Direction3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Fermion_Spin_Direction3


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Fermion_Spin_Direction3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Spin_Direction3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end







% ----------------------------------------------------------------------------------------------------------
%% popupmenu_Select_Fermion_Boost_Direction
% ----------------------------------------------------------------------------------------------------------

% --- Executes on selection change in popupmenu_Select_Fermion_Boost_Direction1.
function popupmenu_Select_Fermion_Boost_Direction1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Boost_Direction1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boost_Direction_choice(1) = get(hObject,'Value');
EVENT.Show_Operator_Field_choice  = 1;
EVENT.signal_GUI_data_input_event = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Fermion_Boost_Direction1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Fermion_Boost_Direction1


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Fermion_Boost_Direction1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Boost_Direction1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_Select_Fermion_Boost_Direction2.
function popupmenu_Select_Fermion_Boost_Direction2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Boost_Direction2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boost_Direction_choice(2) = get(hObject,'Value');
EVENT.Show_Operator_Field_choice  = 2;
EVENT.signal_GUI_data_input_event = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Fermion_Boost_Direction2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Fermion_Boost_Direction2


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Fermion_Boost_Direction2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Boost_Direction2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenu_Select_Fermion_Boost_Direction3.
function popupmenu_Select_Fermion_Boost_Direction3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Boost_Direction3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boost_Direction_choice(3) = get(hObject,'Value');
EVENT.Show_Operator_Field_choice  = 3;
EVENT.signal_GUI_data_input_event = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Fermion_Boost_Direction3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Fermion_Boost_Direction3


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Fermion_Boost_Direction3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Boost_Direction3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end








% ----------------------------------------------------------------------------------------------------------
%% pushbutton_Fermion_BoostAmount
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in pushbutton_Fermion_BoostAmount1.
function pushbutton_Fermion_BoostAmount1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_BoostAmount1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boost_Amount_choice(1) = EVENT.Boost_Amount_choice(1) + EVENT.Boost_Amount_step(1);

if     EVENT.Boost_Amount_choice(1) ==  5
       EVENT.Boost_Amount_step(1)   =  -1;
elseif EVENT.Boost_Amount_choice(1) == -5
       EVENT.Boost_Amount_step(1)   =  +1;
end   

choice = EVENT.Boost_Amount_choice(1);
switch choice
    case -5
        set(EVENT.handles.pushbutton_Fermion_BoostAmount1,'String','-----');
    case -4
        set(EVENT.handles.pushbutton_Fermion_BoostAmount1,'String','----');
    case -3
        set(EVENT.handles.pushbutton_Fermion_BoostAmount1,'String','---');
    case -2
        set(EVENT.handles.pushbutton_Fermion_BoostAmount1,'String','--');
    case -1
        set(EVENT.handles.pushbutton_Fermion_BoostAmount1,'String','-');
    case 0
        set(EVENT.handles.pushbutton_Fermion_BoostAmount1,'String','0');
    case 1
        set(EVENT.handles.pushbutton_Fermion_BoostAmount1,'String','+');
    case 2
        set(EVENT.handles.pushbutton_Fermion_BoostAmount1,'String','++');
    case 3
        set(EVENT.handles.pushbutton_Fermion_BoostAmount1,'String','+++');
    case 4
        set(EVENT.handles.pushbutton_Fermion_BoostAmount1,'String','++++');
    case 5
        set(EVENT.handles.pushbutton_Fermion_BoostAmount1,'String','+++++');
end
        
EVENT.signal_GUI_data_input_event = true;


% --- Executes on button press in pushbutton_Fermion_BoostAmount2.
function pushbutton_Fermion_BoostAmount2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_BoostAmount2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boost_Amount_choice(2) = EVENT.Boost_Amount_choice(2) + EVENT.Boost_Amount_step(2);
if     EVENT.Boost_Amount_choice(2) ==  5
       EVENT.Boost_Amount_step(2) = -1;
elseif EVENT.Boost_Amount_choice(2) == -5 
       EVENT.Boost_Amount_step(2) = +1;
end   

choice = EVENT.Boost_Amount_choice(2);
switch choice
    case -5
        set(EVENT.handles.pushbutton_Fermion_BoostAmount2,'String','-----');
    case -4
        set(EVENT.handles.pushbutton_Fermion_BoostAmount2,'String','----');
    case -3
        set(EVENT.handles.pushbutton_Fermion_BoostAmount2,'String','---');
    case -2
        set(EVENT.handles.pushbutton_Fermion_BoostAmount2,'String','--');
    case -1
        set(EVENT.handles.pushbutton_Fermion_BoostAmount2,'String','-');
    case 0
        set(EVENT.handles.pushbutton_Fermion_BoostAmount2,'String','0');
    case 1
        set(EVENT.handles.pushbutton_Fermion_BoostAmount2,'String','+');
    case 2
        set(EVENT.handles.pushbutton_Fermion_BoostAmount2,'String','++');
    case 3
        set(EVENT.handles.pushbutton_Fermion_BoostAmount2,'String','+++');
    case 4
        set(EVENT.handles.pushbutton_Fermion_BoostAmount2,'String','++++');
    case 5
        set(EVENT.handles.pushbutton_Fermion_BoostAmount2,'String','+++++');
end
        
EVENT.signal_GUI_data_input_event = true;


% --- Executes on button press in pushbutton_Fermion_BoostAmount3.
function pushbutton_Fermion_BoostAmount3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Fermion_BoostAmount3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boost_Amount_choice(3) = EVENT.Boost_Amount_choice(3) + EVENT.Boost_Amount_step(3);
if     EVENT.Boost_Amount_choice(3) ==  5
   EVENT.Boost_Amount_step(3) = -1;
elseif EVENT.Boost_Amount_choice(3) == -5
   EVENT.Boost_Amount_step(3) = +1;
    end   

choice = EVENT.Boost_Amount_choice(3);
switch choice
    case -5
        set(EVENT.handles.pushbutton_Fermion_BoostAmount3,'String','-----');
    case -4
        set(EVENT.handles.pushbutton_Fermion_BoostAmount3,'String','----');
    case -3
        set(EVENT.handles.pushbutton_Fermion_BoostAmount3,'String','---');
    case -2
        set(EVENT.handles.pushbutton_Fermion_BoostAmount3,'String','--');
    case -1
        set(EVENT.handles.pushbutton_Fermion_BoostAmount3,'String','-');
    case 0
        set(EVENT.handles.pushbutton_Fermion_BoostAmount3,'String','0');
    case 1
        set(EVENT.handles.pushbutton_Fermion_BoostAmount3,'String','+');
    case 2
        set(EVENT.handles.pushbutton_Fermion_BoostAmount3,'String','++');
    case 3
        set(EVENT.handles.pushbutton_Fermion_BoostAmount3,'String','+++');
    case 4
        set(EVENT.handles.pushbutton_Fermion_BoostAmount3,'String','++++');
    case 5
        set(EVENT.handles.pushbutton_Fermion_BoostAmount3,'String','+++++');
end

        
EVENT.signal_GUI_data_input_event = true;







% ----------------------------------------------------------------------------------------------------------
%% popupmenu_Select_Fermion_Phase_or_Color
% ----------------------------------------------------------------------------------------------------------

% --- Executes on selection change in popupmenu_Select_Fermion_Phase_or_Color1.
function popupmenu_Select_Fermion_Phase_or_Color1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Phase_or_Color1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Phase_or_Color_choice(1) = get(hObject,'Value');
EVENT.Show_Operator_Field_choice  = 1;
EVENT.signal_GUI_data_input_event = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Fermion_Phase_or_Color1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Fermion_Phase_or_Color1


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Fermion_Phase_or_Color1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Phase_or_Color1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_Select_Fermion_Phase_or_Color2.
function popupmenu_Select_Fermion_Phase_or_Color2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Phase_or_Color2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Phase_or_Color_choice(2) = get(hObject,'Value');
EVENT.Show_Operator_Field_choice  = 2;
EVENT.signal_GUI_data_input_event = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Fermion_Phase_or_Color2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Fermion_Phase_or_Color2


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Fermion_Phase_or_Color2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Phase_or_Color2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_Select_Fermion_Phase_or_Color3.
function popupmenu_Select_Fermion_Phase_or_Color3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Phase_or_Color3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Phase_or_Color_choice(3) = get(hObject,'Value');
EVENT.Show_Operator_Field_choice  = 3;
EVENT.signal_GUI_data_input_event = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Select_Fermion_Phase_or_Color3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Select_Fermion_Phase_or_Color3


% --- Executes during object creation, after setting all properties.
function popupmenu_Select_Fermion_Phase_or_Color3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Select_Fermion_Phase_or_Color3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end









% ----------------------------------------------------------------------------------------------------------
%% checkbox_Lagrangian_Coupling_Overrule
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in checkbox_Lagrangian_Coupling_Overrule1.
function checkbox_Lagrangian_Coupling_Overrule1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Lagrangian_Coupling_Overrule1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

   EVENT.Lagrangian_Coupling_Overrule(1) = get(hObject,'Value');
if EVENT.Use_generators_for_all_particles
   EVENT.Lagrangian_Coupling_Overrule(2) = get(hObject,'Value');
   EVENT.Lagrangian_Coupling_Overrule(3) = get(hObject,'Value');
   set(EVENT.handles.checkbox_Lagrangian_Coupling_Overrule2,'Value',get(hObject,'Value'));
   set(EVENT.handles.checkbox_Lagrangian_Coupling_Overrule3,'Value',get(hObject,'Value'));
end
EVENT.Show_Operator_Field_choice  = 1;
EVENT.signal_GUI_data_input_event = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Lagrangian_Coupling_Overrule1


% --- Executes on button press in checkbox_Lagrangian_Coupling_Overrule2.
function checkbox_Lagrangian_Coupling_Overrule2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Lagrangian_Coupling_Overrule2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Lagrangian_Coupling_Overrule(2) = get(hObject,'Value');
EVENT.Show_Operator_Field_choice  = 2;
EVENT.signal_GUI_data_input_event = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Lagrangian_Coupling_Overrule2


% --- Executes on button press in checkbox_Lagrangian_Coupling_Overrule3.
function checkbox_Lagrangian_Coupling_Overrule3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Lagrangian_Coupling_Overrule3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Lagrangian_Coupling_Overrule(3) = get(hObject,'Value');
EVENT.Show_Operator_Field_choice  = 3;
EVENT.signal_GUI_data_input_event = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Lagrangian_Coupling_Overrule3










% ----------------------------------------------------------------------------------------------------------
%% checkbox_Generator_minus
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in checkbox_Generator_minus1.
function checkbox_Generator_minus1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Generator_minus1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

   EVENT.Generator_minus(1) = get(hObject,'Value');
if EVENT.Use_generators_for_all_particles
   EVENT.Generator_minus(2) = get(hObject,'Value');
   EVENT.Generator_minus(3) = get(hObject,'Value');
   set(EVENT.handles.checkbox_Generator_minus2,'Value',get(hObject,'Value'));
   set(EVENT.handles.checkbox_Generator_minus3,'Value',get(hObject,'Value'));
end
EVENT.Show_Operator_Field_choice  = 1;
EVENT.signal_GUI_data_input_event = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Generator_minus1


% --- Executes on button press in checkbox_Generator_minus2.
function checkbox_Generator_minus2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Generator_minus2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_minus(2) = get(hObject,'Value');
EVENT.Show_Operator_Field_choice  = 2;
EVENT.signal_GUI_data_input_event = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Generator_minus2


% --- Executes on button press in checkbox_Generator_minus3.
function checkbox_Generator_minus3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Generator_minus3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_minus(3) = get(hObject,'Value');
EVENT.Show_Operator_Field_choice  = 3;
EVENT.signal_GUI_data_input_event = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Generator_minus3










% ----------------------------------------------------------------------------------------------------------
%% slider_Lagrangian_Coupling
% ----------------------------------------------------------------------------------------------------------


% --- Executes on slider movement.
function slider_Lagrangian_Coupling1_Callback(hObject, eventdata, handles)
% hObject    handle to slider_Lagrangian_Coupling1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Lagrangian_Coupling_Scale(1)    = 10^(4*get(hObject,'Value'))*0.0001;
EVENT.signal_GUI_data_input_event     = true;
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_Lagrangian_Coupling1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_Lagrangian_Coupling1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_Lagrangian_Coupling2_Callback(hObject, eventdata, handles)
% hObject    handle to slider_Lagrangian_Coupling2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
global EVENT

EVENT.Lagrangian_Coupling_Scale(2)    = 10^(4*get(hObject,'Value'))*0.0001;
EVENT.signal_GUI_data_input_event     = true;
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_Lagrangian_Coupling2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_Lagrangian_Coupling2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_Lagrangian_Coupling3_Callback(hObject, eventdata, handles)
% hObject    handle to slider_Lagrangian_Coupling3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Lagrangian_Coupling_Scale(3)    = 10^(4*get(hObject,'Value'))*0.0001;
EVENT.signal_GUI_data_input_event     = true;
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_Lagrangian_Coupling3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_Lagrangian_Coupling3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end






% ----------------------------------------------------------------------------------------------------------
%% checkbox_SumGenerators
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in checkbox_SumGenerators11.
function checkbox_SumGenerators11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_SumGenerators11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Sum_Generators(1,1) = get(hObject,'Value');
EVENT.signal_GUI_data_input_event     = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_SumGenerators11


% --- Executes on button press in checkbox_SumGenerators12.
function checkbox_SumGenerators12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_SumGenerators12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Sum_Generators(1,2) = get(hObject,'Value');
EVENT.signal_GUI_data_input_event     = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_SumGenerators12


% --- Executes on button press in checkbox_SumGenerators13.
function checkbox_SumGenerators13_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_SumGenerators13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Sum_Generators(1,3) = get(hObject,'Value');
EVENT.signal_GUI_data_input_event     = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_SumGenerators13



% --- Executes on button press in checkbox_SumGenerators21.
function checkbox_SumGenerators21_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_SumGenerators21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Sum_Generators(2,1) = get(hObject,'Value');
EVENT.signal_GUI_data_input_event     = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_SumGenerators21


% --- Executes on button press in checkbox_SumGenerators22.
function checkbox_SumGenerators22_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_SumGenerators22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Sum_Generators(2,2) = get(hObject,'Value');
EVENT.signal_GUI_data_input_event     = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_SumGenerators22


% --- Executes on button press in checkbox_SumGenerators23.
function checkbox_SumGenerators23_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_SumGenerators23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Sum_Generators(2,3) = get(hObject,'Value');
EVENT.signal_GUI_data_input_event     = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_SumGenerators23



% --- Executes on button press in checkbox_SumGenerators31.
function checkbox_SumGenerators31_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_SumGenerators31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Sum_Generators(3,1) = get(hObject,'Value');
EVENT.signal_GUI_data_input_event     = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_SumGenerators31


% --- Executes on button press in checkbox_SumGenerators32.
function checkbox_SumGenerators32_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_SumGenerators32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Sum_Generators(3,2) = get(hObject,'Value');
EVENT.signal_GUI_data_input_event     = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_SumGenerators32


% --- Executes on button press in checkbox_SumGenerators33.
function checkbox_SumGenerators33_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_SumGenerators33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Sum_Generators(3,3) = get(hObject,'Value');
EVENT.signal_GUI_data_input_event     = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_SumGenerators33








% ----------------------------------------------------------------------------------------------------------
%% checkbox_Use_generators_for_all_particles
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in checkbox_Use_generators_for_all_particles.
function checkbox_Use_generators_for_all_particles_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Use_generators_for_all_particles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Use_generators_for_all_particles = get(hObject,'Value');
EVENT.signal_GUI_data_input_event = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Use_generators_for_all_particles
















% ----------------------------------------------------------------------------------------------------------
%% edit_Lepton_Mass
% ----------------------------------------------------------------------------------------------------------


function edit_Lepton_Mass11_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Lepton_Mass11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT


EVENT.Lepton_Mass(1)  = str2double(get(hObject,'String'));
set(EVENT.handles.edit_Lepton_Mass21,'String',get(hObject,'String'));
set(EVENT.handles.edit_Lepton_Mass31,'String',get(hObject,'String'));

EVENT.signal_GUI_data_input_event     = true;
% Hints: get(hObject,'String') returns contents of edit_Lepton_Mass11 as text
%        str2double(get(hObject,'String')) returns contents of edit_Lepton_Mass11 as a double


% --- Executes during object creation, after setting all properties.
function edit_Lepton_Mass11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Lepton_Mass11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Lepton_Mass12_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Lepton_Mass12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Lepton_Mass(2)  = str2double(get(hObject,'String'));
set(EVENT.handles.edit_Lepton_Mass22,'String',get(hObject,'String'));
set(EVENT.handles.edit_Lepton_Mass32,'String',get(hObject,'String'));

EVENT.signal_GUI_data_input_event     = true;
% Hints: get(hObject,'String') returns contents of edit_Lepton_Mass12 as text
%        str2double(get(hObject,'String')) returns contents of edit_Lepton_Mass12 as a double


% --- Executes during object creation, after setting all properties.
function edit_Lepton_Mass12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Lepton_Mass12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Lepton_Mass13_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Lepton_Mass13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Lepton_Mass(3)  = str2double(get(hObject,'String'));
set(EVENT.handles.edit_Lepton_Mass23,'String',get(hObject,'String'));
set(EVENT.handles.edit_Lepton_Mass33,'String',get(hObject,'String'));

EVENT.signal_GUI_data_input_event     = true;
% Hints: get(hObject,'String') returns contents of edit_Lepton_Mass13 as text
%        str2double(get(hObject,'String')) returns contents of edit_Lepton_Mass13 as a double


% --- Executes during object creation, after setting all properties.
function edit_Lepton_Mass13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Lepton_Mass13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Lepton_Mass21_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Lepton_Mass21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Lepton_Mass(1)  = str2double(get(hObject,'String'));
set(EVENT.handles.edit_Lepton_Mass11,'String',get(hObject,'String'));
set(EVENT.handles.edit_Lepton_Mass31,'String',get(hObject,'String'));

EVENT.signal_GUI_data_input_event     = true;
% Hints: get(hObject,'String') returns contents of edit_Lepton_Mass21 as text
%        str2double(get(hObject,'String')) returns contents of edit_Lepton_Mass21 as a double


% --- Executes during object creation, after setting all properties.
function edit_Lepton_Mass21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Lepton_Mass21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Lepton_Mass22_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Lepton_Mass22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Lepton_Mass(2)  = str2double(get(hObject,'String'));
set(EVENT.handles.edit_Lepton_Mass12,'String',get(hObject,'String'));
set(EVENT.handles.edit_Lepton_Mass32,'String',get(hObject,'String'));

EVENT.signal_GUI_data_input_event     = true;
% Hints: get(hObject,'String') returns contents of edit_Lepton_Mass22 as text
%        str2double(get(hObject,'String')) returns contents of edit_Lepton_Mass22 as a double


% --- Executes during object creation, after setting all properties.
function edit_Lepton_Mass22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Lepton_Mass22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Lepton_Mass23_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Lepton_Mass23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Lepton_Mass(3)  = str2double(get(hObject,'String'));
set(EVENT.handles.edit_Lepton_Mass13,'String',get(hObject,'String'));
set(EVENT.handles.edit_Lepton_Mass33,'String',get(hObject,'String'));

EVENT.signal_GUI_data_input_event     = true;
% Hints: get(hObject,'String') returns contents of edit_Lepton_Mass23 as text
%        str2double(get(hObject,'String')) returns contents of edit_Lepton_Mass23 as a double


% --- Executes during object creation, after setting all properties.
function edit_Lepton_Mass23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Lepton_Mass23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Lepton_Mass31_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Lepton_Mass31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Lepton_Mass(1)  = str2double(get(hObject,'String'));
set(EVENT.handles.edit_Lepton_Mass11,'String',get(hObject,'String'));
set(EVENT.handles.edit_Lepton_Mass21,'String',get(hObject,'String'));

EVENT.signal_GUI_data_input_event     = true;
% Hints: get(hObject,'String') returns contents of edit_Lepton_Mass31 as text
%        str2double(get(hObject,'String')) returns contents of edit_Lepton_Mass31 as a double


% --- Executes during object creation, after setting all properties.
function edit_Lepton_Mass31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Lepton_Mass31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Lepton_Mass32_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Lepton_Mass32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Lepton_Mass(2)  = str2double(get(hObject,'String'));
set(EVENT.handles.edit_Lepton_Mass12,'String',get(hObject,'String'));
set(EVENT.handles.edit_Lepton_Mass22,'Stringe',get(hObject,'String'));

EVENT.signal_GUI_data_input_event     = true;
% Hints: get(hObject,'String') returns contents of edit_Lepton_Mass32 as text
%        str2double(get(hObject,'String')) returns contents of edit_Lepton_Mass32 as a double


% --- Executes during object creation, after setting all properties.
function edit_Lepton_Mass32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Lepton_Mass32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Lepton_Mass33_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Lepton_Mass33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Lepton_Mass(3)  = str2double(get(hObject,'String'));
set(EVENT.handles.edit_Lepton_Mass13,'String',get(hObject,'String'));
set(EVENT.handles.edit_Lepton_Mass23,'String',get(hObject,'String'));

EVENT.signal_GUI_data_input_event     = true;
% Hints: get(hObject,'String') returns contents of edit_Lepton_Mass33 as text
%        str2double(get(hObject,'String')) returns contents of edit_Lepton_Mass33 as a double


% --- Executes during object creation, after setting all properties.
function edit_Lepton_Mass33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Lepton_Mass33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end















% ----------------------------------------------------------------------------------------------------------
%% pushbutton_Show_Field_Data
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in pushbutton_Show_Fermion_Data1.
function pushbutton_Show_Fermion_Data1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Show_Fermion_Data1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Show_Operator_Field_choice    = 1;
EVENT.signal_GUI_data_input_event   = true;

% --- Executes on button press in pushbutton_Show_Fermion_Data2.
function pushbutton_Show_Fermion_Data2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Show_Fermion_Data2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Show_Operator_Field_choice    = 2;
EVENT.signal_GUI_data_input_event   = true;

% --- Executes on button press in pushbutton_Show_Fermion_Data3.
function pushbutton_Show_Fermion_Data3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Show_Fermion_Data3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global EVENT

EVENT.Show_Operator_Field_choice    = 3;
EVENT.signal_GUI_data_input_event   = true;














% ----------------------------------------------------------------------------------------------------------
%% checkbox_Show_Zero_Fields
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in checkbox_Show_No_Spinors1.
function checkbox_Show_No_Spinors1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Show_No_Spinors1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Show_No_Spinors(1)             = get(hObject,'Value');
EVENT.Show_Operator_Field_choice     = 1;
EVENT.signal_GUI_data_input_event    = true;
EVENT.signal_GUI_visualization_event = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Show_No_Spinors1


% --- Executes on button press in checkbox_Show_No_Spinors2.
function checkbox_Show_No_Spinors2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Show_No_Spinors2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Show_No_Spinors(2)     = get(hObject,'Value');
EVENT.Show_Operator_Field_choice     = 2;
EVENT.signal_GUI_data_input_event    = true;
EVENT.signal_GUI_visualization_event = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Show_No_Spinors2


% --- Executes on button press in checkbox_Show_No_Spinors3.
function checkbox_Show_No_Spinors3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Show_No_Spinors3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Show_No_Spinors(3)             = get(hObject,'Value');
EVENT.Show_Operator_Field_choice     = 3;
EVENT.signal_GUI_data_input_event    = true;
EVENT.signal_GUI_visualization_event = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Show_No_Spinors3







% ----------------------------------------------------------------------------------------------------------
%% checkbox_Show_Spinor_Current
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in checkbox_Show_Spinor_Current.
function checkbox_Show_Spinor_Current_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Show_Spinor_Current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Show_Spinor_Current(1)         = get(hObject,'Value');
EVENT.Show_Spinor_Current(2)         = get(hObject,'Value');
EVENT.Show_Spinor_Current(3)         = get(hObject,'Value');
EVENT.signal_GUI_data_input_event    = true;
EVENT.signal_GUI_visualization_event = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Show_Spinor_Current


% ----------------------------------------------------------------------------------------------------------
%% checkbox_Show_Spinor_Meshes
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in checkbox_Show_Spinor_Meshes.
function checkbox_Show_Spinor_Meshes_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Show_Spinor_Meshes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Show_Spinor_Meshes(1)          = get(hObject,'Value');
EVENT.Show_Spinor_Meshes(2)          = get(hObject,'Value');
EVENT.Show_Spinor_Meshes(3)          = get(hObject,'Value');
EVENT.signal_GUI_data_input_event    = true;
EVENT.signal_GUI_visualization_event = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Show_Spinor_Meshes









% --- Executes during object deletion, before destroying properties.
function figure_Main_Window_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure_Main_Window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.signal_GUI_command_event = true;
EVENT.running = false;


% --------------------------------------------------------------------
function Menu_Callback(hObject, eventdata, handles)
% hObject    handle to Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when figure_Main_Window is resized.
function figure_Main_Window_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure_Main_Window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)








% ----------------------------------------------------------------------------------------------------------
%% pushbutton_Show_Operator_1__2_or_3
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in pushbutton_Show_Operator_1__2_or_3.
function pushbutton_Show_Operator_1__2_or_3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Show_Operator_1__2_or_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

if  EVENT.Show_Operator_Field_choice == 1
    EVENT.Show_Operator_Field_choice  = 2;
elseif ...
    EVENT.Show_Operator_Field_choice == 2
    EVENT.Show_Operator_Field_choice  = 3;
elseif ...
    EVENT.Show_Operator_Field_choice == 3
    EVENT.Show_Operator_Field_choice  = 1;
end

EVENT.signal_GUI_data_input_event     = true;



% ----------------------------------------------------------------------------------------------------------
%% pushbutton_Show_Bilinear_1_2_or_3
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in pushbutton_Show_Bilinear_1_2_or_3.
function pushbutton_Show_Bilinear_1_2_or_3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Show_Bilinear_1_2_or_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

if  EVENT.Show_Bilinear_Field_choice == 1
    EVENT.Show_Bilinear_Field_choice  = 2;
elseif ...
    EVENT.Show_Bilinear_Field_choice == 2
    EVENT.Show_Bilinear_Field_choice  = 3;
elseif ...
    EVENT.Show_Bilinear_Field_choice == 3
    EVENT.Show_Bilinear_Field_choice  = 1;
end

EVENT.signal_GUI_data_input_event     = true;







% ----------------------------------------------------------------------------------------------------------
%% checkbox_Enable_Bilinear_choice
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in checkbox_Enable_Bilinear_choice.
function checkbox_Enable_Bilinear_choice_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Enable_Bilinear_choice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Enable_Bilinear_Field_choice = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of checkbox_Enable_Bilinear_choice
EVENT.signal_GUI_data_input_event     = true;




% ----------------------------------------------------------------------------------------------------------
%% pushbutton_Select_Fermion
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in pushbutton_Select_Fermion_LS.
function pushbutton_Select_Fermion_LS_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Select_Fermion_LS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

if EVENT.Enable_Bilinear_Field_choice
    matrixNr = EVENT.Show_Bilinear_Field_choice;
else
    matrixNr = EVENT.Show_Operator_Field_choice;
end

if  EVENT.Bilinear_Input_Fields_choice(matrixNr,1) == 1
    EVENT.Bilinear_Input_Fields_choice(matrixNr,1)  = 2;
elseif ...
    EVENT.Bilinear_Input_Fields_choice(matrixNr,1) == 2
    EVENT.Bilinear_Input_Fields_choice(matrixNr,1)  = 3;
elseif ...
    EVENT.Bilinear_Input_Fields_choice(matrixNr,1) == 3
    EVENT.Bilinear_Input_Fields_choice(matrixNr,1)  = 1;
end

EVENT.signal_GUI_data_input_event     = true;



% --- Executes on button press in pushbutton_Select_Fermion_RS.
function pushbutton_Select_Fermion_RS_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Select_Fermion_RS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

if EVENT.Enable_Bilinear_Field_choice
    matrixNr = EVENT.Show_Bilinear_Field_choice;
else
    matrixNr = EVENT.Show_Operator_Field_choice;
end

if  EVENT.Bilinear_Input_Fields_choice(matrixNr,2) == 1
    EVENT.Bilinear_Input_Fields_choice(matrixNr,2)  = 2;
elseif ...
    EVENT.Bilinear_Input_Fields_choice(matrixNr,2) == 2
    EVENT.Bilinear_Input_Fields_choice(matrixNr,2)  = 3;
elseif ...
    EVENT.Bilinear_Input_Fields_choice(matrixNr,2) == 3
    EVENT.Bilinear_Input_Fields_choice(matrixNr,2)  = 1;
end

EVENT.signal_GUI_data_input_event     = true;







% --- Executes when selected object is changed in uibuttongroup_Rotation_Matrices.
function uibuttongroup_Rotation_Matrices_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup_Rotation_Matrices 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'radiobutton_Show_Axes'
        EVENT.Show_Spinor_choice = 1;
    case 'radiobutton_Show_Spin'
        EVENT.Show_Spinor_choice = 2;
end
EVENT.signal_GUI_data_input_event     = true;





% ----------------------------------------------------------------------------------------------------------
%% checkbox_Axial_current
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in checkbox_Axial_current1.
function checkbox_Axial_current1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Axial_current1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boson_Vector_Select(1,1) = get(hObject,'Value');
VecColors = reshape(EVENT.Vector_Colors,[4,4,3]);
if get(hObject,'Value')
    set(EVENT.handles.checkbox_Axial_current1,   'BackgroundColor',VecColors(1,1,1:3) );    
else
    set(EVENT.handles.checkbox_Axial_current1,   'BackgroundColor',[0.8 0.8 0.8]  );    
end
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event    = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Axial_current1

% --- Executes on button press in checkbox_Axial_current2.
function checkbox_Axial_current2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Axial_current2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boson_Vector_Select(2,1) = get(hObject,'Value');
VecColors = reshape(EVENT.Vector_Colors,[4,4,3]);
if get(hObject,'Value')
    set(EVENT.handles.checkbox_Axial_current2,   'BackgroundColor',VecColors(2,1,1:3) );    
else
    set(EVENT.handles.checkbox_Axial_current2,   'BackgroundColor',[0.8 0.8 0.8]  );    
end
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event    = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Axial_current2

% --- Executes on button press in checkbox_Axial_current3.
function checkbox_Axial_current3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Axial_current3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boson_Vector_Select(3,1) = get(hObject,'Value');
VecColors = reshape(EVENT.Vector_Colors,[4,4,3]);
if get(hObject,'Value')
    set(EVENT.handles.checkbox_Axial_current3,   'BackgroundColor',VecColors(3,1,1:3) );    
else
    set(EVENT.handles.checkbox_Axial_current3,   'BackgroundColor',[0.8 0.8 0.8]  );    
end
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event    = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Axial_current3

% --- Executes on button press in checkbox_Axial_current4.
function checkbox_Axial_current4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Axial_current4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boson_Vector_Select(4,1) = get(hObject,'Value');
VecColors = reshape(EVENT.Vector_Colors,[4,4,3]);
if get(hObject,'Value')
    set(EVENT.handles.checkbox_Axial_current4,   'BackgroundColor',VecColors(4,1,1:3) );    
else
    set(EVENT.handles.checkbox_Axial_current4,   'BackgroundColor',[0.8 0.8 0.8]  );    
end
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event    = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Axial_current4




% ----------------------------------------------------------------------------------------------------------
%% checkbox_Vector_current
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in checkbox_Vector_current1.
function checkbox_Vector_current1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Vector_current1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boson_Vector_Select(1,2) = get(hObject,'Value');
VecColors = reshape(EVENT.Vector_Colors,[4,4,3]);
if get(hObject,'Value')
    set(EVENT.handles.checkbox_Vector_current1,  'BackgroundColor',VecColors(1,2,1:3) );    
else
    set(EVENT.handles.checkbox_Vector_current1,  'BackgroundColor',[0.8 0.8 0.8]  );    
end
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event    = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Vector_current1

% --- Executes on button press in checkbox_Vector_current2.
function checkbox_Vector_current2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Vector_current2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boson_Vector_Select(2,2) = get(hObject,'Value');
VecColors = reshape(EVENT.Vector_Colors,[4,4,3]);
if get(hObject,'Value')
    set(EVENT.handles.checkbox_Vector_current2,  'BackgroundColor',VecColors(2,2,1:3) );    
else
    set(EVENT.handles.checkbox_Vector_current2,  'BackgroundColor',[0.8 0.8 0.8]  );    
end
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event    = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Vector_current2


% --- Executes on button press in checkbox_Vector_current3.
function checkbox_Vector_current3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Vector_current3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boson_Vector_Select(3,2) = get(hObject,'Value');
VecColors = reshape(EVENT.Vector_Colors,[4,4,3]);
if get(hObject,'Value')
    set(EVENT.handles.checkbox_Vector_current3,  'BackgroundColor',VecColors(3,2,1:3) );    
else
    set(EVENT.handles.checkbox_Vector_current3,  'BackgroundColor',[0.8 0.8 0.8]  );    
end
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event    = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Vector_current3


% --- Executes on button press in checkbox_Vector_current4.
function checkbox_Vector_current4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Vector_current4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boson_Vector_Select(4,2) = get(hObject,'Value');
VecColors = reshape(EVENT.Vector_Colors,[4,4,3]);
if get(hObject,'Value')
    set(EVENT.handles.checkbox_Vector_current4,  'BackgroundColor',VecColors(4,2,1:3) );    
else
    set(EVENT.handles.checkbox_Vector_current4,  'BackgroundColor',[0.8 0.8 0.8]  );    
end
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event    = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Vector_current4





% ----------------------------------------------------------------------------------------------------------
%% checkbox_Polarization
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in checkbox_Polarization1.
function checkbox_Polarization1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Polarization1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boson_Vector_Select(1,3) = get(hObject,'Value');
VecColors = reshape(EVENT.Vector_Colors,[4,4,3]);
if get(hObject,'Value')
    set(EVENT.handles.checkbox_Polarization1,  'BackgroundColor',VecColors(1,3,1:3) );    
else
    set(EVENT.handles.checkbox_Polarization1,  'BackgroundColor',[0.8 0.8 0.8]  );    
end
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event    = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Polarization1


% --- Executes on button press in checkbox_Polarization2.
function checkbox_Polarization2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Polarization2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boson_Vector_Select(2,3) = get(hObject,'Value');
VecColors = reshape(EVENT.Vector_Colors,[4,4,3]);
if get(hObject,'Value')
    set(EVENT.handles.checkbox_Polarization2,  'BackgroundColor',VecColors(2,3,1:3) );    
else
    set(EVENT.handles.checkbox_Polarization2,  'BackgroundColor',[0.8 0.8 0.8]  );    
end
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event    = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Polarization2

% --- Executes on button press in checkbox_Polarization3.
function checkbox_Polarization3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Polarization3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boson_Vector_Select(3,3) = get(hObject,'Value');
VecColors = reshape(EVENT.Vector_Colors,[4,4,3]);
if get(hObject,'Value')
    set(EVENT.handles.checkbox_Polarization3,  'BackgroundColor',VecColors(3,3,1:3) );    
else
    set(EVENT.handles.checkbox_Polarization3,  'BackgroundColor',[0.8 0.8 0.8]  );    
end
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event    = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Polarization3

% --- Executes on button press in checkbox_Polarization4.
function checkbox_Polarization4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Polarization4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boson_Vector_Select(4,3) = get(hObject,'Value');
VecColors = reshape(EVENT.Vector_Colors,[4,4,3]);
if get(hObject,'Value')
    set(EVENT.handles.checkbox_Polarization4,  'BackgroundColor',VecColors(4,3,1:3) );    
else
    set(EVENT.handles.checkbox_Polarization4,  'BackgroundColor',[0.8 0.8 0.8]  );    
end
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event    = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Polarization4






% ----------------------------------------------------------------------------------------------------------
%% checkbox_Magnetization
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in checkbox_Magnetization1.
function checkbox_Magnetization1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Magnetization1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boson_Vector_Select(1,4) = get(hObject,'Value');
VecColors = reshape(EVENT.Vector_Colors,[4,4,3]);
if get(hObject,'Value')
    set(EVENT.handles.checkbox_Magnetization1,  'BackgroundColor',VecColors(1,4,1:3) );    
else
    set(EVENT.handles.checkbox_Magnetization1,  'BackgroundColor',[0.8 0.8 0.8]  );    
end
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event    = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Magnetization1

% --- Executes on button press in checkbox_Magnetization2.
function checkbox_Magnetization2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Magnetization2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boson_Vector_Select(2,4) = get(hObject,'Value');
VecColors = reshape(EVENT.Vector_Colors,[4,4,3]);
if get(hObject,'Value')
    set(EVENT.handles.checkbox_Magnetization2,  'BackgroundColor',VecColors(2,4,1:3) );    
else
    set(EVENT.handles.checkbox_Magnetization2,  'BackgroundColor',[0.8 0.8 0.8]  );    
end
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event    = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Magnetization2

% --- Executes on button press in checkbox_Magnetization3.
function checkbox_Magnetization3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Magnetization3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boson_Vector_Select(3,4) = get(hObject,'Value');
VecColors = reshape(EVENT.Vector_Colors,[4,4,3]);
if get(hObject,'Value')
    set(EVENT.handles.checkbox_Magnetization3,  'BackgroundColor',VecColors(3,4,1:3) );    
else
    set(EVENT.handles.checkbox_Magnetization3,  'BackgroundColor',[0.8 0.8 0.8]  );    
end
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event    = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Magnetization3

% --- Executes on button press in checkbox_Magnetization4.
function checkbox_Magnetization4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Magnetization4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Boson_Vector_Select(4,4) = get(hObject,'Value');
VecColors = reshape(EVENT.Vector_Colors,[4,4,3]);
if get(hObject,'Value')
    set(EVENT.handles.checkbox_Magnetization4,  'BackgroundColor',VecColors(4,4,1:3) );    
else
    set(EVENT.handles.checkbox_Magnetization4,  'BackgroundColor',[0.8 0.8 0.8]  );    
end
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event    = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Magnetization4






% ----------------------------------------------------------------------------------------------------------
%% pushbutton_Bilinear_gamma
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in pushbutton_Bilinear_gamma.
function pushbutton_Bilinear_gamma_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Bilinear_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Bilinear_Field_Matrix_gamma     = ~EVENT.Bilinear_Field_Matrix_gamma;
EVENT.signal_GUI_visualization_event  = true;
EVENT.signal_GUI_data_input_event     = true;
EVENT.signal_GUI_bilinear_gamma_event = true;




% ----------------------------------------------------------------------------------------------------------
%% slider_Visualization_Scale
% ----------------------------------------------------------------------------------------------------------


% --- Executes on slider movement.
function slider_Visualization_Scale_Callback(hObject, eventdata, handles)
% hObject    handle to slider_Visualization_Scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.signal_GUI_visualization_event = true;
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_Visualization_Scale_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_Visualization_Scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_Visualization_Scale2_Callback(hObject, eventdata, handles)
% hObject    handle to slider_Visualization_Scale2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.signal_GUI_visualization_event = true;
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_Visualization_Scale2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_Visualization_Scale2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end






% ----------------------------------------------------------------------------------------------------------
%% slider_Visualization_Angle
% ----------------------------------------------------------------------------------------------------------


% --- Executes on slider movement.
function slider_Visualization_Angle_Callback(hObject, eventdata, handles)
% hObject    handle to slider_Visualization_Angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.signal_GUI_visualization_event = true;
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_Visualization_Angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_Visualization_Angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on slider movement.
function slider_Visualization_Angle2_Callback(hObject, eventdata, handles)
% hObject    handle to slider_Visualization_Angle2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.signal_GUI_visualization_event = true;
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_Visualization_Angle2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_Visualization_Angle2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% ----------------------------------------------------------------------------------------------------------
%% checkbox_Fermion_Generation
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in checkbox_Fermion_Generation_0.
function checkbox_Fermion_Generation_0_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Fermion_Generation_0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Gen_Select(1) = get(hObject,'Value');
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Fermion_Generation_0


% --- Executes on button press in checkbox_Fermion_Generation_1.
function checkbox_Fermion_Generation_1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Fermion_Generation_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Gen_Select(2) = get(hObject,'Value');
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event = true;
% Hints: get(hObject,'Value') returns position of slider
% Hint: get(hObject,'Value') returns toggle state of checkbox_Fermion_Generation_1


% --- Executes on button press in checkbox_Fermion_Generation_2.
function checkbox_Fermion_Generation_2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Fermion_Generation_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Gen_Select(3) = get(hObject,'Value');
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Fermion_Generation_2


% --- Executes on button press in checkbox_Fermion_Generation_3.
function checkbox_Fermion_Generation_3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Fermion_Generation_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Fermion_Gen_Select(4) = get(hObject,'Value');
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Fermion_Generation_3


% --- Executes on button press in checkbox_Enable_Accumulation.
function checkbox_Enable_Accumulation_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Enable_Accumulation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Enable_Accumulation = get(hObject,'Value');
EVENT.signal_GUI_visualization_event = true;
EVENT.signal_GUI_data_input_event = true;
% Hint: get(hObject,'Value') returns toggle state of checkbox_Enable_Accumulation









% ----------------------------------------------------------------------------------------------------------
%% PLAYER CONTROL BUTTONS
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in pushbutton_PLAY_PAUSE.
function pushbutton_PLAY_PAUSE_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_PLAY_PAUSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Play_Timeline  = ~EVENT.Play_Timeline;
if EVENT.Play_Timeline
    set(EVENT.handles.pushbutton_PLAY_PAUSE,'String','PAUSE');
else
    set(EVENT.handles.pushbutton_PLAY_PAUSE,'String','PLAY');
end
EVENT.signal_GUI_visualization_event = true;

% --- Executes on button press in pushbutton_PLAY_FastBackwards.
function pushbutton_PLAY_FastBackwards_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_PLAY_FastBackwards (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Play_Timeline_Speed  = -5;
EVENT.signal_GUI_visualization_event = true;


% --- Executes on button press in pushbutton_PLAY_FastForewards.
function pushbutton_PLAY_FastForewards_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_PLAY_FastForewards (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Play_Timeline_Speed  = +5;
EVENT.signal_GUI_visualization_event = true;


% --- Executes on button press in pushbutton_PLAY_Backwards.
function pushbutton_PLAY_Backwards_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_PLAY_Backwards (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Play_Timeline_Speed  = -1;
EVENT.signal_GUI_visualization_event = true;


% --- Executes on button press in pushbutton_PLAY_Forewards.
function pushbutton_PLAY_Forewards_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_PLAY_Forewards (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Play_Timeline_Speed  = +1;
EVENT.signal_GUI_visualization_event = true;





% ----------------------------------------------------------------------------------------------------------
%% popupmenu_Bilinear_Construction
% ----------------------------------------------------------------------------------------------------------

% --- Executes on selection change in popupmenu_Bilinear_Construction.
function popupmenu_Bilinear_Construction_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_Bilinear_Construction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

bilinear_nr  = EVENT.Show_Bilinear_Field_choice;
operator_nr  = EVENT.Show_Operator_Field_choice;
use_bilinear = EVENT.Enable_Bilinear_Field_choice;

if use_bilinear
    EVENT.Bilinear_Construction_Choice(bilinear_nr) = get(hObject,'Value');
else
    EVENT.Bilinear_Construction_Choice(operator_nr) = get(hObject,'Value');
end

EVENT.signal_GUI_data_input_event = true;
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_Bilinear_Construction contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_Bilinear_Construction


% --- Executes during object creation, after setting all properties.
function popupmenu_Bilinear_Construction_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Bilinear_Construction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% ----------------------------------------------------------------------------------------------------------
%% GENERATOR SELECT PUSHBUTTONS
% ----------------------------------------------------------------------------------------------------------


% ----------------------------------------------------------------------------------------------------------
%% pushbutton_GenSel_Sigma
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in pushbutton_GenSel_Sigma1.
function pushbutton_GenSel_Sigma1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_Sigma1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(1) = 1;
if EVENT.Use_generators_for_all_particles
   EVENT.Generator_Select(2) = EVENT.Generator_Select(1);
   EVENT.Generator_Select(3) = EVENT.Generator_Select(1);
end
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator1,'Visible','Off');
set(EVENT.handles.uipanel_Field1_Selections, 'Visible','On' );

% --- Executes on button press in pushbutton_GenSel_Sigma2.
function pushbutton_GenSel_Sigma2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_Sigma2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(2) = 1;
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator2,'Visible','Off');
set(EVENT.handles.uipanel_Field2_Selections, 'Visible','On' );

% --- Executes on button press in pushbutton_GenSel_Sigma3.
function pushbutton_GenSel_Sigma3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_Sigma3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(3) = 1;
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator3,'Visible','Off');
set(EVENT.handles.uipanel_Field3_Selections, 'Visible','On' );




% ----------------------------------------------------------------------------------------------------------
%% pushbutton_GenSel_W
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in pushbutton_GenSel_Higgs1.
function pushbutton_GenSel_Higgs1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_Higgs1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(1) = 2;
if EVENT.Use_generators_for_all_particles
   EVENT.Generator_Select(2) = EVENT.Generator_Select(1);
   EVENT.Generator_Select(3) = EVENT.Generator_Select(1);
end
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator1,'Visible','Off');
set(EVENT.handles.uipanel_Field1_Selections, 'Visible','On' );

% --- Executes on button press in pushbutton_GenSel_Higgs2.
function pushbutton_GenSel_Higgs2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_Higgs2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(2) = 2;
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator2,'Visible','Off');
set(EVENT.handles.uipanel_Field2_Selections, 'Visible','On' );

% --- Executes on button press in pushbutton_GenSel_Higgs3.
function pushbutton_GenSel_Higgs3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_Higgs3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(3) = 2;
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator3,'Visible','Off');
set(EVENT.handles.uipanel_Field3_Selections, 'Visible','On' );




% ----------------------------------------------------------------------------------------------------------
%% pushbutton_GenSel_checkOmega
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in pushbutton_GenSel_checkOmega1.
function pushbutton_GenSel_checkOmega1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_checkOmega1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(1) = 3;
if EVENT.Use_generators_for_all_particles
   EVENT.Generator_Select(2) = EVENT.Generator_Select(1);
   EVENT.Generator_Select(3) = EVENT.Generator_Select(1);
end
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator1,'Visible','Off');
set(EVENT.handles.uipanel_Field1_Selections, 'Visible','On' );

% --- Executes on button press in pushbutton_GenSel_checkOmega2.
function pushbutton_GenSel_checkOmega2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_checkOmega2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(2) = 3;
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator2,'Visible','Off');
set(EVENT.handles.uipanel_Field2_Selections, 'Visible','On' );

% --- Executes on button press in pushbutton_GenSel_checkOmega3.
function pushbutton_GenSel_checkOmega3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_checkOmega3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(3) = 3;
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator3,'Visible','Off');
set(EVENT.handles.uipanel_Field3_Selections, 'Visible','On' );




% ----------------------------------------------------------------------------------------------------------
%% pushbutton_GenSel_hatOmega
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in pushbutton_GenSel_hatOmega1.
function pushbutton_GenSel_hatOmega1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_hatOmega1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(1) = 4;
if EVENT.Use_generators_for_all_particles
   EVENT.Generator_Select(2) = EVENT.Generator_Select(1);
   EVENT.Generator_Select(3) = EVENT.Generator_Select(1);
end
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator1,'Visible','Off');
set(EVENT.handles.uipanel_Field1_Selections, 'Visible','On' );

% --- Executes on button press in pushbutton_GenSel_hatOmega2.
function pushbutton_GenSel_hatOmega2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_hatOmega2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(2) = 4;
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator2,'Visible','Off');
set(EVENT.handles.uipanel_Field2_Selections, 'Visible','On' );

% --- Executes on button press in pushbutton_GenSel_hatOmega3.
function pushbutton_GenSel_hatOmega3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_hatOmega3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(3) = 4;
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator3,'Visible','Off');
set(EVENT.handles.uipanel_Field3_Selections, 'Visible','On' );




% ----------------------------------------------------------------------------------------------------------
%% pushbutton_GenSel_tildeOmega
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in pushbutton_GenSel_tildeOmega1.
function pushbutton_GenSel_tildeOmega1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_tildeOmega1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(1) = 5;
if EVENT.Use_generators_for_all_particles
   EVENT.Generator_Select(2) = EVENT.Generator_Select(1);
   EVENT.Generator_Select(3) = EVENT.Generator_Select(1);
end
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator1,'Visible','Off');
set(EVENT.handles.uipanel_Field1_Selections, 'Visible','On' );

% --- Executes on button press in pushbutton_GenSel_tildeOmega2.
function pushbutton_GenSel_tildeOmega2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_tildeOmega2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(2) = 5;
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator2,'Visible','Off');
set(EVENT.handles.uipanel_Field2_Selections, 'Visible','On' );

% --- Executes on button press in pushbutton_GenSel_tildeOmega3.
function pushbutton_GenSel_tildeOmega3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_tildeOmega3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(3) = 5;
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator3,'Visible','Off');
set(EVENT.handles.uipanel_Field3_Selections, 'Visible','On' );





% ----------------------------------------------------------------------------------------------------------
%% pushbutton_GenSel_checkPsi
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in pushbutton_GenSel_checkPsi1.
function pushbutton_GenSel_checkPsi1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_checkPsi1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(1) = 6;
if EVENT.Use_generators_for_all_particles
   EVENT.Generator_Select(2) = EVENT.Generator_Select(1);
   EVENT.Generator_Select(3) = EVENT.Generator_Select(1);
end
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator1,'Visible','Off');
set(EVENT.handles.uipanel_Field1_Selections, 'Visible','On' );

% --- Executes on button press in pushbutton_GenSel_checkPsi2.
function pushbutton_GenSel_checkPsi2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_checkPsi2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(2) = 6;
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator2,'Visible','Off');
set(EVENT.handles.uipanel_Field2_Selections, 'Visible','On' );

% --- Executes on button press in pushbutton_GenSel_checkPsi3.
function pushbutton_GenSel_checkPsi3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_checkPsi3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(3) = 6;
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator3,'Visible','Off');
set(EVENT.handles.uipanel_Field3_Selections, 'Visible','On' );





% ----------------------------------------------------------------------------------------------------------
%% pushbutton_GenSel_hatPsi
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in pushbutton_GenSel_hatPsi1.
function pushbutton_GenSel_hatPsi1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_hatPsi1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(1) = 7;
if EVENT.Use_generators_for_all_particles
   EVENT.Generator_Select(2) = EVENT.Generator_Select(1);
   EVENT.Generator_Select(3) = EVENT.Generator_Select(1);
end
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator1,'Visible','Off');
set(EVENT.handles.uipanel_Field1_Selections, 'Visible','On' );

% --- Executes on button press in pushbutton_GenSel_hatPsi2.
function pushbutton_GenSel_hatPsi2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_hatPsi2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(2) = 7;
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator2,'Visible','Off');
set(EVENT.handles.uipanel_Field2_Selections, 'Visible','On' );

% --- Executes on button press in pushbutton_GenSel_hatPsi3.
function pushbutton_GenSel_hatPsi3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_hatPsi3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(3) = 7;
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator3,'Visible','Off');
set(EVENT.handles.uipanel_Field3_Selections, 'Visible','On' );





% ----------------------------------------------------------------------------------------------------------
%% pushbutton_GenSel_sumPsi
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in pushbutton_GenSel_sumPsi1.
function pushbutton_GenSel_sumPsi1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_sumPsi1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(1) = 8;
if EVENT.Use_generators_for_all_particles
   EVENT.Generator_Select(2) = EVENT.Generator_Select(1);
   EVENT.Generator_Select(3) = EVENT.Generator_Select(1);
end
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator1,'Visible','Off');
set(EVENT.handles.uipanel_Field1_Selections, 'Visible','On' );

% --- Executes on button press in pushbutton_GenSel_sumPsi2.
function pushbutton_GenSel_sumPsi2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_sumPsi2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(2) = 8;
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator2,'Visible','Off');
set(EVENT.handles.uipanel_Field2_Selections, 'Visible','On' );

% --- Executes on button press in pushbutton_GenSel_sumPsi3.
function pushbutton_GenSel_sumPsi3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_sumPsi3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Generator_Select(3) = 8;
EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator3,'Visible','Off');
set(EVENT.handles.uipanel_Field3_Selections, 'Visible','On' );





% ----------------------------------------------------------------------------------------------------------
%% pushbutton_GenSel_bilinPsi
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in pushbutton_GenSel_Return1.
function pushbutton_GenSel_Return1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_Return1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator1,'Visible','Off');
set(EVENT.handles.uipanel_Field1_Selections, 'Visible','On' );

% --- Executes on button press in pushbutton_GenSel_Return2.
function pushbutton_GenSel_Return2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_Return2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator2,'Visible','Off');
set(EVENT.handles.uipanel_Field2_Selections, 'Visible','On' );

% --- Executes on button press in pushbutton_GenSel_Return3.
function pushbutton_GenSel_Return3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_GenSel_Return3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.signal_GUI_data_input_event     = true;
set(EVENT.handles.uipanel_Special_Generator3,'Visible','Off');
set(EVENT.handles.uipanel_Field3_Selections, 'Visible','On' );















% ----------------------------------------------------------------------------------------------------------
%% pushbutton_Gen_Potential_or_Force
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in pushbutton_Gen_Potential_or_Force1.
function pushbutton_Gen_Potential_or_Force1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Gen_Potential_or_Force1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

potential_or_force = -EVENT.Generator_Potential_or_Force(1);
EVENT.Generator_Potential_or_Force(1)  = potential_or_force;
%--- using this popup selects also the class of the generator -----
EVENT.Generator_Select(1) = 0;

if potential_or_force == 1
set(EVENT.handles.pushbutton_Gen_Potential_or_Force1,'String','POTENTIAL GENERATOR PROPORTIES');
set(EVENT.handles.text_Select_Boson_Field_Generator1,'String','Boson Potential Field Generator');
set(EVENT.handles.popupmenu_Select_Boson_Field_Generator1,'String',EVENT.Boson_Potential_popup_list);
else
set(EVENT.handles.pushbutton_Gen_Potential_or_Force1,'String','FORCE GENERATOR PROPORTIES       ');
set(EVENT.handles.text_Select_Boson_Field_Generator1,'String','Boson Force Field Generator    ');
set(EVENT.handles.popupmenu_Select_Boson_Field_Generator1,'String',EVENT.Boson_Force_popup_list);
end

EVENT.EW_Boson_Generator_choice(1)   = 1;
set(EVENT.handles.popupmenu_Select_Boson_Field_Generator1,'Value',1);


if EVENT.Use_generators_for_all_particles
    EVENT.Generator_Potential_or_Force(2)  = potential_or_force;
    EVENT.Generator_Potential_or_Force(3)  = potential_or_force;
    EVENT.Generator_Select(2) = 0;
    EVENT.Generator_Select(3) = 0;
    EVENT.EW_Boson_Generator_choice(2)     = 1;
    EVENT.EW_Boson_Generator_choice(3)     = 1;
    set(EVENT.handles.popupmenu_Select_Boson_Field_Generator2,'Value',1);
    set(EVENT.handles.popupmenu_Select_Boson_Field_Generator3,'Value',1);

    
    if potential_or_force == 1
        set(EVENT.handles.pushbutton_Gen_Potential_or_Force2,'String','POTENTIAL GENERATOR PROPORTIES');
        set(EVENT.handles.pushbutton_Gen_Potential_or_Force3,'String','POTENTIAL GENERATOR PROPORTIES');
        set(EVENT.handles.text_Select_Boson_Field_Generator2,'String','Boson Potential Field Generator');
        set(EVENT.handles.text_Select_Boson_Field_Generator3,'String','Boson Potential Field Generator');
        set(EVENT.handles.popupmenu_Select_Boson_Field_Generator2,'String',EVENT.Boson_Potential_popup_list);
        set(EVENT.handles.popupmenu_Select_Boson_Field_Generator3,'String',EVENT.Boson_Potential_popup_list);
    else
        set(EVENT.handles.pushbutton_Gen_Potential_or_Force2,'String','FORCE GENERATOR PROPORTIES       ');
        set(EVENT.handles.pushbutton_Gen_Potential_or_Force3,'String','FORCE GENERATOR PROPORTIES       ');
        set(EVENT.handles.text_Select_Boson_Field_Generator2,'String','Boson Force Field Generator    ');
        set(EVENT.handles.text_Select_Boson_Field_Generator3,'String','Boson Force Field Generator    ');
        set(EVENT.handles.popupmenu_Select_Boson_Field_Generator2,'String',EVENT.Boson_Force_popup_list);
        set(EVENT.handles.popupmenu_Select_Boson_Field_Generator3,'String',EVENT.Boson_Force_popup_list);
    end
end

EVENT.signal_GUI_data_input_event      =  true;


% --- Executes on button press in pushbutton_Gen_Potential_or_Force2.
function pushbutton_Gen_Potential_or_Force2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Gen_Potential_or_Force2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

potential_or_force = -EVENT.Generator_Potential_or_Force(2);
EVENT.Generator_Potential_or_Force(2)  = potential_or_force;
%--- using this popup selects also the class of the generator -----
EVENT.Generator_Select(2) = 0;

if potential_or_force == 1
set(EVENT.handles.pushbutton_Gen_Potential_or_Force2,'String','POTENTIAL GENERATOR PROPORTIES');
set(EVENT.handles.text_Select_Boson_Field_Generator2,'String','Boson Potential Field Generator');
set(EVENT.handles.popupmenu_Select_Boson_Field_Generator2,'String',EVENT.Boson_Potential_popup_list);
else
set(EVENT.handles.pushbutton_Gen_Potential_or_Force2,'String','FORCE GENERATOR PROPORTIES       ');
set(EVENT.handles.text_Select_Boson_Field_Generator2,'String','Boson Force Field Generator    ');
set(EVENT.handles.popupmenu_Select_Boson_Field_Generator2,'String',EVENT.Boson_Force_popup_list);
end

EVENT.EW_Boson_Generator_choice(2)     = 1;
set(EVENT.handles.popupmenu_Select_Boson_Field_Generator2,'Value',1);

EVENT.signal_GUI_data_input_event      =  true;


% --- Executes on button press in pushbutton_Gen_Potential_or_Force3.
function pushbutton_Gen_Potential_or_Force3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Gen_Potential_or_Force3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

potential_or_force = -EVENT.Generator_Potential_or_Force(3);
EVENT.Generator_Potential_or_Force(3)  = potential_or_force;
%--- using this popup selects also the class of the generator -----
EVENT.Generator_Select(3) = 0;

if potential_or_force == 1
set(EVENT.handles.pushbutton_Gen_Potential_or_Force3,'String','POTENTIAL GENERATOR PROPORTIES');
set(EVENT.handles.text_Select_Boson_Field_Generator3,'String','Boson Potential Field Generator');
set(EVENT.handles.popupmenu_Select_Boson_Field_Generator3,'String',EVENT.Boson_Potential_popup_list);
else
set(EVENT.handles.pushbutton_Gen_Potential_or_Force3,'String','FORCE GENERATOR PROPORTIES       ');
set(EVENT.handles.text_Select_Boson_Field_Generator3,'String','Boson Force Field Generator    ');
set(EVENT.handles.popupmenu_Select_Boson_Field_Generator3,'String',EVENT.Boson_Force_popup_list);
end

EVENT.EW_Boson_Generator_choice(3)     = 1;
set(EVENT.handles.popupmenu_Select_Boson_Field_Generator3,'Value',1);

EVENT.signal_GUI_data_input_event      =  true;












% ----------------------------------------------------------------------------------------------------------
%% checkbox_Show_Vector_Trajectories
% ----------------------------------------------------------------------------------------------------------


% --- Executes on button press in checkbox_Show_Vector_Trajectories.
function checkbox_Show_Vector_Trajectories_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Show_Vector_Trajectories (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Show_Vector_Trajectories = get(hObject,'Value');
EVENT.signal_GUI_data_input_event     = true;

% Hint: get(hObject,'Value') returns toggle state of checkbox_Show_Vector_Trajectories





% ----------------------------------------------------------------------------------------------------------
%% pushbutton_RESET_GUI
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in pushbutton_RESET_GUI.
function pushbutton_RESET_GUI_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_RESET_GUI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[~]  = UnifiedField_GUI_Initialization(false);



% --------------------------------------------------------------------
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% % OrigDlgH = ancestor(hObject, 'figure');
% % delete(OrigDlgH);
[~]  = UnifiedField_GUI_Initialization(false);






% ----------------------------------------------------------------------------------------------------------
%% pushbutton_START_PROGRAM
% ----------------------------------------------------------------------------------------------------------

% --- Executes on button press in pushbutton_START_PROGRAM.
function pushbutton_START_PROGRAM_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_START_PROGRAM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

if strcmp(get(EVENT.handles.text_Start_Title, 'Visible'),'off')
   set(EVENT.handles.text_Start_Title, 'Visible','on');
else
   set(EVENT.handles.uipanel_COVER,'Visible','off');
end







% --------------------------------------------------------------------
function Example_Demos_Callback(hObject, eventdata, handles)
% hObject    handle to Example_Demos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Demo_1_Callback(hObject, eventdata, handles)
% hObject    handle to Demo_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Demo_2_Callback(hObject, eventdata, handles)
% hObject    handle to Demo_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)









% ----------------------------------------------------------------------------------------------------------
%% Table Data Selection
% ----------------------------------------------------------------------------------------------------------


% --- Executes when selected cell(s) is changed in uitable_Operator_Field_Matrix.
function uitable_Operator_Field_Matrix_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable_Operator_Field_Matrix (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
global EVENT

if ~isempty(eventdata.Indices) % &&~isempty(data)
    if ~isempty(eventdata.Indices)
        handles.currentCell=eventdata.Indices;
        guidata(hObject,handles);
        Indices=handles.currentCell;
        EVENT.Table_Data_TableNr = 1;
        EVENT.Table_Data_Indices(1) = Indices(1);
        EVENT.Table_Data_Indices(2) = Indices(2);
        EVENT.signal_GUI_visualization_event = true;         
    end
end

% --- Executes when selected cell(s) is changed in uitable_Field_in.
function uitable_Field_in_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable_Field_in (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
global EVENT

if ~isempty(eventdata.Indices) % &&~isempty(data)
    if ~isempty(eventdata.Indices)
        handles.currentCell=eventdata.Indices;
        guidata(hObject,handles);
        Indices=handles.currentCell;
        EVENT.Table_Data_TableNr = 2;
        EVENT.Table_Data_Indices(1) = Indices(1);
        EVENT.Table_Data_Indices(2) = Indices(2);
        EVENT.signal_GUI_visualization_event = true;         
    end
end

% --- Executes when selected cell(s) is changed in uitable_Field_out.
function uitable_Field_out_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable_Field_out (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
global EVENT

if ~isempty(eventdata.Indices) % &&~isempty(data)    
    if ~isempty(eventdata.Indices)
        handles.currentCell=eventdata.Indices;
        guidata(hObject,handles);
        Indices=handles.currentCell;
        EVENT.Table_Data_TableNr = 3;
        EVENT.Table_Data_Indices(1) = Indices(1);
        EVENT.Table_Data_Indices(2) = Indices(2);
        EVENT.signal_GUI_visualization_event = true;         
    end
end


% --- Executes when selected cell(s) is changed in uitable_Bilinear_Field_Matrix.
function uitable_Bilinear_Field_Matrix_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable_Bilinear_Field_Matrix (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
global EVENT

if ~isempty(eventdata.Indices) % &&~isempty(data)
     if ~isempty(eventdata.Indices)
        handles.currentCell=eventdata.Indices;
        guidata(hObject,handles);
        Indices=handles.currentCell;
        EVENT.Table_Data_TableNr = 4;
        EVENT.Table_Data_Indices(1) = Indices(1);
        EVENT.Table_Data_Indices(2) = Indices(2);
         EVENT.signal_GUI_visualization_event = true;         
   end
end


% --- Executes when selected cell(s) is changed in uitable_Bilinear_Spinor_Matrices.
function uitable_Bilinear_Spinor_Matrices_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable_Bilinear_Spinor_Matrices (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
global EVENT

if ~isempty(eventdata.Indices) % &&~isempty(data)
    if ~isempty(eventdata.Indices)
        handles.currentCell=eventdata.Indices;
        guidata(hObject,handles);
        Indices=handles.currentCell;
        EVENT.Table_Data_TableNr = 5;
        EVENT.Table_Data_Indices(1) = Indices(1);
        EVENT.Table_Data_Indices(2) = Indices(2);
        EVENT.signal_GUI_visualization_event = true;         
   end
end


% --- Executes on button press in pushbutton_Decompose_Generator.
function pushbutton_Decompose_Generator_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Decompose_Generator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.Decompose_Generator  =  ~EVENT.Decompose_Generator;

if EVENT.Decompose_Generator == true
    set(EVENT.handles.pushbutton_Decompose_Generator,'BackgroundColor',[1.0,0.6,0.6])
else
    set(EVENT.handles.pushbutton_Decompose_Generator,'BackgroundColor',[0.9,0.9,0.9])  
end

EVENT.signal_GUI_data_input_event      =  true;


% --- Executes on button press in pushbutton_W12_not_Wpm.
function pushbutton_W12_not_Wpm_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_W12_not_Wpm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.W_Boson_Type_12_not_pm         = +1;
EVENT.signal_GUI_visualization_event = true;     


% --- Executes on button press in pushbutton_Wpm_not_W12.
function pushbutton_Wpm_not_W12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_Wpm_not_W12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.W_Boson_Type_12_not_pm         = -1;
EVENT.signal_GUI_visualization_event = true;     


% --- Executes on button press in pushbutton_RECORD.
function pushbutton_RECORD_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_RECORD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.MovieRecordingRequested = ~EVENT.MovieRecordingRequested;
EVENT.signal_GUI_visualization_event = true;     



function edit_VideoFileName_Callback(hObject, eventdata, handles)
% hObject    handle to edit_VideoFileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EVENT

EVENT.VideoFileName = get(hObject,'String');
EVENT.signal_GUI_visualization_event = true;     
% Hints: get(hObject,'String') returns contents of edit_VideoFileName as text
%        str2double(get(hObject,'String')) returns contents of edit_VideoFileName as a double


% --- Executes during object creation, after setting all properties.
function edit_VideoFileName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_VideoFileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
