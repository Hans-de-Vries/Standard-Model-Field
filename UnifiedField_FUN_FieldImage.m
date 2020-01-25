        
function  [field_Image,field_hi_index,field_lo_index] = UnifiedField_FUN_FieldImage(VAR,IMG,particle_nr)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_GUI_Show_Fields
%
% Display visualizations
%  
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if VAR.Generator_Select(particle_nr) == 0
    
    if VAR.Generator_Potential_or_Force(particle_nr) == 1
               
        switch VAR.Poincare_Generator_index(particle_nr)
            case {0,4,8,12}
                field_hi_index = 'o';
            case {1,5,9,13}
                field_hi_index = 'x';
            case {2,6,10,14}
                field_hi_index = 'y';
            case {3,7,11,15}
                field_hi_index = 'z';
        end
        
         switch VAR.Internal_Generator_index(particle_nr)
            case {0,1,2,3}
                field_Image = IMG.Z_image;
                field_lo_index = '';
            case {4,5,6,7}
                field_Image = IMG.A_image;
                field_lo_index = '';
            case {8,9,10,11}
                field_Image = IMG.W_image;
                field_lo_index = '1';
            case {12,13,14,15}
                field_Image = IMG.W_image;
                field_lo_index = '2';
        end
        
    else
        
        switch VAR.Internal_Generator_index(particle_nr)
            case {0,1,2,3}
                field_lo_index = 'Z';
            case {4,5,6,7}
                field_lo_index = 'A';
            case {8,9,10,11}
                field_lo_index = 'W1';
            case {12,13,14,15}
                field_lo_index = 'W2';
        end
        
        switch VAR.Internal_Generator_index(particle_nr)
            case {0,1,2,3}
                
                switch VAR.Poincare_Generator_index(particle_nr)
                    case 1
                        field_Image = IMG.E_image;
                        field_hi_index = 'x';
                    case 2
                        field_Image = IMG.E_image;
                        field_hi_index = 'y';
                    case 3
                        field_Image = IMG.E_image;
                        field_hi_index = 'z';
                    case 5
                        field_Image = IMG.B_image;
                        field_hi_index = 'x';
                    case 6
                        field_Image = IMG.B_image;
                        field_hi_index = 'y';
                    case 7
                        field_Image = IMG.B_image;
                        field_hi_index = 'z';
                    otherwise
                        field_Image = IMG.No_image;
                        field_hi_index = '';
                        field_lo_index = '';
                end
                
            case {4,5,6,7,8,9,10,11,12,13,14}
                
                switch VAR.Poincare_Generator_index(particle_nr)
                    case 1
                        field_Image = IMG.B_image;
                        field_hi_index = 'x';
                    case 2
                        field_Image = IMG.B_image;
                        field_hi_index = 'y';
                    case 3
                        field_Image = IMG.B_image;
                        field_hi_index = 'z';
                    case 5
                        field_Image = IMG.E_image;
                        field_hi_index = 'x';
                    case 6
                        field_Image = IMG.E_image;
                        field_hi_index = 'y';
                    case 7
                        field_Image = IMG.E_image;
                        field_hi_index = 'z';
                    otherwise
                        field_Image = IMG.No_image;
                        field_hi_index = '';
                        field_lo_index = '';
                end
                
        end
        
        
    end
    
else
    field_Image = IMG.No_image;
    field_hi_index = '';
    field_lo_index = '';
    
end