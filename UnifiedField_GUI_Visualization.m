function UnifiedField_GUI_Visualization(VAR,GUI,GEN,IMG)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_GUI_Visualization()
%
% Display visualizations
%  
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mode = 0;

if GUI.signal_GUI_data_input_event    == true
    mode = 1;
end
if GUI.signal_GUI_visualization_event == true || GUI.Play_Timeline == true
    mode = 2;
end



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



if mode ~= 0 && isvalid(GUI.figure_Main)

    GUI.slider_Time_value = round(get(GUI.handles.slider_Time,'Value'));    
    VAR.Sequence_Entry    = GUI.slider_Time_value;

    
    particle_nr     = GUI.Show_Operator_Field_choice;
    
    if  GUI.Enable_Bilinear_Field_choice
        bilinear_nr = GUI.Show_Bilinear_Field_choice;
    else
        bilinear_nr = GUI.Show_Operator_Field_choice;
    end

    
    %-----------------------------------------------------------------------------------------------
    % Define strings used in the GUI
    %-----------------------------------------------------------------------------------------------

    [fermion_name,index_name,particle_char] = UnifiedField_FUN_Particle_Strings(VAR,GUI);
 
    %-----------------------------------------------------------------------------------------------
    % Visualize the Panels for Fermion and Generator Definition 
    %-----------------------------------------------------------------------------------------------

    UnifiedField_GUI_Show_Particle_Definitions(VAR,GUI,IMG,fermion_name,index_name)
        
    %-----------------------------------------------------------------------------------------------
    % Visualize the Panel for the Field and the Generator/Operator acting on it.
    %-----------------------------------------------------------------------------------------------
   
    UnifiedField_GUI_Show_Fields(VAR,GUI,GEN,IMG,mode,particle_nr,bilinear_nr,particle_char,index_name)

    %-----------------------------------------------------------------------------------------------
    % Visualize the Panel with the Spinors in 3D
    %-----------------------------------------------------------------------------------------------

    UnifiedField_GUI_Show_Spinors_3D(VAR,GUI,GEN,IMG,mode,particle_nr,fermion_name,particle_char);  
        
    %-----------------------------------------------------------------------------------------------
    % Visualize the Panel with the  Boson vectors in 3D
    %-----------------------------------------------------------------------------------------------

    UnifiedField_GUI_Show_3D(VAR,GUI,GEN,IMG,mode,bilinear_nr,particle_char);        
    
    %-----------------------------------------------------------------------------------------------
    % Visualize the Panel with the  Timelines in 2D
    %-----------------------------------------------------------------------------------------------

    UnifiedField_GUI_Show_Timelines_2D(VAR,GUI,IMG,particle_nr,bilinear_nr,particle_char)     
  
drawnow

%set(GUI.handles.figure_Main_Window,'Visible','on');
    
end % if mode

end

