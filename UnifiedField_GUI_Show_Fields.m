function  UnifiedField_GUI_Show_Fields(VAR,GUI,GEN,IMG,mode,particle_nr,bilinear_nr,particle_char,index_name)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_GUI_Show_Fields
%
% Display visualizations
%  
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %-----------------------------------------------------------------------------------------------
    % Locally repeated definitions
    %-----------------------------------------------------------------------------------------------
        
    entry               = VAR.Sequence_Entry;
    generator_nr        = particle_nr;
    particle_background = squeeze(IMG.color(2+particle_nr,1:3));  

    %-----------------------------------------------------------------------------------------------
    % Visualize Generator or Operator field data
    %-----------------------------------------------------------------------------------------------
 
    if GUI.signal_GUI_data_input_event    == true

        
    summed_generators = sum(squeeze(GUI.Sum_Generators(particle_nr,1:3)));    
    
    
    if summed_generators == 1
        
        generator_nr = find(squeeze(  GUI.Sum_Generators(particle_nr,1:3)) );
        
        Hi_indices      = get(GUI.handles_GenSymbol_Hi_Indices(generator_nr), 'String');
        Lo_indices      = get(GUI.handles_GenSymbol_Lo_Indices(generator_nr), 'String');
        
        Hi_index_pos    = get(GUI.handles_GenSymbol_Hi_Indices(generator_nr), 'Position');
        Lo_index_pos    = get(GUI.handles_GenSymbol_Lo_Indices(generator_nr), 'Position');
        
        Field_Hi_index_pos    = get(GUI.handles.text_Sigma_Poincare_Indices, 'Position');
        Field_Lo_index_pos    = get(GUI.handles.text_Sigma_Internal_Indices, 'Position');
        
        Field_Hi_index_pos(3) = Hi_index_pos(3);
        Field_Lo_index_pos(3) = Lo_index_pos(3);
        
        set(GUI.handles.text_Sigma_Poincare_Indices,  'Position', Field_Hi_index_pos);
        set(GUI.handles.text_Sigma_Internal_Indices,  'Position', Field_Lo_index_pos);
        
        set(GUI.handles.text_Sigma_Poincare_Indices,    'String', Hi_indices);
        set(GUI.handles.text_Sigma_Internal_Indices,    'String', Lo_indices);
        
    elseif summed_generators == 0
        
        set(GUI.handles.text_Sigma_Poincare_Indices,    'String', '');
        set(GUI.handles.text_Sigma_Internal_Indices,    'String', '');
        
    else
        
        Field_Hi_index_pos    = get(GUI.handles.text_Sigma_Poincare_Indices, 'Position');       
        Field_Hi_index_pos(3) = 36;
        
        summed_generators_indices = '';
        for gen = 1:3
            if GUI.Sum_Generators(particle_nr,gen)
                summed_generators_indices = strcat(summed_generators_indices,num2str(gen));
            end
        end 
        
        set(GUI.handles.text_Sigma_Poincare_Indices,  'Position', Field_Hi_index_pos);
        set(GUI.handles.text_Sigma_Poincare_Indices,    'String', summed_generators_indices);
        set(GUI.handles.text_Sigma_Internal_Indices,    'String', '');

    end
    
    
    

    set(GUI.handles.pushbutton_Select_Fermion_LS,   'String', num2str(GUI.Bilinear_Input_Fields_choice(bilinear_nr,1)));
    set(GUI.handles.pushbutton_Select_Fermion_RS,   'String', num2str(GUI.Bilinear_Input_Fields_choice(bilinear_nr,2)));

    if VAR.Generator_NillPotent(particle_nr) == true
        set(GUI.handles.text_Matrix_Proporty,           'String', 'The Generator is Nill Potent');
    elseif VAR.Generator_Symmetric(particle_nr) == true
        set(GUI.handles.text_Matrix_Proporty,           'String', 'The Generator is Symmetric');
    elseif VAR.Generator_Antisymmetric(particle_nr) == true
        set(GUI.handles.text_Matrix_Proporty,           'String', 'The Generator is Antisymmetric');
    elseif VAR.Generator_Cyclic(particle_nr) == true
        set(GUI.handles.text_Matrix_Proporty,           'String', 'The Generator is sqrt(-aI) but not Antisymmetric');
    else
        set(GUI.handles.text_Matrix_Proporty,           'String', '');
    end

    
    particle_background = squeeze(IMG.color(2+particle_nr,1:3));  
     
    set(GUI.handles.uitable_Operator_Field_Matrix,  'BackgroundColor',[([3 3 3]+particle_background)/4;particle_background]);
    set(GUI.handles.uipanel_Unified_Field_Data,     'BackgroundColor',particle_background );
    set(GUI.handles.text_exp,                       'BackgroundColor',particle_background );
    set(GUI.handles.text_bracket_open,              'BackgroundColor',particle_background );
    set(GUI.handles.text_bracket_close,             'BackgroundColor',particle_background );
   %set(GUI.handles.text_Generator_Coordinate,      'BackgroundColor',particle_background );
    set(GUI.handles.text_Exp_Coefficient,           'BackgroundColor',particle_background );
    set(GUI.handles.text_Sigma_Poincare_Indices,    'BackgroundColor',particle_background );
    set(GUI.handles.text_Sigma_Internal_Indices,    'BackgroundColor',particle_background );
    set(GUI.handles.text_Operator_Field_Matrix,     'BackgroundColor',particle_background );
    set(GUI.handles.text_Matrix_Proporty,           'BackgroundColor',particle_background );
    set(GUI.handles.text_Field_in,                  'BackgroundColor',particle_background );
    set(GUI.handles.text_Field_out,                 'BackgroundColor',particle_background );
    set(GUI.handles.text_X,                         'BackgroundColor',particle_background );
    set(GUI.handles.text_is,                        'BackgroundColor',particle_background );
    set(GUI.handles.text_RightArrow,                'BackgroundColor',particle_background );

    
    
    switch summed_generators
        
        case 0
            generator_image = IMG.No_image;
            pre_gener_image = IMG.No_image;
            
        case 1
            
            switch VAR.Generator_Select(generator_nr)
                
                case 0
                    [field_Image,~,~] = UnifiedField_FUN_FieldImage(VAR,IMG,generator_nr);
                    generator_image = field_Image;
                    pre_gener_image = IMG.gamma0_image;
                case 1
                    generator_image = IMG.sigma_image;
                    pre_gener_image = IMG.No_image;
                case 2
                    generator_image = IMG.Higgs_image;
                    pre_gener_image = IMG.gamma0_image;
                case 3
                    generator_image = IMG.checkOmega_image;
                    pre_gener_image = IMG.No_image;
                case 4
                    generator_image = IMG.hatOmega_image;
                    pre_gener_image = IMG.No_image;
                case 5
                    generator_image = IMG.tildeOmega_image;
                    pre_gener_image = IMG.No_image;
                case 6
                    generator_image = IMG.checkPsi_image;
                    pre_gener_image = IMG.No_image;
                case 7
                    generator_image = IMG.hatPsi_image;
                     pre_gener_image = IMG.No_image;
               case 8
                    generator_image = IMG.selfMass_image;
                    pre_gener_image = IMG.No_image;
                case 9
                   %generator_image = IMG.bilinPsi_image;
            end
            
        otherwise
            generator_image = IMG.SUM_image;
            pre_gener_image = IMG.No_image;
    end

    
    dims = size(generator_image);
    axes(GUI.handles.axes_Generator_Image)
    imagesc(uint8(double(generator_image) .* reshape( repmat( particle_background, dims(1)*dims(2), 1), dims) ))
    set(GUI.handles.axes_Generator_Image,'XColor','none')
    set(GUI.handles.axes_Generator_Image,'YColor','none')

    dims = size(pre_gener_image);
    axes(GUI.handles.axes_PreGenerator_Image)
    imagesc(uint8(double(pre_gener_image) .* reshape( repmat( particle_background, dims(1)*dims(2), 1), dims) ))
    set(GUI.handles.axes_PreGenerator_Image,'XColor','none')
    set(GUI.handles.axes_PreGenerator_Image,'YColor','none')

    dims = size(IMG.psi_image);
    axes(GUI.handles.axes_Psi_Image)
    imagesc(uint8(double(IMG.psi_image) .* reshape( repmat( particle_background, dims(1)*dims(2), 1), dims) ))
    set(GUI.handles.axes_Psi_Image,'XColor','none')
    set(GUI.handles.axes_Psi_Image,'YColor','none')

    end  % if GUI.signal_GUI_data_input_event    == true
    
    if  mode == 1
        
        generator = squeeze(VAR.Generator(particle_nr,1:16,1:16));
        if ~VAR.Decompose_Generator
            generator_data = round(generator,4);
        else
            decomposed_generator = UnifiedField_FUN_DecomposeGenerator(GEN,generator);
            generator_data = round(decomposed_generator,4);          
        end
        set(GUI.handles.uitable_Operator_Field_Matrix,'Data', generator_data );
        set(GUI.handles.text_Operator_Field_Matrix,'string',['Generator field matrix ', particle_char(particle_nr) ])
        set(GUI.handles.text_exp,'Visible','Off');
        set(GUI.handles.text_Exp_Coefficient,'Visible','Off');
        set(GUI.handles.text_bracket_open,'Visible','Off');
        set(GUI.handles.text_bracket_close,'Visible','Off');
        
    elseif mode == 2
 
        generator = squeeze(VAR.Sequence_Operators(entry,particle_nr,1:16,1:16));
        if ~VAR.Decompose_Generator
            generator_data = round(generator,4);
        else
            decomposed_generator = UnifiedField_FUN_DecomposeGenerator(GEN,generator);
            generator_data = round(decomposed_generator,4);         
        end
        set(GUI.handles.uitable_Operator_Field_Matrix,'Data', generator_data );
        set(GUI.handles.text_Operator_Field_Matrix,'string',['Operator field matrix ', particle_char(particle_nr) ])
        set(GUI.handles.text_exp,'Visible','On');
        set(GUI.handles.text_Exp_Coefficient,'Visible','On');
        set(GUI.handles.text_bracket_open,'Visible','On');
        set(GUI.handles.text_bracket_close,'Visible','On');
        set(GUI.handles.text_Exp_Coefficient,'String',num2str(VAR.Sequence_Operator_Coefficient(entry)));
        
    end

    if VAR.Decompose_Generator
        row_Name    =  get(GUI.handles.uitable_Bilinear_Field_Matrix,'RowName');
        if VAR.Generator_Select(particle_nr) >= 1
        column_Name = {'Mass';'magn x';'magn y';'magn z';'pseudo';'polar x';'polar y';'polar z';'axial o';'vector x';'vector y';'vector z';'vector o';'axial x';'axial y';'axial z'};
        else
        column_Name = {'vector o';'axial x';'axial y';'axial z';'axial o';'vector x';'vector y';'vector z';'-pseudo';'-polar x';'-polar y';'-polar z';'-Mass';'-magn x';'-magn y';'-magn z'};
        end
    else
        row_Name = {'0o';'0x';'0y';'0z';'1o';'1x';'1y';'1z';'2o';'2x';'2y';'-2z';'3o';'3x';'3y';'3z'};
        column_Name = row_Name;
    end
    set(GUI.handles.uitable_Operator_Field_Matrix,'ColumnName',column_Name);
    set(GUI.handles.uitable_Operator_Field_Matrix,'RowName',   row_Name   );

    
    %-----------------------------------------------------------------------------------------------
    % Visualize Input Field
    %-----------------------------------------------------------------------------------------------
    
    set(GUI.handles.uitable_Field_in,'Data', round(reshape(VAR.Field_in(particle_nr,1:16,1),16,1),4) );
    
    set(GUI.handles.uitable_Field_in,'BackgroundColor',[([3 3 3]+particle_background)/4;particle_background]);
     
    set(GUI.handles.text_Field_in,'String',['Field in ',particle_char(particle_nr)])
    
    %-----------------------------------------------------------------------------------------------
    % Visualize Output Field
    %-----------------------------------------------------------------------------------------------
    
    if     mode == 1
           set(GUI.handles.uitable_Field_out,'Data', round(reshape(VAR.Field_out(particle_nr,1:16,1),16,1),4) );
    elseif mode == 2
           set(GUI.handles.uitable_Field_out,'Data', round(reshape(VAR.Sequence_Fields(entry,particle_nr,1:16,1),16,1),4) );
    end
    
    set(GUI.handles.uitable_Field_out,'BackgroundColor',[([3 3 3]+particle_background)/4;particle_background]);
    set(GUI.handles.text_Field_out,'String',['Field out ',particle_char(particle_nr)])
     
    
end

