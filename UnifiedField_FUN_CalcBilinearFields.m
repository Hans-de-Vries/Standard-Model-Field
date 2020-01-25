function VAR = UnifiedField_FUN_CalcBilinearFields(mode,VAR,GEN,entry)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_GUI_CalcFields()
%
% Calculate all fields from the input and sequence data
% 
% mode 1: Used to show new input dat
% mode 2: Used to show the Sequence
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


if  mode == 1   
    Operator = VAR.Generator;
else
    Operator = squeeze(VAR.Sequence_Operators(entry,1:3,1:16,1:16));
end    


Field_out(1,:,1)               = squeeze(Operator(1,1:16,1:16)) * reshape(VAR.Field_in(1,1:16,1),16,1); 
Field_out(2,:,1)               = squeeze(Operator(2,1:16,1:16)) * reshape(VAR.Field_in(2,1:16,1),16,1);
Field_out(3,:,1)               = squeeze(Operator(3,1:16,1:16)) * reshape(VAR.Field_in(3,1:16,1),16,1);

if  mode == 1   
    VAR.Field_out(1,:,1)  = Field_out(1,:,1);                     
    VAR.Field_out(2,:,1)  = Field_out(2,:,1);                     
    VAR.Field_out(3,:,1)  = Field_out(3,:,1); 
else
    VAR.Sequence_Fields(entry,1,:,1) = Field_out(1,:,1);
    VAR.Sequence_Fields(entry,2,:,1) = Field_out(2,:,1);
    VAR.Sequence_Fields(entry,3,:,1) = Field_out(3,:,1);
end    


symmetric = true;

for bilinear_nr = 1:3
    
    switch VAR.Bilinear_Construction_Choice(bilinear_nr)
        case 1
            fieldLS  = Field_out(VAR.Bilinear_Input_Fields_choice(bilinear_nr,1),:,1);
            fieldRS  = Field_out(VAR.Bilinear_Input_Fields_choice(bilinear_nr,2),:,1);
        case 2
            fieldLS  = (Field_out(1,:,1) + Field_out(2,:,1));
            fieldRS  = (Field_out(1,:,1) + Field_out(2,:,1));
        case 3
            fieldLS  = (Field_out(2,:,1) + Field_out(3,:,1));
            fieldRS  = (Field_out(2,:,1) + Field_out(3,:,1));
        case 4
            fieldLS  = (Field_out(3,:,1) + Field_out(1,:,1));
            fieldRS  = (Field_out(3,:,1) + Field_out(1,:,1));
        case 5
            fieldLS  = Field_out(1,:,1);
            fieldRS  = Field_out(2,:,1);
        case 6
            fieldLS  = Field_out(2,:,1);
            fieldRS  = Field_out(3,:,1);
        case 7
            fieldLS  = Field_out(3,:,1);
            fieldRS  = Field_out(1,:,1);
    end
    
    
    if  mode == 1
        switch VAR.Bilinear_Construction_Choice(bilinear_nr)
            case {1,2,3,4}
                VAR.Bilinear_Field_Matrix(bilinear_nr,:,:) = UnifiedField_FUN_Calc16x16_BilinearField( fieldLS, fieldRS, symmetric, GEN);
            case {5,6,7}
                VAR.Bilinear_Field_Matrix(bilinear_nr,:,:) = UnifiedField_FUN_Calc16x16_BilinearField( fieldLS, fieldRS, symmetric, GEN);
                                                           + UnifiedField_FUN_Calc16x16_BilinearField( fieldRS, fieldLS, symmetric, GEN);
        end
    else
        switch VAR.Bilinear_Construction_Choice(bilinear_nr)
            case {1,2,3,4}
                VAR.Sequence_Bilinear_Field(entry,bilinear_nr,:,:) = UnifiedField_FUN_Calc16x16_BilinearField( fieldLS, fieldRS, symmetric, GEN);
            case {5,6,7}
                VAR.Sequence_Bilinear_Field(entry,bilinear_nr,:,:) = UnifiedField_FUN_Calc16x16_BilinearField( fieldLS, fieldRS, symmetric, GEN);
                                                                   + UnifiedField_FUN_Calc16x16_BilinearField( fieldRS, fieldLS, symmetric, GEN);
        end
    end
    
end

end

