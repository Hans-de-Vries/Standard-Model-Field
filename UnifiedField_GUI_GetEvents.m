function GUI = UnifiedField_GUI_GetEvents(GUI)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_GUI_GetEvents()
%
% Get the GUI (Graphical User Interface) related parameters with the 
% values that were defined in UnifiedField_GUI_Initialization but may  
% have changed during event interrupt call-backs.
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global EVENT       %   Version of GUI with real time updated values


% ==================================================================================================
%%                  LOAD ALL EVENT DATA FROM CALL-BACK INTERRUPTS  
% ==================================================================================================

GUI = EVENT;

% ==================================================================================================
%%                  RESET EVENT SIGNALS FOR THE NEXT CYCLE
% ==================================================================================================
   
EVENT.signal_GUI_start                        = false;          %Active during first cycle
EVENT.signal_GUI_end                          = false;          %Active during last cycle
EVENT.signal_GUI_data_input_event             = false;          %GUI data input event has occured
EVENT.signal_GUI_visualization_event          = false;          %GUI visualization event has occured
EVENT.signal_GUI_command_event                = false;          %GUI command event has occured
EVENT.signal_GUI_bilinear_gamma_event         = false;          %Gamma usgae changed, modify GUI layout.


% ==================================================================================================
%%                  ALGORITHM SETTINGS TAKEN FROM THE GUI
% ==================================================================================================


end

