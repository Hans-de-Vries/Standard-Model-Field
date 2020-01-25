function  UnifiedField()
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField()
%
% MAIN FUNCTION
%  
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


GEN       = UnifiedField_GEN_Initialization();
VAR       = UnifiedField_VAR_Initialization();
GUI       = UnifiedField_GUI_Initialization(true);
IMG       = UnifiedField_IMG_Initialization(GUI);



while GUI.running 

GUI       = UnifiedField_GUI_GetEvents(GUI);

VAR       = UnifiedField_GUI_GetFields(VAR,GUI,GEN);

UnifiedField_GUI_Visualization(VAR,GUI,GEN,IMG);

[GUI,VAR,IMG] = UnifiedField_GUI_Make_Movie_3D(VAR,GUI,IMG);    


UnifiedField_PLAY(GUI)

pause(0.01);


end

% ==================================================================================================
%%                  EXIT PROGRAM ACTIONS
% ==================================================================================================


%delete(GUI.Close_hObject);



end

