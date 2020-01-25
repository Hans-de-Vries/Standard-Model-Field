function UnifiedField_GUI_Show_Particle_Definitions(VAR,GUI,IMG,fermion_name,index_name)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_GUI_Show_Particle_Definitions
%
% Display visualizations
%  
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


if GUI.signal_GUI_data_input_event    == true
    
    %-----------------------------------------------------------------------------------------------
    % Fill the Lagrangian coupling text fields
    %-----------------------------------------------------------------------------------------------
    
    set(GUI.handles.uipanel_Field1_Selections,'Title',strcat('Particle 1: ',fermion_name(1)) );
    set(GUI.handles.uipanel_Field2_Selections,'Title',strcat('Particle 2: ',fermion_name(2)) );
    set(GUI.handles.uipanel_Field3_Selections,'Title',strcat('Particle 3: ',fermion_name(3)) );
           

        
    % ==================================================================================================
    %  Apply images for GUI initializatiom: Generator Image
    % ==================================================================================================


    for particle_nr = 1:3
        
        set(GUI.handles_Lagrangian_Coupling(particle_nr), 'String', strcat('=',num2str( round(VAR.Lagrangian_Coupling_Sum(particle_nr),4),'%5.4f' )) )
        
        if GUI.Generator_ChargeSign(particle_nr) == 1
           text_ChargeSign = '+';
        else
           text_ChargeSign = '-';
        end
        switch GUI.Generator_ChargeValue(particle_nr) 
            case 0
                text_ChargeValue  = ['0',text_ChargeSign];
                text_width_Charge = 24.0;
            case 1
                text_ChargeValue  = ['1/3',text_ChargeSign];
                text_width_Charge = 38.0;
            case 2
                text_ChargeValue  = ['2/3',text_ChargeSign];
                text_width_Charge = 38.0;
            case 3
                text_ChargeValue  = ['1',text_ChargeSign];
                text_width_Charge = 24.0;
        end
        if GUI.Generator_LorR(particle_nr) == +1
            text_LorR = 'L';
        else
            text_LorR = 'R';
        end
        
        switch GUI.Generator_Generation(particle_nr) 
            case 0
                text_Generation  = '';
                text_width_Gen   = 16.0;
            case 1
                text_Generation  = '1';
                text_width_Gen   = 27.0;
            case 2
                text_Generation  = '2';
                text_width_Gen   = 27.0;
            case 3
                text_Generation  = '3';
                text_width_Gen   = 27.0;
        end
      %text_Generation = num2str(GUI.Generator_Generation(particle_nr));
      
      
            
        
        Hi_index_pos = get(GUI.handles_GenSymbol_Hi_Indices(particle_nr), 'Position');
        Lo_index_pos = get(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'Position');
              
        switch VAR.Generator_Select(particle_nr)
            
            case 0
                
                [field_Image,field_hi_index,field_lo_index] =  UnifiedField_FUN_FieldImage(VAR,IMG,particle_nr);
                generator_image = field_Image;
                set(GUI.handles_Generator_FieldNr(particle_nr),    'Enable','off');
                set(GUI.handles_Generator_ChargeSign(particle_nr), 'Enable','off');
                set(GUI.handles_Generator_ChargeValue(particle_nr),'Enable','off');
                set(GUI.handles_Generator_Generation(particle_nr), 'Enable','off');
                set(GUI.handles_Generator_LorR(particle_nr),       'Enable','off');
                Hi_index_pos(3) = 22.4;
                set(GUI.handles_GenSymbol_Hi_Indices(particle_nr), 'Position',Hi_index_pos);
                set(GUI.handles_GenSymbol_Hi_Indices(particle_nr), 'String', field_hi_index );
                Lo_index_pos(3) = 32;
                set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'Position',Lo_index_pos);
                set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'String', field_lo_index );

            case 1
                generator_image = IMG.sigma_image;
                set(GUI.handles_Generator_FieldNr(particle_nr),    'Enable','off');
                set(GUI.handles_Generator_ChargeSign(particle_nr), 'Enable','off');
                set(GUI.handles_Generator_ChargeValue(particle_nr),'Enable','off');
                set(GUI.handles_Generator_Generation(particle_nr), 'Enable','off');
                set(GUI.handles_Generator_LorR(particle_nr),       'Enable','off');
                Hi_index_pos(3) = 22.4;
                set(GUI.handles_GenSymbol_Hi_Indices(particle_nr), 'Position',Hi_index_pos);
                set(GUI.handles_GenSymbol_Hi_Indices(particle_nr), 'String', index_name(VAR.Poincare_Generator_index(particle_nr)+1,1:2) );
                Lo_index_pos(3) = 22.4;
                set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'Position',Lo_index_pos);
                set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'String', index_name(VAR.Internal_Generator_index(particle_nr)+1,1:2) );

            case 2
                generator_image = IMG.Higgs_image;
                set(GUI.handles_Generator_FieldNr(particle_nr),    'Enable','off');
                set(GUI.handles_Generator_ChargeSign(particle_nr), 'Enable','off');
                set(GUI.handles_Generator_ChargeValue(particle_nr),'Enable','off');
                set(GUI.handles_Generator_Generation(particle_nr), 'Enable','off');
                set(GUI.handles_Generator_LorR(particle_nr),       'Enable','off');
                set(GUI.handles_GenSymbol_Hi_Indices(particle_nr), 'String', ''  );
                Lo_index_pos(3) = 40.0;
                set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'Position',Lo_index_pos);
                set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'String','iggs');
            case 3
                generator_image = IMG.checkOmega_image;
                set(GUI.handles_Generator_FieldNr(particle_nr),    'Enable','off');
                set(GUI.handles_Generator_ChargeSign(particle_nr), 'Enable','on' );
                set(GUI.handles_Generator_ChargeValue(particle_nr),'Enable','on' );
                set(GUI.handles_Generator_Generation(particle_nr), 'Enable','on' );
                set(GUI.handles_Generator_LorR(particle_nr),       'Enable','on' );
                 Hi_index_pos(3) = text_width_Gen;
                set(GUI.handles_GenSymbol_Hi_Indices(particle_nr), 'Position',Hi_index_pos);
                set(GUI.handles_GenSymbol_Hi_Indices(particle_nr), 'String',[text_LorR,text_Generation]);
                Lo_index_pos(3) = text_width_Charge;
                set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'Position',Lo_index_pos);
                set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'String', text_ChargeValue );
            case 4
                generator_image = IMG.hatOmega_image;
                set(GUI.handles_Generator_FieldNr(particle_nr),    'Enable','off');
                set(GUI.handles_Generator_ChargeSign(particle_nr), 'Enable','on' );
                set(GUI.handles_Generator_ChargeValue(particle_nr),'Enable','on' );
                set(GUI.handles_Generator_Generation(particle_nr), 'Enable','on' );
                set(GUI.handles_Generator_LorR(particle_nr),       'Enable','on' );
                Hi_index_pos(3) = text_width_Gen;
                set(GUI.handles_GenSymbol_Hi_Indices(particle_nr), 'Position',Hi_index_pos);
                set(GUI.handles_GenSymbol_Hi_Indices(particle_nr), 'String',[text_LorR,text_Generation]);
                Lo_index_pos(3) = text_width_Charge;
                set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'Position',Lo_index_pos);
                set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'String', text_ChargeValue );
            case 5
                generator_image = IMG.tildeOmega_image;
                set(GUI.handles_Generator_FieldNr(particle_nr),    'Enable','off');
                set(GUI.handles_Generator_ChargeSign(particle_nr), 'Enable','on' );
                set(GUI.handles_Generator_ChargeValue(particle_nr),'Enable','on' );
                set(GUI.handles_Generator_Generation(particle_nr), 'Enable','on' );
                set(GUI.handles_Generator_LorR(particle_nr),       'Enable','on' );
                Hi_index_pos(3) = text_width_Gen;
                set(GUI.handles_GenSymbol_Hi_Indices(particle_nr), 'Position',Hi_index_pos);
                set(GUI.handles_GenSymbol_Hi_Indices(particle_nr), 'String',text_LorR);
                Lo_index_pos(3) = text_width_Charge;
                set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'Position',Lo_index_pos);
                set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'String', text_ChargeValue );
            case 6
                generator_image = IMG.checkPsi_image;
                set(GUI.handles_Generator_FieldNr(particle_nr),    'Enable','on' );
                set(GUI.handles_Generator_ChargeSign(particle_nr), 'Enable','off');
                set(GUI.handles_Generator_ChargeValue(particle_nr),'Enable','off');
                set(GUI.handles_Generator_Generation(particle_nr), 'Enable','off');
                set(GUI.handles_Generator_LorR(particle_nr),       'Enable','off');
                set(GUI.handles_GenSymbol_Hi_Indices(particle_nr), 'String', ''  );
                Lo_index_pos(3) = 16.0;
                set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'Position',Lo_index_pos);
               %set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'String', num2str(GUI.Generator_FieldNr(particle_nr)) );
                set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'String', ''  );
             case 7
                generator_image = IMG.hatPsi_image;
                set(GUI.handles_Generator_FieldNr(particle_nr),    'Enable','on' );
                set(GUI.handles_Generator_ChargeSign(particle_nr), 'Enable','off');
                set(GUI.handles_Generator_ChargeValue(particle_nr),'Enable','off');
                set(GUI.handles_Generator_Generation(particle_nr), 'Enable','off');
                set(GUI.handles_Generator_LorR(particle_nr),       'Enable','off');
                set(GUI.handles_GenSymbol_Hi_Indices(particle_nr), 'String', ''  );
                Lo_index_pos(3) = 16.0;
                set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'Position',Lo_index_pos);
               %set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'String', num2str(GUI.Generator_FieldNr(particle_nr)) );
                set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'String', ''  );
            case 8
                generator_image = IMG.selfMass_image;
                set(GUI.handles_Generator_FieldNr(particle_nr),    'Enable','on' );
                set(GUI.handles_Generator_ChargeSign(particle_nr), 'Enable','on' );
                set(GUI.handles_Generator_ChargeValue(particle_nr),'Enable','off');
                set(GUI.handles_Generator_Generation(particle_nr), 'Enable','off');
                set(GUI.handles_Generator_LorR(particle_nr),       'Enable','off');
                set(GUI.handles_GenSymbol_Hi_Indices(particle_nr), 'String', ''  );
                Lo_index_pos(3) = 33.0;
                set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'Position',Lo_index_pos);
                set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'String','self');
            case 9
                generator_image = IMG.bilinPsi_image;
                set(GUI.handles_Generator_FieldNr(particle_nr),    'Enable','on' );
                set(GUI.handles_Generator_ChargeSign(particle_nr), 'Enable','off');
                set(GUI.handles_Generator_ChargeValue(particle_nr),'Enable','off');
                set(GUI.handles_Generator_Generation(particle_nr), 'Enable','off');
                set(GUI.handles_Generator_LorR(particle_nr),       'Enable','off');
                set(GUI.handles_GenSymbol_Hi_Indices(particle_nr), 'String', ''  );
                Lo_index_pos(3) = 16.0;
                set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'Position',Lo_index_pos);
                set(GUI.handles_GenSymbol_Lo_Indices(particle_nr), 'String', num2str(GUI.Generator_FieldNr(particle_nr)) );
        end
        
        if GUI.Generator_Shown(particle_nr) ~= GUI.Generator_Select(particle_nr)
            
            dims = size(generator_image);
            
            axes(GUI.handles_GenSymbol_Image(particle_nr))
            imagesc(uint8(double(generator_image) .* reshape( repmat( squeeze(IMG.color(particle_nr+2,1:3)), dims(1)*dims(2), 1), dims) ))
            set(GUI.handles_GenSymbol_Image(particle_nr),'XColor','none')
            set(GUI.handles_GenSymbol_Image(particle_nr),'YColor','none')
            
            GUI.Generator_Shown(particle_nr) = GUI.Generator_Select(particle_nr);
            
        end
              
        
        dims = size(IMG.lagrangian_imageP);
        
        if VAR.Generator_Select(particle_nr) == 0
            if VAR.Generator_Potential_or_Force(particle_nr) == 1
                lagrangian_image = IMG.lagrangian_imageP;
            else
                lagrangian_image = IMG.lagrangian_imageF;
            end
        elseif VAR.Generator_Select(particle_nr) == 1
            lagrangian_image = IMG.lagrangian_image;
        elseif VAR.Generator_Select(particle_nr) == 2
            lagrangian_image = IMG.lagrangian_imageM;
        else
            lagrangian_image = IMG.lagrangian_imageP;
        end
        
        axes(GUI.handles_Lagrangian_Axes(particle_nr));
        imagesc(uint8(double(lagrangian_image) .* reshape( repmat( squeeze(IMG.color(2+particle_nr,1:3)), dims(1)*dims(2), 1), dims) ))
        set(GUI.handles_Lagrangian_Axes(particle_nr),'XColor','none')
        set(GUI.handles_Lagrangian_Axes(particle_nr),'YColor','none')
        
       %set(GUI.handles_Generator_Scale(particle_nr),'String',num2str(VAR.Generator_minus(particle_nr)*VAR.Lagrangian_Coupling_Scale(particle_nr)));
        set(GUI.handles_Generator_Scale(particle_nr),'String',num2str(VAR.Lagrangian_Coupling_Scale(particle_nr),'%5.4f'));
        
    end  % for



end

