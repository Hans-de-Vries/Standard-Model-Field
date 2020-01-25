function UnifiedField_GUI_Show_3D(VAR,GUI,GEN,IMG,mode,bilinear_nr,particle_char)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_GUI_Show_3D
%
% Display visualizations
%  
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    %-----------------------------------------------------------------------------------------------
    % Visualize Bilinear Field matrix
    %-----------------------------------------------------------------------------------------------

    entry               = VAR.Sequence_Entry;
    
    format long

    bilinear_string = ['Bilinear Matrix no. ',particle_char(bilinear_nr)];
    
    if     mode == 1  % show generator acting on field(s)
           table_Data = round(squeeze(VAR.Bilinear_Field_Matrix(bilinear_nr,1:16,1:16)),4);          
    elseif mode == 2  % show operator sequence acting on field(s)
           table_Data = round(squeeze(VAR.Sequence_Bilinear_Field(entry,bilinear_nr,1:16,1:16)),4);
    end
    
    
    if GUI.Bilinear_Field_Matrix_gamma == true
        column_Name = {'Mass';'magn x';'magn y';'magn z';'pseudo';'polar x';'polar y';'polar z';'axial o';'vector x';'vector y';'vector z';'vector o';'axial x';'axial y';'axial z'};
    else
        table_Data =  table_Data * GEN.I3o;  % undo the gamma
        column_Name = {'vector o';'axial x';'axial y';'axial z';'axial o';'vector x';'vector y';'vector z';'-pseudo';'-polar x';'-polar y';'-polar z';'-Mass';'-magn x';'-magn y';'-magn z'};
    end
               
    if GUI.signal_GUI_bilinear_gamma_event || GUI.signal_GUI_start
        for boson = 1:4
            pos1 = get(GUI.handles_Boson_Vectors(4*(boson-1)+1),'Position');
            pos2 = get(GUI.handles_Boson_Vectors(4*(boson-1)+2),'Position');
            pos3 = get(GUI.handles_Boson_Vectors(4*(boson-1)+3),'Position');
            pos4 = get(GUI.handles_Boson_Vectors(4*(boson-1)+4),'Position');
            if ( GUI.Bilinear_Field_Matrix_gamma &&  pos4(1) > pos1(1)  ) || ...
               (~GUI.Bilinear_Field_Matrix_gamma &&  pos4(1) < pos1(1)  )   
               set(GUI.handles_Boson_Vectors(4*(boson-1)+1),'Position', pos4 );
               set(GUI.handles_Boson_Vectors(4*(boson-1)+2),'Position', pos3 );
               set(GUI.handles_Boson_Vectors(4*(boson-1)+3),'Position', pos2 );
               set(GUI.handles_Boson_Vectors(4*(boson-1)+4),'Position', pos1 );  
            end
        end 
 
        VecColors = reshape(GUI.Vector_Colors,[4,4,3]);

        for boson = 1:4
            for vector = 1:4
                if GUI.Boson_Vector_Select(boson,vector) 
                    set(GUI.handles_Boson_Vectors(4*(boson-1)+vector),   'BackgroundColor',VecColors(boson,vector,1:3) );
                else
                    set(GUI.handles_Boson_Vectors(4*(boson-1)+vector),   'BackgroundColor',[0.8 0.8 0.8]  );
                end
            end
        end
        
        
    end
    


    %-----------------------------------------------------------------------------------------------
    % Visualize Bilinear Field Panel
    %-----------------------------------------------------------------------------------------------

    set(GUI.handles.uitable_Bilinear_Field_Matrix,'Data',table_Data); 
    set(GUI.handles.uitable_Bilinear_Field_Matrix,'ColumnName',column_Name);
    set(GUI.handles.text_Bilinear_Field_Matrix,'String',bilinear_string);    

    bilinear_background = squeeze(IMG.color(2+bilinear_nr,1:3));  

    set(GUI.handles.uitable_Bilinear_Field_Matrix,    'BackgroundColor',[([3 3 3]+bilinear_background)/4; bilinear_background] );
    set(GUI.handles.uipanel_Boson_Vector_Select,      'BackgroundColor',bilinear_background );
    set(GUI.handles.uipanel_Boson_Vector_Flags,       'BackgroundColor',bilinear_background );
    set(GUI.handles.uipanel_Fermion_Gen_Flags,        'BackgroundColor',bilinear_background );
    set(GUI.handles.text_Bilinear_Field_Matrix,       'BackgroundColor',bilinear_background );
    set(GUI.handles.checkbox_Enable_Bilinear_choice,  'BackgroundColor',bilinear_background );
    set(GUI.handles.checkbox_Enable_Accumulation,     'BackgroundColor',bilinear_background );
    set(GUI.handles.checkbox_Show_Vector_Trajectories,'BackgroundColor',bilinear_background );
    set(GUI.handles.pushbutton_Select_Fermion_LS,     'BackgroundColor',bilinear_background );
    set(GUI.handles.pushbutton_Select_Fermion_RS,     'BackgroundColor',bilinear_background );
    set(GUI.handles.text_boson_Z,                     'BackgroundColor',bilinear_background );
    set(GUI.handles.text_boson_A,                     'BackgroundColor',bilinear_background );
    set(GUI.handles.text_boson_W1,                    'BackgroundColor',bilinear_background );
    set(GUI.handles.text_boson_W2,                    'BackgroundColor',bilinear_background );
    set(GUI.handles.text_Viualization_Scale,          'BackgroundColor',bilinear_background );
    set(GUI.handles.text_Viualization_Angle,          'BackgroundColor',bilinear_background );
    set(GUI.handles.popupmenu_Bilinear_Construction,  'BackgroundColor',bilinear_background );
    set(GUI.handles.text_Video_File_Name,             'BackgroundColor',bilinear_background );

    if GUI.Bilinear_Field_Matrix_gamma
        bilinear_image = IMG.bilinear_image;
        set(GUI.handles.pushbutton_Bilinear_gamma,    'ForegroundColor','k');
    else
        bilinear_image = IMG.bilinearT_image;
        set(GUI.handles.pushbutton_Bilinear_gamma,    'ForegroundColor',[0.8 0.8 0.8]);
    end
    
    if ~GUI.Enable_Accumulation
        bilinear_foreground = [0.5 0.5 0.5];
    else
        bilinear_foreground = [0.0 0.0 0.0];
    end
    
       
    set(GUI.handles.checkbox_Fermion_Generation_0,    'ForegroundColor',bilinear_foreground );
    set(GUI.handles.checkbox_Fermion_Generation_1,    'ForegroundColor',bilinear_foreground );
    set(GUI.handles.checkbox_Fermion_Generation_2,    'ForegroundColor',bilinear_foreground );
    set(GUI.handles.checkbox_Fermion_Generation_3,    'ForegroundColor',bilinear_foreground );
            
    dims = size(bilinear_image);
    axes(GUI.handles.axes_Bilinear_Image)
    imagesc(uint8(double(bilinear_image) .* reshape( repmat( bilinear_background, dims(1)*dims(2), 1), dims) ))
    set(GUI.handles.axes_Bilinear_Image,'XColor','none')
    set(GUI.handles.axes_Bilinear_Image,'YColor','none')
    
    set(GUI.handles.popupmenu_Bilinear_Construction,'Value',VAR.Bilinear_Construction_Choice(bilinear_nr) );
    
    if VAR.Bilinear_Construction_Choice(bilinear_nr) == 1
        %set(GUI.handles.axes_Bilinear_Image,         'Visible','On' );
        %axes(GUI.handles.axes_Bilinear_Image);
        set(GUI.handles.pushbutton_Select_Fermion_LS, 'Visible','On' );
        set(GUI.handles.pushbutton_Select_Fermion_RS, 'Visible','On' );
    else
        %set(GUI.handles.axes_Bilinear_Image,         'Visible','Off');
        %axes(GUI.handles.axes_Bilinear_Image);
        set(GUI.handles.pushbutton_Select_Fermion_LS, 'Visible','Off');
        set(GUI.handles.pushbutton_Select_Fermion_RS, 'Visible','Off');
    end
   
    %-----------------------------------------------------------------------------------------------
    % Visualize 3D Boson Vectors
    %-----------------------------------------------------------------------------------------------

    if GUI.W_Boson_Type_12_not_pm == +1      
        VectorTexts = ...
            reshape(      ...
            [' Z-axial '; ' A-axial ';'W1-axial ';'W2-axial '; ...
             ' Z-vector'; ' A-vector';'W1-vector';'W2-vector'; ...
             ' Z-polar '; ' A-polar ';'W1-polar ';'W2-polar '; ...
             ' Z-magnet'; ' A-magnet';'W1-magnet';'W2-magnet'],...
            [4,4,9]);
    else
        VectorTexts = ...
            reshape(      ...
            [' Z-axial '; ' A-axial ';'W1 axial ';'W2 axial '; ...
             ' Z-vector'; ' A-vector';'W+ vector';'W- vector'; ...
             ' Z-polar '; ' A-polar ';'W1 polar ';'W2 polar '; ...
             ' Z-magnet'; ' A-magnet';'W1 magnet';'W2 magnet'],...
            [4,4,9]);
    end

    generation = VAR.Field_generation(bilinear_nr);
   
    
    phi_count = 16;
    
    arrow1D          = [ 0 1 2 3 4 5 6 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2];
    arrow3D          = zeros(4,4,length(arrow1D),phi_count+1,3); 
    arrow_length     = length(arrow1D);
    total_length     = VAR.Sequence_Length;
    orbitSampleRatio = 1;
    samples_total    = fix(total_length/orbitSampleRatio);
    entries          = (1:samples_total);
    samples          = orbitSampleRatio*entries;            
    Vectors          = zeros(4,4,3);
    Orbits           = zeros(samples_total,4,4,3);
    VecColors        = reshape(GUI.Vector_Colors,[4,4,3]);
    VecSequence      = reshape(VAR.Sequence_Bilinear_Field(:,bilinear_nr,1:16,1:16),[samples_total,16,16]);
        
    
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
       

    
    for boson=1:4
        

    %-----------------------------------------------------------------------------------------------
    %  Select the vector coordinates to display
    %-----------------------------------------------------------------------------------------------

        if ~GUI.Enable_Accumulation
            fermion = generation;
                    Vectors(boson,4,:)  =  squeeze(VecSequence(entry,4*(boson-1)+fermion+1, 2:4 ));
                    Vectors(boson,3,:)  =  squeeze(VecSequence(entry,4*(boson-1)+fermion+1, 6:8 ));
                    Vectors(boson,2,:)  =  squeeze(VecSequence(entry,4*(boson-1)+fermion+1,10:12));
                    Vectors(boson,1,:)  =  squeeze(VecSequence(entry,4*(boson-1)+fermion+1,14:16));
         else
            for fermion = 0:3
                if GUI.Fermion_Gen_Select(fermion+1) == true
                    Vectors(boson,4,:)  =  squeeze(Vectors(boson,4,1:3)) + squeeze(VecSequence(entry,4*(boson-1)+fermion+1, 2:4 ));
                    Vectors(boson,3,:)  =  squeeze(Vectors(boson,3,1:3)) + squeeze(VecSequence(entry,4*(boson-1)+fermion+1, 6:8 ));
                    Vectors(boson,2,:)  =  squeeze(Vectors(boson,2,1:3)) + squeeze(VecSequence(entry,4*(boson-1)+fermion+1,10:12));
                    Vectors(boson,1,:)  =  squeeze(Vectors(boson,1,1:3)) + squeeze(VecSequence(entry,4*(boson-1)+fermion+1,14:16));
                end
            end
        end
       
    %-----------------------------------------------------------------------------------------------
    %  Select the trajectory coordinates to display
    %-----------------------------------------------------------------------------------------------
    
        if ~GUI.Enable_Accumulation &&  GUI.Show_Vector_Trajectories
            fermion = generation;
                    Orbits(:,boson,4,:)  =  squeeze(VecSequence(samples,4*(boson-1)+fermion+1, 2:4 ));
                    Orbits(:,boson,3,:)  =  squeeze(VecSequence(samples,4*(boson-1)+fermion+1, 6:8 ));
                    Orbits(:,boson,2,:)  =  squeeze(VecSequence(samples,4*(boson-1)+fermion+1,10:12));
                    Orbits(:,boson,1,:)  =  squeeze(VecSequence(samples,4*(boson-1)+fermion+1,14:16));
        elseif GUI.Enable_Accumulation
            for fermion = 0:3
                if GUI.Fermion_Gen_Select(fermion+1) == true
                    Orbits(:,boson,4,:)  =  squeeze(Orbits(entries,boson,4,1:3)) + squeeze(VecSequence(samples,4*(boson-1)+fermion+1, 2:4 ));
                    Orbits(:,boson,3,:)  =  squeeze(Orbits(entries,boson,3,1:3)) + squeeze(VecSequence(samples,4*(boson-1)+fermion+1, 6:8 ));
                    Orbits(:,boson,2,:)  =  squeeze(Orbits(entries,boson,2,1:3)) + squeeze(VecSequence(samples,4*(boson-1)+fermion+1,10:12));
                    Orbits(:,boson,1,:)  =  squeeze(Orbits(entries,boson,1,1:3)) + squeeze(VecSequence(samples,4*(boson-1)+fermion+1,14:16));
                end
            end
        end
        
    %-----------------------------------------------------------------------------------------------
    %  Construct the 3d arrow meshes to display
    %-----------------------------------------------------------------------------------------------
        
        for vector = 1:4
            
            scale_Vector = sqrt(sum(Vectors(boson,vector,1:3).^2));
            
            if scale_Vector < 0.0001
                rot_Matrix(1:3,1:3)  =  eye(3);               
            else
                unit_Vector(1:3)     =  squeeze(Vectors(boson,vector,1:3))/scale_Vector;
                scale_rot_Vector     =  sqrt(sum(unit_Vector(1:2).^2));
                
                if scale_rot_Vector < 0.0001
                    rot_Vector(1:3)  =  [1, 0, 0];
                else
                    rot_Vector(1:3)  =  [-unit_Vector(2), unit_Vector(1), 0]/scale_rot_Vector;
                end


                rot_Mat              =  rot_Vector(1)*GEN.rx + rot_Vector(2)*GEN.ry + rot_Vector(3)*GEN.rz;
                rot_Angle            =  acos(unit_Vector(3)); 
                rot_Matrix(1:3,1:3)  =  expm(rot_Angle * rot_Mat);
 
            end

                           

            for z = 1:arrow_length
                for phi = 0:phi_count
                    X  = cos(phi*2*pi/phi_count) * arrow1D(z)/arrow_length;
                    Y  = sin(phi*2*pi/phi_count) * arrow1D(z)/arrow_length;
                    Z  = 1-z/arrow_length;
                    arrow3D(boson,vector,z,phi+1,1:3) = scale_Vector * rot_Matrix(1:3,1:3)*[X Y Z]';
                end
            end
            
        end
    end
    
    
    axes(GUI.handles.axes_Visualization);
    cla
    scale = get(GUI.handles.slider_Visualization_Scale,'Value'); %1.4;
    set(gca,'xdir','normal');
    set(gca,'ydir','normal');
    set(gca,'zdir','normal');
    axis([-scale +scale -scale +scale -scale +scale])
    phi = get(GUI.handles.slider_Visualization_Angle,'Value');
    view(-phi,16), grid on
       
    hold on
    
    plot3([0,scale],[0,0],[0,0],'Color','g','LineStyle','-');
    plot3([0,0],[0,scale],[0,0],'Color','b','LineStyle','-');
    plot3([0,0],[0,0],[0,scale],'Color','r','LineStyle','-');
    
    text(scale,0,0,'Y','FontSize',14,'Color','g','HorizontalAlignment','center');
    text(0,scale,0,'Z','FontSize',14,'Color','b','HorizontalAlignment','center');
    text(0,0,scale,'X','FontSize',14,'Color','r','HorizontalAlignment','center');
        
    for boson=1:4
        for vector = 1:4
            if GUI.Boson_Vector_Select(boson,vector)
                mesh     = squeeze(arrow3D(boson,vector,1:arrow_length,1:phi_count+1,1:3));
                surf(mesh(:,:,2), mesh(:,:,3), mesh(:,:,1), 'FaceAlpha', 0.8, 'FaceColor', VecColors(boson,vector,1:3), 'EdgeColor','k', 'LineWidth', 0.1, 'LineStyle','-');
                
                if true %% GUI.Show_Vector_Orbits
                    orbit_x = squeeze(Orbits(:,boson,vector,2));
                    orbit_y = squeeze(Orbits(:,boson,vector,3));
                    orbit_z = squeeze(Orbits(:,boson,vector,1));
                    plot3(orbit_x, orbit_y, orbit_z, 'Color',VecColors(boson,vector,1:3),'LineWidth', 2,'LineStyle','-');
                    plot3(orbit_x, orbit_y, orbit_z, 'Color','k','LineWidth', 1,'LineStyle',':');
                end
                
                vec      = squeeze(Vectors(boson,vector,1:3))*1.05;
                text_x = min(scale,max(-scale,vec(2)));
                text_y = min(scale,max(-scale,vec(3)));
                text_z = min(scale,max(-scale,vec(1))); 
              %font_scale = min(5/3,max(abs( [1,total_x/vec(2),total_y/vec(3),total_z/vec(1)] )));
           
                fontsize = min(24,max(3,sqrt(sum(vec.^2))*15/scale) );
                textstr  = VectorTexts(boson,vector,:);
                text(text_x,text_y,text_z,textstr,'FontSize',fontsize,'HorizontalAlignment','center');
                
            end
        end
    end
    
    
    hold off
    
end  % 
    
  