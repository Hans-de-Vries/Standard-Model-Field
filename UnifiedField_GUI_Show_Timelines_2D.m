
function UnifiedField_GUI_Show_Timelines_2D(VAR,GUI,IMG,particle_nr,bilinear_nr,particle_char)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_GUI_Show_Timelines_2D
%
%
%  Visualize the time lines
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Visualize Particle:      Four Spinors,  Four spinor components for each each spinor
% Visualize Particle:      Four Spinors,  Four spinor currents and summed to Axial current 
% Visualize Particle:      Four Spinors,  Four spinor currents and summed to Vector current 
% Visualize Bilinears:     Axial current, and EM: Vector current,  Magnetization & Polarization
% Visualize 3 Bilinears:  Total and combined Electromagnetic Vector currents
% Visualize 3 Bilinears:  Total and combined Electromagnetic Magnetization
% Visualize 3 Bilinears:  Total and combined Electromagnetic Polarization
% Visualize 3 Bilinears:  Total and combined Axial vector current
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %-----------------------------------------------------------------------------------------------
    %  Reset Slider to initial position
    %-----------------------------------------------------------------------------------------------
    
    if GUI.signal_GUI_data_input_event    == true   
        set(GUI.handles.slider_Time,'Value', VAR.Time_Step_Start+1);
        GUI.slider_Time_value = VAR.Time_Step_Start+1;
        VAR.Sequence_Entry = VAR.Time_Step_Start+1;
    end

   
    %-----------------------------------------------------------------------------------------------
    % Locally repeated definitions
    %-----------------------------------------------------------------------------------------------
        
    entry               = VAR.Sequence_Entry;
    length              = VAR.Sequence_Length;
       
    particle_background = squeeze(IMG.color(2+particle_nr,1:3));  
    bilinear_background = squeeze(IMG.color(2+bilinear_nr,1:3)); 

    %-----------------------------------------------------------------------------------------------
    %  Set the Time Text
    %-----------------------------------------------------------------------------------------------
    
    width = GUI.Timeline_Cursor_Position(3);        
       
    set(GUI.handles.text_Time_value,'String',num2str(entry-1));
    set(GUI.handles.uipanel_Cursor_Line,'Position', GUI.Timeline_Cursor_Position + [2*(entry-1)*720/length/width,0,0,0] );
    
    
    %-----------------------------------------------------------------------------------------------
    %  Pre select fields to view on the timeline
    %-----------------------------------------------------------------------------------------------
    
    switch GUI.Visualization_choice
        case {1,2,3,4,5}
                VecSequence      = reshape(VAR.Sequence_Bilinear_Field(:,bilinear_nr,1:16,1:16),[length,16,16]);
        case {6,7,8,9}
                VecSequence      = reshape(VAR.Sequence_Bilinear_Field(:,particle_nr,1:16,1:16),[length,16,16]);
    end    

    %-----------------------------------------------------------------------------------------------
    %  Replace the W1 and W2 vectors with the W+ and W- vectors if required
    %-----------------------------------------------------------------------------------------------

    if GUI.W_Boson_Type_12_not_pm == -1 
        
%        VectorWpos_o    = squeeze( VecSequence(:,10:12,   13) - VecSequence(:,14:16,    9) )/sqrt(2);
%        VectorWpos_xyz  = squeeze( VecSequence(:,10:12,10:12) + VecSequence(:,14:16,14:16) )/sqrt(2);
% 
%        VectorWneg_o    = squeeze( VecSequence(:,10:12,   13) + VecSequence(:,14:16,    9) )/sqrt(2);
%        VectorWneg_xyz  = squeeze( VecSequence(:,10:12,10:12) - VecSequence(:,14:16,14:16) )/sqrt(2);

       VectorWpos_o    = squeeze( VecSequence(:,10:12,   13) - VecSequence(:,14:16,    9) );
       VectorWpos_xyz  = squeeze( VecSequence(:,10:12,10:12) + VecSequence(:,14:16,14:16) );

       VectorWneg_o    = squeeze( VecSequence(:,10:12,   13) + VecSequence(:,14:16,    9) );
       VectorWneg_xyz  = squeeze( VecSequence(:,10:12,10:12) - VecSequence(:,14:16,14:16) );
                    
       VecSequence(:,10:12,   13) = VectorWpos_o;
       VecSequence(:,10:12,10:12) = VectorWpos_xyz;

       VecSequence(:,14:16,   13) = VectorWneg_o;
       VecSequence(:,14:16,10:12) = VectorWneg_xyz;

    end

    %===============================================================================================
    %  VISULAIZATION CHOISES
    %===============================================================================================

    switch GUI.Visualization_choice
        
        %-------------------------------------------------------------------------------------------
        %    Visualize Particle:      Four Spinors,  Four spinor components for each each spinor
        %-------------------------------------------------------------------------------------------
        case 1
            
            for time_line = 1:4
                                 
                signal_o = squeeze(VAR.Sequence_Fields(:,particle_nr,4*(time_line-1) + 1,1));
                signal_x = squeeze(VAR.Sequence_Fields(:,particle_nr,4*(time_line-1) + 2,1));
                signal_y = squeeze(VAR.Sequence_Fields(:,particle_nr,4*(time_line-1) + 3,1));
                signal_z = squeeze(VAR.Sequence_Fields(:,particle_nr,4*(time_line-1) + 4,1));
                
                if GUI.signal_GUI_data_input_event                   
                    axes(GUI.handles_Timeline_Axes(time_line));
                    plot( [0 VAR.Sequence_Length],[0 0],'Color',[0.9 0.9 0.9],'LineWidth',3);                         
                    hold on
                    plot( signal_o, 'Color','k','LineWidth',2,'LineStyle','--');
                    plot( signal_x, 'Color','r','LineWidth',1,'LineStyle','-');
                    plot( signal_y, 'Color','g','LineWidth',1,'LineStyle','-');
                    plot( signal_z, 'Color','b','LineWidth',1,'LineStyle','-');
                    axis( [ 0 VAR.Sequence_Length  -3  3]);
                    hold off
                end
                
                set(GUI.handles_Timeline_Values(4*(time_line-1)+1),'String',num2str(round(signal_o(entry),4)));
                set(GUI.handles_Timeline_Values(4*(time_line-1)+2),'String',num2str(round(signal_x(entry),4)));
                set(GUI.handles_Timeline_Values(4*(time_line-1)+3),'String',num2str(round(signal_y(entry),4)));
                set(GUI.handles_Timeline_Values(4*(time_line-1)+4),'String',num2str(round(signal_z(entry),4)));
                

            end
            
            if GUI.signal_GUI_data_input_event
                axes(GUI.handles_Timeline_Axes(5));
                set(GUI.handles_Timeline_Axes(5),'NextPlot','replace');
                plot([0,1]);
                axis( [ 0 VAR.Sequence_Length  -3  3]);
            end
            
            set(GUI.handles.text_timeline_1,'String','L1 spinor components');
            set(GUI.handles.text_timeline_2,'String','L2 spinor components');
            set(GUI.handles.text_timeline_3,'String','R1 spinor components');
            set(GUI.handles.text_timeline_4,'String','R2 spinor components');
            set(GUI.handles.text_timeline_5,'String',' ');
            
            set(GUI.handles.text_timeline_1,'BackgroundColor',[ 0.8 0.8 0.8]);
            set(GUI.handles.text_timeline_2,'BackgroundColor',[ 0.8 0.8 0.8]);
            set(GUI.handles.text_timeline_3,'BackgroundColor',[ 0.8 0.8 0.8]);
            set(GUI.handles.text_timeline_4,'BackgroundColor',[ 0.8 0.8 0.8]);
            set(GUI.handles.text_timeline_5,'BackgroundColor',[ 0.8 0.8 0.8]);
            
            set(GUI.handles.text_timeline_field1,'String',particle_char(particle_nr));
            set(GUI.handles.text_timeline_field2,'String',particle_char(particle_nr));
            set(GUI.handles.text_timeline_field3,'String',particle_char(particle_nr));
            set(GUI.handles.text_timeline_field4,'String',particle_char(particle_nr));
            set(GUI.handles.text_timeline_field5,'String',particle_char(particle_nr));
            
            set(GUI.handles_Timeline_Values(16+1),'String',' ');
            set(GUI.handles_Timeline_Values(16+2),'String',' ');
            set(GUI.handles_Timeline_Values(16+3),'String',' ');
            set(GUI.handles_Timeline_Values(16+4),'String',' ');
            
            set(GUI.handles.uipanel_Timelines_2D,     'BackgroundColor',particle_background );  
            set(GUI.handles.uipanel_Timelines_Data,   'BackgroundColor',particle_background );             
            set(GUI.handles.uipanel_RecordingChoices, 'BackgroundColor',particle_background );

            
            
        %-------------------------------------------------------------------------------------------
        %  2)  Visualize Particle:  Four Spinors,  Four spinor currents and summed to Axial current 
        %-------------------------------------------------------------------------------------------
        %-------------------------------------------------------------------------------------------
        %  3) Visualize Particle:   Four Spinors,  Four spinor currents and summed to Vector current   
        %-------------------------------------------------------------------------------------------
                       
        case {2,3}

            signal_o_sum = zeros(VAR.Sequence_Length,1);
            signal_x_sum = zeros(VAR.Sequence_Length,1);
            signal_y_sum = zeros(VAR.Sequence_Length,1);
            signal_z_sum = zeros(VAR.Sequence_Length,1);
            
            if GUI.Visualization_choice == 2
               timeline_5_String = 'Combined Axial current';
               signs             = [ +1, +1, +1, +1 ];
            else
               timeline_5_String = 'Combined Vector current';
               signs             = [ +1, +1, -1, -1 ];
            end   
         
            for time_line = 1:4
                
                signal_o = squeeze(VAR.Sequence_Bilinear_Spinor(:,particle_nr,time_line,1,1));
                signal_x = squeeze(VAR.Sequence_Bilinear_Spinor(:,particle_nr,time_line,2,2))  ...
                         + squeeze(VAR.Sequence_Bilinear_Spinor(:,particle_nr,time_line,2,3))  ...
                         + squeeze(VAR.Sequence_Bilinear_Spinor(:,particle_nr,time_line,2,4));
                signal_y = squeeze(VAR.Sequence_Bilinear_Spinor(:,particle_nr,time_line,3,2))  ...
                         + squeeze(VAR.Sequence_Bilinear_Spinor(:,particle_nr,time_line,3,3))  ...
                         + squeeze(VAR.Sequence_Bilinear_Spinor(:,particle_nr,time_line,3,4));
                signal_z = squeeze(VAR.Sequence_Bilinear_Spinor(:,particle_nr,time_line,4,2))  ...
                         + squeeze(VAR.Sequence_Bilinear_Spinor(:,particle_nr,time_line,4,3))  ...
                         + squeeze(VAR.Sequence_Bilinear_Spinor(:,particle_nr,time_line,4,4));
                
                     if GUI.signal_GUI_data_input_event
                         axes(GUI.handles_Timeline_Axes(time_line));
                         plot( [0 VAR.Sequence_Length],[0 0],'Color',[0.9 0.9 0.9],'LineWidth',3);                         
                         hold on
                         plot( signal_o, 'Color','k','LineWidth',2.0,'LineStyle','--');
                         plot( signal_x, 'Color','r','LineWidth',1.5,'LineStyle',':');
                         plot( signal_y, 'Color','g','LineWidth',1.5,'LineStyle',':');
                         plot( signal_z, 'Color','b','LineWidth',1.5,'LineStyle',':');
                         axis( [ 0 VAR.Sequence_Length  -3  3]);
                         hold off
                     end
                
                signal_o_sum = signal_o_sum + signs(time_line) * signal_o;
                signal_x_sum = signal_x_sum + signs(time_line) * signal_x;
                signal_y_sum = signal_y_sum + signs(time_line) * signal_y;
                signal_z_sum = signal_z_sum + signs(time_line) * signal_z;
                
                set(GUI.handles_Timeline_Values(4*(time_line-1)+1),'String',num2str(round(signal_o(entry),4)));
                set(GUI.handles_Timeline_Values(4*(time_line-1)+2),'String',num2str(round(signal_x(entry),4)));
                set(GUI.handles_Timeline_Values(4*(time_line-1)+3),'String',num2str(round(signal_y(entry),4)));
                set(GUI.handles_Timeline_Values(4*(time_line-1)+4),'String',num2str(round(signal_z(entry),4)));
                
                
                
            end
            
            if GUI.signal_GUI_data_input_event
                axes(GUI.handles_Timeline_Axes(5));
                plot( [0 VAR.Sequence_Length],[0 0],'Color',[0.9 0.9 0.9],'LineWidth',3);                         
                hold on
                plot( signal_o_sum/4, 'Color','k','LineWidth',2,'LineStyle','--');
                plot( signal_x_sum/4, 'Color','r','LineWidth',1,'LineStyle','-');
                plot( signal_y_sum/4, 'Color','g','LineWidth',1,'LineStyle','-');
                plot( signal_z_sum/4, 'Color','b','LineWidth',1,'LineStyle','-');
                axis( [ 0 VAR.Sequence_Length  -3  3]);
                hold off
            end
             
            set(GUI.handles.text_timeline_1,'String','L1 spinor total current');
            set(GUI.handles.text_timeline_2,'String','L2 spinor total current');
            set(GUI.handles.text_timeline_3,'String','R1 spinor total current');
            set(GUI.handles.text_timeline_4,'String','R2 spinor total current');
            set(GUI.handles.text_timeline_5,'String', timeline_5_String);
            
            set(GUI.handles.text_timeline_1,'BackgroundColor',[ 0.8 0.8 0.8]);
            set(GUI.handles.text_timeline_2,'BackgroundColor',[ 0.8 0.8 0.8]);
            set(GUI.handles.text_timeline_3,'BackgroundColor',[ 0.8 0.8 0.8]);
            set(GUI.handles.text_timeline_4,'BackgroundColor',[ 0.8 0.8 0.8]);
            set(GUI.handles.text_timeline_5,'BackgroundColor',[ 0.8 0.8 0.8]);
 
            set(GUI.handles.text_timeline_field1,'String',particle_char(particle_nr));
            set(GUI.handles.text_timeline_field2,'String',particle_char(particle_nr));
            set(GUI.handles.text_timeline_field3,'String',particle_char(particle_nr));
            set(GUI.handles.text_timeline_field4,'String',particle_char(particle_nr));
            set(GUI.handles.text_timeline_field5,'String',particle_char(particle_nr));
            
            set(GUI.handles_Timeline_Values(4*(5-1)+1),'String',num2str(round(signal_o_sum(entry)/4,4)));
            set(GUI.handles_Timeline_Values(4*(5-1)+2),'String',num2str(round(signal_x_sum(entry)/4,4)));
            set(GUI.handles_Timeline_Values(4*(5-1)+3),'String',num2str(round(signal_y_sum(entry)/4,4)));
            set(GUI.handles_Timeline_Values(4*(5-1)+4),'String',num2str(round(signal_z_sum(entry)/4,4)));
                       
            set(GUI.handles.uipanel_Timelines_2D,     'BackgroundColor',particle_background );  
            set(GUI.handles.uipanel_Timelines_Data,   'BackgroundColor',particle_background );  
            set(GUI.handles.uipanel_RecordingChoices, 'BackgroundColor',particle_background );


            
        %-------------------------------------------------------------------------------------------
        %  Visualize Bilinears: Axial current, and EM: Vector current,  Magnetization & Polarization
        %-------------------------------------------------------------------------------------------

        case {4,5}
            
                VecColors    = reshape(GUI.Vector_Colors,[4,4,3]);

                switch (GUI.Visualization_choice-4)
                    
                case 0
                    
                    enables(1:5,1:4)     = [ 1  1  1  1; 1  1  1  1; 0  1  1  1; 0  1  1  1; 0  0  0  0];
                    cols(   1:5,1:4)     = [ 9 14 15 16;13 10 11 12; 5  2  3  4; 1  6  7  8; 1  1  1  1]; 
                    rows(   1:5,1:4)     = [ 0  0  0  0; 4  4  4  4; 4  4  4  4; 4  4  4  4; 0  0  0  0];
                    timeline_String(1,:) = ' Axial vector current';
                    timeline_String(2,:) = ' EM Vector current   ';
                    timeline_String(3,:) = ' EM Magnetization    ';
                    timeline_String(4,:) = ' EM Polarization     ';
                    timeline_String(5,:) = '                     ';
                    vector_color(1,:)    = squeeze(VecColors(1,1,1:3));
                    vector_color(2,:)    = squeeze(VecColors(2,2,1:3));
                    vector_color(3,:)    = squeeze(VecColors(2,3,1:3));
                    vector_color(4,:)    = squeeze(VecColors(2,4,1:3));
                    vector_color(5,:)    = [0.8 0.8 0.8];
                    
                case 1
                    
                    enables(1:5,1:4)     = [ 0  0  0  0; 0  0  0  0; 0  0  0  0; 0  0  0  0; 0  0  0  0];
                    cols(   1:5,1:4)     = [ 1  1  1  1; 1  1  1  1; 1  1  1  1; 1  1  1  1; 1  1  1  1]; 
                    rows(   1:5,1:4)     = [ 0  0  0  0; 0  0  0  0; 0  0  0  0; 0  0  0  0; 0  0  0  0];
                    timeline_String(1,:) = '                     ';
                    timeline_String(2,:) = '                     ';
                    timeline_String(3,:) = '                     ';
                    timeline_String(4,:) = '                     ';
                    timeline_String(5,:) = '                     ';
                    vector_color(1,:)    = [0.8 0.8 0.8];
                    vector_color(2,:)    = [0.8 0.8 0.8];
                    vector_color(3,:)    = [0.8 0.8 0.8];
                    vector_color(4,:)    = [0.8 0.8 0.8];
                    vector_color(5,:)    = [0.8 0.8 0.8];
                    
                    time_line    = 1;
                    vector       = 0;
                    
                    while time_line <= 5 && vector <= 15
                        
                        if GUI.Boson_Vector_Select(vector+1)
                           switch vector
                                 case { 0, 1, 2, 3} % axial
                                    enables(time_line,1:4) = [ 1  1  1  1 ];
                                    cols(   time_line,1:4) = [ 9 14 15 16 ];
                                    timeline_String(time_line,4:17) = ' Axial current';
                                case { 4, 5, 6, 7} % vector
                                    enables(time_line,1:4) = [ 1  1  1  1 ];
                                    cols(   time_line,1:4) = [13 10 11 12 ];
                                    timeline_String(time_line,4:18) = ' Vector current';
                                case { 8, 9,10,11} % polarization
                                    enables(time_line,1:4) = [ 0  1  1  1 ];
                                    cols(   time_line,1:4) = [ 1  6  7  8 ];
                                    timeline_String(time_line,4:16) = ' Polarization';
                                case {12,13,14,15} % magnetization
                                    enables(time_line,1:4) = [ 0  1  1  1 ];
                                    cols(   time_line,1:4) = [ 5  2  3  4 ];
                                    timeline_String(time_line,4:17) = ' Magnetization';
                            end
                            
                            switch mod(vector,4)
                                case 0  
                                    timeline_String(time_line,2:3) = ' Z';
                                    rows(time_line,1:4) = [ 0  0  0  0 ];
                                case 1  
                                    timeline_String(time_line,2:3) = 'EM';
                                    rows(time_line,1:4) = [ 4  4  4  4 ];
                                case 2  
                                    timeline_String(time_line,2:3) = 'W1';
                                    rows(time_line,1:4) = [ 8  8  8  8 ];
                                case 3  
                                    timeline_String(time_line,2:3) = 'W2';
                                    rows(time_line,1:4) = [12 12 12 12 ];
                            end
                            
                            if GUI.W_Boson_Type_12_not_pm == -1 
                                if timeline_String(time_line,2:18) == 'W1 Vector current'
                                   timeline_String(time_line,3) = '+';
                                end
                                if timeline_String(time_line,2:18) == 'W2 Vector current'
                                   timeline_String(time_line,3) = '-';
                                end
                            end
                            
                            vector_color(time_line,1:3) = GUI.Vector_Colors(vector+1,1:3);
                            
                            time_line = time_line + 1;
                            
                        end % if
                        
                        vector = vector + 1;
                        
                    end % while
                    
                end % switch

            generation = VAR.Field_generation(bilinear_nr);

           
            for time_line = 1:5
                
                signal_o = zeros(720,1);
                signal_x = zeros(720,1);
                signal_y = zeros(720,1);
                signal_z = zeros(720,1);
                
                if ~GUI.Enable_Accumulation
                    fermion = generation;
                            signal_o = squeeze(enables(time_line,1))*squeeze(VecSequence(:,rows(time_line,1)+fermion+1,cols(time_line,1)));
                            signal_x = squeeze(enables(time_line,2))*squeeze(VecSequence(:,rows(time_line,2)+fermion+1,cols(time_line,2)));
                            signal_y = squeeze(enables(time_line,3))*squeeze(VecSequence(:,rows(time_line,3)+fermion+1,cols(time_line,3)));
                            signal_z = squeeze(enables(time_line,4))*squeeze(VecSequence(:,rows(time_line,4)+fermion+1,cols(time_line,4)));
                else
                    for fermion = 0:3
                        if GUI.Fermion_Gen_Select(fermion+1) == true
                            signal_o = signal_o + squeeze(enables(time_line,1))*squeeze(VecSequence(:,rows(time_line,1)+fermion+1,cols(time_line,1)));
                            signal_x = signal_x + squeeze(enables(time_line,2))*squeeze(VecSequence(:,rows(time_line,2)+fermion+1,cols(time_line,2)));
                            signal_y = signal_y + squeeze(enables(time_line,3))*squeeze(VecSequence(:,rows(time_line,3)+fermion+1,cols(time_line,3)));
                            signal_z = signal_z + squeeze(enables(time_line,4))*squeeze(VecSequence(:,rows(time_line,4)+fermion+1,cols(time_line,4)));
                        end
                    end
                end
                
               if GUI.signal_GUI_data_input_event
                    if sum(squeeze(enables(time_line,1:4))) ~= 0
                        axes(GUI.handles_Timeline_Axes(time_line));
                        plot( [0 VAR.Sequence_Length],[0 0],'Color',[0.9 0.9 0.9],'LineWidth',3);
                        hold on
                        if enables(time_line,1) ~= 0
                        plot( signal_o, 'Color','k','LineWidth',2,'LineStyle','--');
                        end
                        plot( signal_x, 'Color','r','LineWidth',1,'LineStyle','-');
                        plot( signal_y, 'Color','g','LineWidth',1,'LineStyle','-');
                        plot( signal_z, 'Color','b','LineWidth',1,'LineStyle','-');
                        axis( [ 0 VAR.Sequence_Length  -3  3]);
                        hold off
                    else
                        axes(GUI.handles_Timeline_Axes(time_line));
                        set(GUI.handles_Timeline_Axes(time_line),'NextPlot','replace');
                        plot([0,1]);
                        axis( [ 0 VAR.Sequence_Length  -3  3]);
                    end
                end
                
               if enables(time_line,1) == 1
                  set(GUI.handles_Timeline_Values(4*(time_line-1)+1),'String',num2str(round(signal_o(entry),4)));
               else
                  set(GUI.handles_Timeline_Values(4*(time_line-1)+1),'String','');
               end
               
               if sum(squeeze(enables(time_line,2:4))) ~= 0
                  set(GUI.handles_Timeline_Values(4*(time_line-1)+2),'String',num2str(round(signal_x(entry),4)));
                  set(GUI.handles_Timeline_Values(4*(time_line-1)+3),'String',num2str(round(signal_y(entry),4)));
                  set(GUI.handles_Timeline_Values(4*(time_line-1)+4),'String',num2str(round(signal_z(entry),4)));
               else
                  set(GUI.handles_Timeline_Values(4*(time_line-1)+2),'String','');
                  set(GUI.handles_Timeline_Values(4*(time_line-1)+3),'String','');
                  set(GUI.handles_Timeline_Values(4*(time_line-1)+4),'String','');
               end

               
                
            end %for
                        
            set(GUI.handles.text_timeline_1,'String',timeline_String(1,:));
            set(GUI.handles.text_timeline_2,'String',timeline_String(2,:));
            set(GUI.handles.text_timeline_3,'String',timeline_String(3,:));
            set(GUI.handles.text_timeline_4,'String',timeline_String(4,:));
            set(GUI.handles.text_timeline_5,'String',timeline_String(5,:));
            
            set(GUI.handles.text_timeline_1,'BackgroundColor',squeeze(vector_color(1,1:3)));
            set(GUI.handles.text_timeline_2,'BackgroundColor',squeeze(vector_color(2,1:3)));
            set(GUI.handles.text_timeline_3,'BackgroundColor',squeeze(vector_color(3,1:3)));
            set(GUI.handles.text_timeline_4,'BackgroundColor',squeeze(vector_color(4,1:3)));
            set(GUI.handles.text_timeline_5,'BackgroundColor',squeeze(vector_color(5,1:3)));
            
            set(GUI.handles.text_timeline_field1,'String',particle_char(bilinear_nr));
            set(GUI.handles.text_timeline_field2,'String',particle_char(bilinear_nr));
            set(GUI.handles.text_timeline_field3,'String',particle_char(bilinear_nr));
            set(GUI.handles.text_timeline_field4,'String',particle_char(bilinear_nr));
            set(GUI.handles.text_timeline_field5,'String',particle_char(bilinear_nr));
            
            set(GUI.handles.uipanel_Timelines_2D,     'BackgroundColor',bilinear_background );  
            set(GUI.handles.uipanel_Timelines_Data,   'BackgroundColor',bilinear_background );  
            set(GUI.handles.uipanel_RecordingChoices, 'BackgroundColor',bilinear_background );

        %-------------------------------------------------------------------------------------------
        % Visualize 3 Bilinears:  Total and combined Electromagnetic Vector currents   
        %-------------------------------------------------------------------------------------------

        case {6,7,8,9}
            
            signal_o_sum = zeros(VAR.Sequence_Length,1);
            signal_x_sum = zeros(VAR.Sequence_Length,1);
            signal_y_sum = zeros(VAR.Sequence_Length,1);
            signal_z_sum = zeros(VAR.Sequence_Length,1);
            
            switch (GUI.Visualization_choice-6)
                case 0
                    row = [6 7 8]; col = [13 10 11 12 ];
                    timeline_String = ' EM Vector current';
                    background_col  = squeeze(GUI.Vector_Colors(6,1:3));
                case 1
                    row = [6 7 8]; col = [ 0  2  3  4 ];
                    timeline_String = ' EM Magnetization';
                    background_col  = squeeze(GUI.Vector_Colors(14,1:3));
                case 2
                    row = [6 7 8]; col = [ 0  6  7  8 ];
                    timeline_String = ' EM Polarization';
                    background_col  = squeeze(GUI.Vector_Colors(10,1:3));
                case 3
                    row = [2 3 4]; col = [ 9 14 15 16 ];
                    timeline_String = ' Axial current';
                    background_col  = squeeze(GUI.Vector_Colors(1,1:3));
            end
            
            for time_line = 1:3
                particle_nr = time_line;
                
                
                if col(1) ~= 0
                signal_o = squeeze(VecSequence(:,row(1),col(1)))  ...
                         + squeeze(VecSequence(:,row(2),col(1)))  ...
                         + squeeze(VecSequence(:,row(3),col(1)));
                else
                    signal_o = zeros(length,1);
                end
                     
                signal_x = squeeze(VecSequence(:,row(1),col(2)))  ...
                         + squeeze(VecSequence(:,row(2),col(2)))  ...
                         + squeeze(VecSequence(:,row(3),col(2)));
                signal_y = squeeze(VecSequence(:,row(1),col(3)))  ...
                         + squeeze(VecSequence(:,row(2),col(3)))  ...
                         + squeeze(VecSequence(:,row(3),col(3)));
                signal_z = squeeze(VecSequence(:,row(1),col(4)))  ...
                         + squeeze(VecSequence(:,row(2),col(4)))  ...
                         + squeeze(VecSequence(:,row(3),col(4)));
                
                if GUI.signal_GUI_data_input_event
                   axes(GUI.handles_Timeline_Axes(time_line));
                   plot( [0 VAR.Sequence_Length],[0 0],'Color',[0.9 0.9 0.9],'LineWidth',3);                         
                   hold on
                   plot( signal_o, 'Color','k','LineWidth',2.0,'LineStyle','--');
                   plot( signal_x, 'Color','r','LineWidth',1.5,'LineStyle',':');
                   plot( signal_y, 'Color','g','LineWidth',1.5,'LineStyle',':');
                   plot( signal_z, 'Color','b','LineWidth',1.5,'LineStyle',':');
                   axis( [ 0 VAR.Sequence_Length  -2  2]);
                   hold off
                end
            
                signal_o_sum = signal_o_sum + signal_o;
                signal_x_sum = signal_x_sum + signal_x;
                signal_y_sum = signal_y_sum + signal_y;
                signal_z_sum = signal_z_sum + signal_z;
                
                set(GUI.handles_Timeline_Values(4*(time_line-1)+1),'String',num2str(round(signal_o(entry),4)));
                set(GUI.handles_Timeline_Values(4*(time_line-1)+2),'String',num2str(round(signal_x(entry),4)));
                set(GUI.handles_Timeline_Values(4*(time_line-1)+3),'String',num2str(round(signal_y(entry),4)));
                set(GUI.handles_Timeline_Values(4*(time_line-1)+4),'String',num2str(round(signal_z(entry),4)));

                
            end
            
            if GUI.signal_GUI_data_input_event
                axes(GUI.handles_Timeline_Axes(4));
                set( GUI.handles_Timeline_Axes(4),'NextPlot','replace');
                plot([0,1]);
                axis( [ 0 VAR.Sequence_Length  -2  2]);
                               
                axes(GUI.handles_Timeline_Axes(5));
                plot( [0 VAR.Sequence_Length],[0 0],'Color',[0.9 0.9 0.9],'LineWidth',3);                         
                hold on
                plot( signal_o_sum, 'Color','k','LineWidth',2,'LineStyle','--');
                plot( signal_x_sum, 'Color','r','LineWidth',1,'LineStyle','-');
                plot( signal_y_sum, 'Color','g','LineWidth',1,'LineStyle','-');
                plot( signal_z_sum, 'Color','b','LineWidth',1,'LineStyle','-');               
                axis( [ 0 VAR.Sequence_Length  -2  2]);
                hold off
            end
            
            set(GUI.handles.text_timeline_1,'String',['Bilinear 1:' timeline_String]);
            set(GUI.handles.text_timeline_2,'String',['Bilinear 2:' timeline_String]);
            set(GUI.handles.text_timeline_3,'String',['Bilinear 3:' timeline_String]);
            set(GUI.handles.text_timeline_4,'String',' ');            
            set(GUI.handles.text_timeline_5,'String',['Combined', timeline_String]);

            set(GUI.handles.text_timeline_1,'BackgroundColor',background_col);
            set(GUI.handles.text_timeline_2,'BackgroundColor',background_col);
            set(GUI.handles.text_timeline_3,'BackgroundColor',background_col);
            set(GUI.handles.text_timeline_4,'BackgroundColor',[ 0.8 0.8 0.8]);
            set(GUI.handles.text_timeline_5,'BackgroundColor',background_col);

            set(GUI.handles.text_timeline_field1,'String',particle_char(1));
            set(GUI.handles.text_timeline_field2,'String',particle_char(2));
            set(GUI.handles.text_timeline_field3,'String',particle_char(3));
            set(GUI.handles.text_timeline_field4,'String','');
            set(GUI.handles.text_timeline_field5,'String','');
            
            set(GUI.handles_Timeline_Values(4*(4-1)+1),'String','');
            set(GUI.handles_Timeline_Values(4*(4-1)+2),'String','');
            set(GUI.handles_Timeline_Values(4*(4-1)+3),'String','');
            set(GUI.handles_Timeline_Values(4*(4-1)+4),'String','');

            set(GUI.handles_Timeline_Values(4*(5-1)+1),'String',num2str(round(signal_o_sum(entry),4)));
            set(GUI.handles_Timeline_Values(4*(5-1)+2),'String',num2str(round(signal_x_sum(entry),4)));
            set(GUI.handles_Timeline_Values(4*(5-1)+3),'String',num2str(round(signal_y_sum(entry),4)));
            set(GUI.handles_Timeline_Values(4*(5-1)+4),'String',num2str(round(signal_z_sum(entry),4)));
            
            set(GUI.handles.uipanel_RecordingChoices, 'BackgroundColor',bilinear_background );

            
        %-------------------------------------------------------------------------------------------
        %   
        %-------------------------------------------------------------------------------------------
           

    end % switch
    
    if GUI.Table_Data_TableNr > 0
         
        switch GUI.Table_Data_TableNr
           case 1
               table_data = get(GUI.handles.uitable_Operator_Field_Matrix,'Data');
           case 2
               table_data = get(GUI.handles.uitable_Field_in,'Data');
           case 3
               table_data = get(GUI.handles.uitable_Field_out,'Data');
           case 4
               table_data = get(GUI.handles.uitable_Bilinear_Field_Matrix,'Data');
           case 5
               table_data = get(GUI.handles.uitable_Bilinear_Spinor_Matrices,'Data');
        end
        
        cell_data  = table_data(GUI.Table_Data_Indices(1),GUI.Table_Data_Indices(2));
        set(GUI.handles.text_Selected_Cell_Data,'String', cell_data);
    end


end

