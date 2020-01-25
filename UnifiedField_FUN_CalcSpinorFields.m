function VAR = UnifiedField_FUN_CalcSpinorFields(mode,VAR,GEN,entry)
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

field1  = squeeze(Operator(1,1:16,1:16)) * reshape(VAR.Field_in(1,1:16,1),16,1); 
field2  = squeeze(Operator(2,1:16,1:16)) * reshape(VAR.Field_in(2,1:16,1),16,1);
field3  = squeeze(Operator(3,1:16,1:16)) * reshape(VAR.Field_in(3,1:16,1),16,1);

if  mode == 1   
   VAR.Bilinear_Spinor_Matrix(1,:,:,:)  = UnifiedField_FUN_Calc_4x4_BilinearSpinor( field1, GEN);
   VAR.Bilinear_Spinor_Matrix(2,:,:,:)  = UnifiedField_FUN_Calc_4x4_BilinearSpinor( field2, GEN);
   VAR.Bilinear_Spinor_Matrix(3,:,:,:)  = UnifiedField_FUN_Calc_4x4_BilinearSpinor( field3, GEN);
else
   VAR.Sequence_Bilinear_Spinor(entry,1,:,:,:)  = UnifiedField_FUN_Calc_4x4_BilinearSpinor( field1, GEN);
   VAR.Sequence_Bilinear_Spinor(entry,2,:,:,:)  = UnifiedField_FUN_Calc_4x4_BilinearSpinor( field2, GEN);
   VAR.Sequence_Bilinear_Spinor(entry,3,:,:,:)  = UnifiedField_FUN_Calc_4x4_BilinearSpinor( field3, GEN);
end    



end

