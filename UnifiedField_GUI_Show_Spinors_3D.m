function UnifiedField_GUI_Show_Spinors_3D(VAR,GUI,GEN,IMG,mode,particle_nr,fermion_name,particle_char)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_GUI_Visualization()
%
% Display visualizations
%  
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %-----------------------------------------------------------------------------------------------
    % Visualize Spinors in 3D
    %-----------------------------------------------------------------------------------------------

    
        

    %-----------------------------------------------------------------------------------------------
    % Locally repeated definitions
    %-----------------------------------------------------------------------------------------------
        

    entry               = VAR.Sequence_Entry;
    length              = VAR.Sequence_Length;
    particle_background = squeeze(IMG.color(2+particle_nr,1:3));  

    %-----------------------------------------------------------------------------------------------
    %  
    %-----------------------------------------------------------------------------------------------

    mat = zeros(3,4,4,4);


    set(GUI.handles.uipanel_Bilinear_Spinors_Data,  'BackgroundColor',particle_background );
    set(GUI.handles.text_Bilinear_Spinor_Matrices,  'BackgroundColor',particle_background );
    set(GUI.handles.checkbox_Show_Spinor_Current,   'BackgroundColor',particle_background );
    set(GUI.handles.checkbox_Show_Spinor_Meshes,    'BackgroundColor',particle_background );
    set(GUI.handles.text_Viualization_Scale2,       'BackgroundColor',particle_background );
    set(GUI.handles.text_Viualization_Angle2,       'BackgroundColor',particle_background );
    set(GUI.handles.text_TITLE_VERSION,             'BackgroundColor',particle_background );
    set(GUI.handles.text_AUTHOR,                    'BackgroundColor',particle_background );

    %-----------------------------------------------------------------------------------------------
    % Visualize Bilinear Spinor matrices
    %-----------------------------------------------------------------------------------------------

    bilinear_spinors  =  zeros(4,16);

    if     mode == 1       
            bilinear_spinors(1:4, 1:4 )    =  VAR.Bilinear_Spinor_Matrix(particle_nr,1,1:4,1:4);
            bilinear_spinors(1:4, 5:8 )    =  VAR.Bilinear_Spinor_Matrix(particle_nr,2,1:4,1:4);
            bilinear_spinors(1:4, 9:12)    =  VAR.Bilinear_Spinor_Matrix(particle_nr,3,1:4,1:4);
            bilinear_spinors(1:4,13:16)    =  VAR.Bilinear_Spinor_Matrix(particle_nr,4,1:4,1:4);         
     elseif mode == 2
            bilinear_spinors(1:4, 1:4 )    =  VAR.Sequence_Bilinear_Spinor(entry,particle_nr,1,1:4,1:4);
            bilinear_spinors(1:4, 5:8 )    =  VAR.Sequence_Bilinear_Spinor(entry,particle_nr,2,1:4,1:4);
            bilinear_spinors(1:4, 9:12)    =  VAR.Sequence_Bilinear_Spinor(entry,particle_nr,3,1:4,1:4);
            bilinear_spinors(1:4,13:16)    =  VAR.Sequence_Bilinear_Spinor(entry,particle_nr,4,1:4,1:4);         
    end  
    
    set(GUI.handles.uitable_Bilinear_Spinor_Matrices,'Data', round(bilinear_spinors,4) );
    set(GUI.handles.uitable_Bilinear_Spinor_Matrices,'BackgroundColor',[([3 3 3]+particle_background)/4;particle_background]);
    set(GUI.handles.text_Bilinear_Spinor_Matrices,'String',['The three spin-vectors Sx Sy Sz of the four spinors of Fermion ',particle_char(particle_nr)]);

    
% % %     if true % GUI.Show_3D_choice == 2 % show current rotation matrices
        
    mat = squeeze(VAR.Sequence_Bilinear_Spinor(entry,1:3,1:4,1:4,1:4));
        
% % %     else % show spinor rotation matrices
% % %         
% % %         for particle = 1:3           
% % %             for spinor = 1:4
% % %  
% % %                 spinor_indices = (4*(spinor-1)+1) : (4*(spinor-1)+4);
% % %                 spinor_field   = squeeze(VAR.Sequence_Fields(entry, particle, spinor_indices ));
% % %                
% % %                 current_scale  = squeeze(VAR.Sequence_Bilinear_Spinor(entry,particle,spinor,1,1));
% % %                 current_mat    = squeeze(VAR.Sequence_Bilinear_Spinor(entry,particle,spinor,2:4,2:4))/current_scale;
% % %                 
% % %                 log_mat        = logm(current_mat);
% % %                 
% % %                 mat(particle,spinor, 1:4, 1:4 )   = zeros(4,4);
% % %                 mat(particle,spinor,   1,  1  )   = sqrt(current_scale);
% % % 
% % %                 if spinor_field>= 0
% % %                     halfanglefactor =  1/2;
% % %                 else
% % %                     halfanglefactor =  3/2;
% % %                 end               
% % %                 mat(particle,spinor, 2:4, 2:4 )   = real(expm(halfanglefactor * log_mat));
% % %         
% % %             end           
% % %         end
% % %                        
% % %     end
    
    col = ['r','g','b'];
        
        
    if any(GUI.Show_Spinor_Current) || any(GUI.Show_Spinor_Meshes) 
        
            
            orbitAll = squeeze(VAR.Sequence_Bilinear_Spinor(1:length,1:3,1:4,2,2:4) ...
                            +  VAR.Sequence_Bilinear_Spinor(1:length,1:3,1:4,3,2:4) ...
                            +  VAR.Sequence_Bilinear_Spinor(1:length,1:3,1:4,4,2:4));
 
            ringSampleRatio = 3;
            ringSamples     = ringSampleRatio*(1:fix(length/ringSampleRatio));            
            orbit           = orbitAll(ringSamples,1:3,1:4,1:3);
            
            meshSampleRatio = 6;
            meshSamples     = meshSampleRatio*(1:fix(length/meshSampleRatio));            
            meshes          = orbitAll(meshSamples,1:3,1:4,1:3);
            
            coneSamples     = 4;
            makeCone        = (0:coneSamples)/coneSamples;


    end
        
        set(GUI.handles.uipanel_Individual_Spinors1,'Title',fermion_name(1));
        set(GUI.handles.uipanel_Individual_Spinors2,'Title',fermion_name(2));
        set(GUI.handles.uipanel_Individual_Spinors3,'Title',fermion_name(3));

        
        
        
        
        
        
        
    if (GUI.Show_No_Spinors(1)==false || GUI.Show_No_Spinors(2)==false || GUI.Show_No_Spinors(3)==false)

        
        for particle = 1:3
            
            
            
            lineWidth  = [3,3,3];
            lineStyle  = ['-','-','-']; % for
            generation = VAR.Field_generation(particle);
            spinText   = ['x','y','z'];
            textV      =  1.25;
            
            if GUI.Show_Spinor_choice == 2
                Spin_text = 'S';
                Size_text = 12;
                Spin_sign = [ 1, 1, 1, 1];
            else
                Spin_text = '';
                Size_text = 15;
                Spin_sign = [-1,-1, 1, 1];
            end
                
           
            for spinor = 1:4
                
                axes(GUI.handles_Spinor_Axes( 4*(particle-1)+spinor ));
                
                              
                cla
                set(gca,'xdir','normal');
                set(gca,'ydir','normal');
                set(gca,'zdir','normal');

                scale = get(GUI.handles.slider_Visualization_Scale2,'Value'); %1.4;
                axis([-scale +scale -scale +scale -scale +scale])
                phi = get(GUI.handles.slider_Visualization_Angle2,'Value');
                view(-phi,16), grid on
                hold on
                
                if  (GUI.Show_No_Spinors(particle)==false)
                    for gen = 1:3
                        spin_x = mat(particle,spinor,gen+1,3)*Spin_sign(spinor);
                        spin_y = mat(particle,spinor,gen+1,4)*Spin_sign(spinor);
                        spin_z = mat(particle,spinor,gen+1,2)*Spin_sign(spinor);
                        plot3([0,spin_x], [0,spin_y], [0,spin_z],'Color',col(gen),'LineWidth', lineWidth(particle),'LineStyle',lineStyle(particle));
                        
                        text_x = textV*min(scale,max(-scale,spin_x));
                        text_y = textV*min(scale,max(-scale,spin_y));
                        text_z = textV*min(scale,max(-scale,spin_z));                       
                        font_scale = min(5/3,max(abs( [1,spin_x/text_x,spin_y/text_y,spin_z/text_z] )));
                        text(text_x,text_y,text_z,[Spin_text,spinText(gen)],'FontSize',Size_text*font_scale,'HorizontalAlignment','center');
                    end
                    if GUI.Show_Spinor_Current(particle)
                        total_x = (mat(particle,spinor,2,3) + mat(particle,spinor,3,3) + mat(particle,spinor,4,3))*Spin_sign(spinor);
                        total_y = (mat(particle,spinor,2,4) + mat(particle,spinor,3,4) + mat(particle,spinor,4,4))*Spin_sign(spinor);
                        total_z = (mat(particle,spinor,2,2) + mat(particle,spinor,3,2) + mat(particle,spinor,4,2))*Spin_sign(spinor);
                        plot3([0, total_x], [0, total_y], [0, total_z],  'Color','k','LineWidth', 3,'LineStyle','-');
                        
                        orbit_x = squeeze(orbit(:,particle,spinor,2))*Spin_sign(spinor);
                        orbit_y = squeeze(orbit(:,particle,spinor,3))*Spin_sign(spinor);
                        orbit_z = squeeze(orbit(:,particle,spinor,1))*Spin_sign(spinor);
                        plot3(orbit_x, orbit_y, orbit_z,  'Color','k','LineWidth', 1.5,'LineStyle','-');
                        
                        text_x = textV*min(scale,max(-scale,total_x));
                        text_y = textV*min(scale,max(-scale,total_y));
                        text_z = textV*min(scale,max(-scale,total_z)); 
                        font_scale = min(5/3,max(abs( [1,total_x/text_x,total_y/text_y,total_z/text_z] )));
                        text(text_x,text_y,text_z,'S','FontSize',12*font_scale,'HorizontalAlignment','center');
                    end
                    if GUI.Show_Spinor_Meshes(particle)
                        meshX    = kron( makeCone, squeeze(meshes(:,particle,spinor,2)))*Spin_sign(spinor);
                        meshY    = kron( makeCone, squeeze(meshes(:,particle,spinor,3)))*Spin_sign(spinor);
                        meshZ    = kron( makeCone, squeeze(meshes(:,particle,spinor,1)))*Spin_sign(spinor);
                        mesh(meshX, meshY, meshZ, 'FaceAlpha', 0.00,  'EdgeColor',col(generation), 'LineWidth', 0.1, 'LineStyle',':');
                    end
                    
                end
            end  % for spinor
            
            set(GUI.handles_Z_charge_Values(particle),       'String',num2str(VAR.EW_Charges(1,1,particle),'%5.4f'));
            set(GUI.handles_A_charge_Values(particle),       'String',num2str(VAR.EW_Charges(2,1,particle),'%5.4f'));
            set(GUI.handles_W1charge_Values(particle),       'String',num2str(VAR.EW_Charges(3,1,particle),'%5.4f'));
            set(GUI.handles_W2charge_Values(particle),       'String',num2str(VAR.EW_Charges(4,1,particle),'%5.4f'));
 
            set(GUI.handles_Z_charge_VectorValues(particle), 'String',num2str(VAR.EW_Charges(1,2,particle),'%5.4f'));
            set(GUI.handles_A_charge_VectorValues(particle), 'String',num2str(VAR.EW_Charges(2,2,particle),'%5.4f'));
            set(GUI.handles_W1charge_VectorValues(particle), 'String',num2str(VAR.EW_Charges(3,2,particle),'%5.4f'));
            set(GUI.handles_W2charge_VectorValues(particle), 'String',num2str(VAR.EW_Charges(4,2,particle),'%5.4f'));
            
            set(GUI.handles_Z_charge_AxialValues(particle),  'String',num2str(VAR.EW_Charges(1,3,particle),'%5.4f'));
            set(GUI.handles_A_charge_AxialValues(particle),  'String',num2str(VAR.EW_Charges(2,3,particle),'%5.4f'));
            set(GUI.handles_W1charge_AxialValues(particle),  'String',num2str(VAR.EW_Charges(3,3,particle),'%5.4f'));
            set(GUI.handles_W2charge_AxialValues(particle),  'String',num2str(VAR.EW_Charges(4,3,particle),'%5.4f'));
            
        end  % for particle
        
 
    end  % if ~show zero
    
    if VAR.Decompose_Generator == true
        set(GUI.handles.pushbutton_Decompose_Generator,'BackgroundColor',[1.0,0.6,0.6])
    else
        set(GUI.handles.pushbutton_Decompose_Generator,'BackgroundColor',[0.9,0.9,0.9])
    end
    
end
  