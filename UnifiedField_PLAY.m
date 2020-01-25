function  UnifiedField_PLAY(GUI)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField()
%
% MAIN FUNCTION
%  
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

if GUI.Play_Timeline
    
    if isvalid(GUI.handles.slider_Time)
        current_time = get(GUI.handles.slider_Time,'Value');
        maximum_time = get(GUI.handles.slider_Time,'Max');
        minimum_time = get(GUI.handles.slider_Time,'Min');
        new_time     = current_time + GUI.Play_Timeline_Speed;
        
        if  new_time > maximum_time
            new_time = minimum_time;
        elseif  new_time < minimum_time
            new_time = maximum_time;
        end
        
        set(GUI.handles.slider_Time,'Value',new_time);
    end
    %width  = GUI.Timeline_Cursor_Position(3);
    %set(GUI.handles.uipanel_Cursor_Line,'Position', GUI.Timeline_Cursor_Position + [2*(current_time-1)*720/maximum_time/width,0,0,0] );
    
end

end

