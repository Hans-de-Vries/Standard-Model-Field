function VAR = UnifiedField_FUN_CalcSequence(VAR,GEN)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_GUI_Commands()
%
% Calculate Sequence Commands
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CALCULATE LINEAR SEQUENCE  
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if VAR.Sequence_choice == 1 
    
    angle_delta  = VAR.Sequence_Angle_Delta;
    ramp_delta   = VAR.Sequence_Ramp_Delta;
    length       = VAR.Sequence_Length;    
    angle_offset = VAR.Sequence_Angle_Offset(1:3);
    
    for particle_nr  = 1:3
        VAR.Operator(particle_nr,1:16,1:16) = eye(16);
        generator = squeeze(VAR.Generator(particle_nr,1:16,1:16));
        genSquare = generator*generator;
 
        if genSquare == zeros(16)
           VAR.Generator_NillPotent(particle_nr)    = true;
           VAR.Generator_Symmetric(particle_nr)     = false;
           VAR.Generator_Antisymmetric(particle_nr) = false;
           VAR.Generator_Cyclic(particle_nr)        = false;           

        elseif generator == generator'
           VAR.Generator_NillPotent(particle_nr)    = false;
           VAR.Generator_Symmetric(particle_nr)     = true;
           VAR.Generator_Antisymmetric(particle_nr) = false;
           VAR.Generator_Cyclic(particle_nr)        = false;
           
        elseif generator == -generator'
           VAR.Generator_NillPotent(particle_nr)    = false;
           VAR.Generator_Symmetric(particle_nr)     = false;
           VAR.Generator_Antisymmetric(particle_nr) = true;
           VAR.Generator_Cyclic(particle_nr)        = true;
           
        elseif genSquare == -eye(16)*abs(genSquare(1,1)) 
           VAR.Generator_NillPotent(particle_nr)    = false;
           VAR.Generator_Symmetric(particle_nr)     = false;
           VAR.Generator_Antisymmetric(particle_nr) = false;
           VAR.Generator_Cyclic(particle_nr)        = true;
           
        else 
           VAR.Generator_NillPotent(particle_nr)    = false;
           VAR.Generator_Symmetric(particle_nr)     = false;
           VAR.Generator_Antisymmetric(particle_nr) = false;
           VAR.Generator_Cyclic(particle_nr)        = false;           
        end
        
    end
    
    for i = 1:length
        
        for particle_nr  = 1:3
                        
            if VAR.Generator_NillPotent(particle_nr) == true 
               theta = (i-1)/length;
               VAR.Operator(particle_nr,:,:) = expm( theta*squeeze(VAR.Generator(particle_nr,1:16,1:16)));
            elseif VAR.Generator_Symmetric(particle_nr) == true 
               theta = (i-1)*ramp_delta;
               VAR.Operator(particle_nr,:,:) = expm( theta*squeeze(VAR.Generator(particle_nr,1:16,1:16)));
            elseif VAR.Generator_Antisymmetric(particle_nr) == true 
               theta = (i-1)*angle_delta + angle_offset(particle_nr);
               VAR.Operator(particle_nr,:,:) = expm( theta*squeeze(VAR.Generator(particle_nr,1:16,1:16)));
            elseif VAR.Generator_Cyclic(particle_nr) == true 
               theta = (i-1)*angle_delta + angle_offset(particle_nr);
               VAR.Operator(particle_nr,:,:) = expm( theta*squeeze(VAR.Generator(particle_nr,1:16,1:16)));
            else
               theta = (i-1)*angle_delta + angle_offset(particle_nr);
               VAR.Operator(particle_nr,:,:) = expm( theta*squeeze(VAR.Generator(particle_nr,1:16,1:16)));
            end
            
            field  = squeeze(VAR.Operator(particle_nr,1:16,1:16)) * reshape(VAR.Field_in(particle_nr,1:16,1),16,1);
           
            VAR.Sequence_Fields(i,particle_nr,:,:)            = field;
            VAR.Sequence_Operators(i,particle_nr,:,:)         = VAR.Operator(particle_nr,1:16,1:16);        
            VAR.Sequence_Operator_Coefficient(i)              = theta;
            
                        
        end
        

        VAR = UnifiedField_FUN_CalcBilinearFields(2,VAR,GEN,i);
        VAR = UnifiedField_FUN_CalcSpinorFields(  2,VAR,GEN,i);

        
    end
 

end
 

% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % CALCULATE LINEAR SEQUENCE IF REQUESTED
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % 
% % % if VAR.Sequence_choice == 2 
% % %     
% % %     delta = VAR.Sequence_Delta;
% % %     unit  = eye(16);
% % %     
% % %     VAR.Operator(1,1:16,1:16) = eye(16);
% % %     VAR.Operator(2,1:16,1:16) = eye(16);
% % % 
% % %     for i = 1:VAR.Sequence_Length
% % %         
% % %         fieldLeft  = squeeze(VAR.Operator(1,1:16,1:16)) * reshape(VAR.Field_in(1,1:16,1),16,1);
% % %         fieldRight = squeeze(VAR.Operator(2,1:16,1:16)) * reshape(VAR.Field_in(2,1:16,1),16,1);
% % %         
% % %         VAR.Field_out(1,:,1) = fieldLeft;
% % %         VAR.Field_out(2,:,1) = fieldRight;
% % %         
% % %         matrixBilinearField1 = UnifiedField_FUN_Calc16x16_BilinearField( fieldLeft, fieldRight, GEN);
% % %         matrixBilinearField2 = UnifiedField_FUN_Calc16x16_BilinearField( fieldRight, fieldLeft, GEN);
% % %         matrixBilinearSpinor = UnifiedField_FUN_Calc_4x4_BilinearSpinor( fieldLeft, fieldRight, GEN);
% % %         
% % %         VAR.Operator(1,:,:)  = (unit + delta * squeeze(VAR.Generator(1,1:16,1:16))) * squeeze(VAR.Operator(1,1:16,1:16));
% % %         VAR.Operator(2,:,:)  = (unit + delta * squeeze(VAR.Generator(2,1:16,1:16))) * squeeze(VAR.Operator(2,1:16,1:16));
% % %         
% % %         VAR.Sequence_Operators(i,:,:,:)         = VAR.Operator;        
% % %         VAR.Sequence_Fields(i,:,:,:)            = VAR.Field_out;
% % %         
% % %         VAR.Sequence_Bilinear_Field(i,1,:,:)    = matrixBilinearField1;
% % %         VAR.Sequence_Bilinear_Field(i,2,:,:)    = matrixBilinearField2;
% % %         VAR.Sequence_Bilinear_Spinor(i,:,:,:,:) = matrixBilinearSpinor;
% % %         
% % %     end
% % %     
% % % end
% % %  
% % % 
% % % 
% % % 
% % % 
% % % 
% % % 
% % % 
% % % 
% % % 
% % % 
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % CALCULATE CIRCULAR SEQUENCE IF REQUESTED
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % 
% % % if VAR.Sequence_choice == 3  
% % %     
% % %    
% % %     delta = VAR.Sequence_Delta;
% % %     unit  = eye(16);
% % %     
% % %     VAR.Operator(1,1:16,1:16) = eye(16);
% % %     VAR.Operator(2,1:16,1:16) = eye(16);
% % %     
% % % 
% % %     
% % %     for i = 1:VAR.Sequence_Length
% % %         
% % %         fieldLeft  = squeeze(VAR.Operator(1,1:16,1:16)) * reshape(VAR.Field_in(1,1:16,1),16,1);
% % %         fieldRight = squeeze(VAR.Operator(2,1:16,1:16)) * reshape(VAR.Field_in(2,1:16,1),16,1);
% % %         
% % %         VAR.Field_out(1,:,1) = fieldLeft;
% % %         VAR.Field_out(2,:,1) = fieldRight;
% % %                 
% % %         matrixBilinearField1 = UnifiedField_FUN_Calc16x16_BilinearField( fieldLeft,  fieldLeft,  GEN);
% % %         matrixBilinearField2 = UnifiedField_FUN_Calc16x16_BilinearField( fieldRight, fieldRight, GEN);
% % %         matrixBilinearSpinor = UnifiedField_FUN_Calc_4x4_BilinearSpinor( fieldLeft,  fieldRight, GEN);
% % %  
% % %         angle = 2*pi*i/VAR.Sequence_Length*10;
% % % 
% % %         Cyclic_Generator1 = cos(angle)*squeeze(VAR.Generator(1,1:16,1:16)) + sin(angle)*squeeze(VAR.Generator(2,1:16,1:16));
% % %         Cyclic_Generator2 = cos(angle)*squeeze(VAR.Generator(1,1:16,1:16)) - sin(angle)*squeeze(VAR.Generator(2,1:16,1:16));
% % %               
% % %         VAR.Operator(1,:,:)  = (unit + delta * Cyclic_Generator1) * squeeze(VAR.Operator(1,1:16,1:16));
% % %         VAR.Operator(2,:,:)  = (unit + delta * Cyclic_Generator2) * squeeze(VAR.Operator(2,1:16,1:16));
% % %         
% % %         VAR.Sequence_Operators(i,:,:,:)         = VAR.Operator;        
% % %         VAR.Sequence_Fields(i,:,:,:)            = VAR.Field_out;
% % %         
% % %         VAR.Sequence_Bilinear_Field(i,1,:,:)    = matrixBilinearField1;
% % %         VAR.Sequence_Bilinear_Field(i,2,:,:)    = matrixBilinearField2;
% % %         VAR.Sequence_Bilinear_Spinor(i,:,:,:,:) = matrixBilinearSpinor;
% % %         
% % %     end  
% % %     
% % % end
% % % 
% % % 
% % % 
% % % 
% % % 
% % % 
% % % 
% % % 
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % CALCULATE CIRCULAR SEQUENCE IF REQUESTED
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % 
% % % if VAR.Sequence_choice == 4  
% % %     
% % %    
% % %     delta = VAR.Sequence_Delta;
% % %     unit  = eye(16);
% % %     angle = 2*pi/VAR.Sequence_Delta;
% % %     
% % %     VAR.Operator(1,1:16,1:16) = eye(16);
% % %     VAR.Operator(2,1:16,1:16) = eye(16);
% % %     
% % %     Cyclic_Generator1 = cos(angle)*squeeze(VAR.Generator(1,1:16,1:16)) + sin(angle)*squeeze(VAR.Generator(2,1:16,1:16));
% % %     Cyclic_Generator2 = cos(angle)*squeeze(VAR.Generator(1,1:16,1:16)) - sin(angle)*squeeze(VAR.Generator(2,1:16,1:16));
% % % 
% % %     
% % %     for i = 1:VAR.Sequence_Length
% % %         
% % %         fieldLeft  = squeeze(VAR.Operator(1,1:16,1:16)) * reshape(VAR.Field_in(1,1:16,1),16,1);
% % %         fieldRight = squeeze(VAR.Operator(2,1:16,1:16)) * reshape(VAR.Field_in(2,1:16,1),16,1);
% % %         
% % %         VAR.Field_out(1,:,1) = fieldLeft;
% % %         VAR.Field_out(2,:,1) = fieldRight;
% % %                 
% % %         matrixBilinearField1 = UnifiedField_FUN_Calc16x16_BilinearField( fieldLeft, fieldRight, GEN);
% % %         matrixBilinearField2 = UnifiedField_FUN_Calc16x16_BilinearField( fieldRight, fieldLeft, GEN);
% % %         matrixBilinearSpinor = UnifiedField_FUN_Calc_4x4_BilinearSpinor( fieldLeft, fieldRight, GEN);
% % %         
% % %         VAR.Operator(1,:,:)  = (unit + delta * Cyclic_Generator1) * squeeze(VAR.Operator(1,1:16,1:16));
% % %         VAR.Operator(2,:,:)  = (unit + delta * Cyclic_Generator2) * squeeze(VAR.Operator(2,1:16,1:16));
% % %         
% % %         VAR.Sequence_Operators(i,:,:,:)         = VAR.Operator;        
% % %         VAR.Sequence_Fields(i,:,:,:)            = VAR.Field_out;
% % %         
% % %         VAR.Sequence_Bilinear_Field(i,1,:,:)    = matrixBilinearField1;
% % %         VAR.Sequence_Bilinear_Field(i,2,:,:)    = matrixBilinearField2;
% % %         VAR.Sequence_Bilinear_Spinor(i,:,:,:,:) = matrixBilinearSpinor;
% % %         
% % %     end  
% % %     
% % % end


end

