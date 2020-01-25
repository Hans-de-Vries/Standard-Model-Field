function [GUI,VAR,IMG] = UnifiedField_GUI_Make_Movie_3D(VAR,GUI,IMG)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_GUI_Make_Movie_3D(VAR,GUI,IMG)
%
%
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%


if isvalid(GUI.figure_Main)
    
    GUI.slider_Time_value = round(get(GUI.handles.slider_Time,'Value'));
    VAR.Sequence_Entry    = GUI.slider_Time_value;
    
    if  exist('Videos','dir') ~= 7
        mkdir('Videos');
    end
    
    if IMG.RecordingMode == 1
        
        if GUI.MovieRecordingRequested  && ~IMG.MovieRecordingPending && ~IMG.MovieRecordingBusy
            IMG.MovieRecordingPending = true;
        end
        
        if ~GUI.MovieRecordingRequested && (IMG.MovieRecordingPending || IMG.MovieRecordingBusy)
            IMG.MovieRecordingPending   = false;
            IMG.MovieRecordingBusy      = false;
            VAR.Sequence_Previous_Entry = -1;
        end
        
        if  IMG.MovieRecordingPending && GUI.Play_Timeline && ...
                ( VAR.Sequence_Entry < VAR.Sequence_Previous_Entry || VAR.Sequence_Entry == 1)
            
            IMG.MovieRecordingPending   = false;
            IMG.MovieRecordingBusy      = true;
            IMG.MovieFrameNumber        = 1;
            VAR.Sequence_Previous_Entry = -1;
        end
        
        if  IMG.MovieRecordingBusy && GUI.Play_Timeline && VAR.Sequence_Entry > VAR.Sequence_Previous_Entry
            frame.cdata    = uint8(zeros(1080,1920,3));
            frame.colormap = [];
            figure_frame   = getframe(gcf);
            size(IMG.bar_image);
            %frame.cdata(   1:385,    1:675,  :) = figure_frame.cdata(   1:385,     1:675,  :);
            %frame.cdata(   1:385, 1245:1920, :) = figure_frame.cdata(   1:385,   677:1352, :);
            %frame.cdata( 387:1000,   1:342,  :) = figure_frame.cdata(   1:614,  2032:2373, :);
            %frame.cdata( 387:1000, 343:684,  :) = figure_frame.cdata( 615:1228, 2032:2373, :);
            frame.cdata(   1:1018 ,  5:1915,  :)  = imresize(figure_frame.cdata,[1018,1911]);
            frame.cdata(1019:1080,   1:1920,  :)  = IMG.bar_image(1:62,1:1920,1:3);
            IMG.Movie(IMG.MovieFrameNumber) = frame;
            
            %IMG.Movie(IMG.MovieFrameNumber) = getframe(gcf,[1162 10 867 837]);
            IMG.MovieFrameNumber            = IMG.MovieFrameNumber + 1;
        end
        
        if  IMG.MovieRecordingBusy && VAR.Sequence_Entry < VAR.Sequence_Previous_Entry
            VAR.Sequence_Previous_Entry = -1;
            IMG.MovieRecordingBusy      = false;
            video = VideoWriter(['Videos\',GUI.VideoFileName,'avi']);
            video.Quality    = 90;
            video.FrameRate  = 15;
            %video.FileFormat = 'mp4';
            %video.VideoCompressionMethod = 'H.264';
            open(video);
            writeVideo(video,IMG.Movie);
            close(video);
        end
        
        if GUI.MovieRecordingRequested
            if ~IMG.MovieRecordingBusy
                set(GUI.handles.pushbutton_RECORD,'BackgroundColor',[0.8, 0.6, 0.3])
            else
                set(GUI.handles.pushbutton_RECORD,'BackgroundColor',[0.4, 0.8, 0.4])
            end
        else
            set(GUI.handles.pushbutton_RECORD,'BackgroundColor',[0.8, 0.4, 0.4])
        end
        
        VAR.Sequence_Previous_Entry = VAR.Sequence_Entry;
        
    elseif IMG.RecordingMode == 2
 
        if GUI.MovieRecordingRequested  && ~IMG.MovieRecordingBusy
            IMG.MovieRecordingBusy      = true;
            IMG.MovieFrameNumber        = 1;
        end

        if  IMG.MovieRecordingBusy && GUI.MovieRecordingRequested
            frame.cdata    = uint8(zeros(1080,1920,3));
            frame.colormap = [];
            figure_frame   = getframe(gcf);
            size(IMG.bar_image);
            frame.cdata(   1:1018 ,  5:1915,  :)  = imresize(figure_frame.cdata,[1018,1911]);
            frame.cdata(1019:1080,   1:1920,  :)  = IMG.bar_image(1:62,1:1920,1:3);
            IMG.Movie(IMG.MovieFrameNumber) = frame;
            IMG.MovieFrameNumber            = IMG.MovieFrameNumber + 1;
        end
            
        if  IMG.MovieRecordingBusy && ~GUI.MovieRecordingRequested
            IMG.MovieRecordingBusy      = false;
            video = VideoWriter(['Videos\',GUI.VideoFileName,'avi']);
            video.Quality    = 90;
            video.FrameRate  = 10;
            %video.FileFormat = 'mp4';
            %video.VideoCompressionMethod = 'H.264';
            open(video);
            writeVideo(video,IMG.Movie);
            close(video);
        end
        
        if GUI.MovieRecordingRequested
            set(GUI.handles.pushbutton_RECORD,'BackgroundColor',[0.4, 0.8, 0.4])
        else
            set(GUI.handles.pushbutton_RECORD,'BackgroundColor',[0.8, 0.4, 0.4])
        end
        

    end
    
    
end


end

