        
function  decomposed_generator = UnifiedField_FUN_DecomposeGenerator(GEN,generator)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_GUI_Show_Fields
%
% Display visualizations
%  
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

decomposed_generator = zeros(16,16);

for Poincare = 0:15
    Poincare_generator = UnifiedField_FUN_16x16_Generator(1,Poincare,1,GEN);
    
    for Internal = 0:15;
        
        Internal_generator = UnifiedField_FUN_16x16_Generator(2,Internal,1,GEN);
        
        decomposed_generator(Internal+1,Poincare+1) = sum(sum(((Poincare_generator * Internal_generator).*generator/16)));
    end
end
   
