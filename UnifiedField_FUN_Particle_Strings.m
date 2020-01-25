function [ fermion_name, index_name, particle_char ] = UnifiedField_FUN_Particle_Strings(VAR,GUI)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_FUN_Particle_Strings
%
% Display visualizations
%  
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    fermion_menu1   = get(GUI.handles.popupmenu_Select_Fermion_Field_Type1,'String'); 
    fermion_menu2   = get(GUI.handles.popupmenu_Select_Fermion_Field_Type2,'String'); 
    fermion_menu3   = get(GUI.handles.popupmenu_Select_Fermion_Field_Type3,'String'); 
        
    fermion_name(1) = fermion_menu1(GUI.Fermion_Type_choice(1));
    fermion_name(2) = fermion_menu2(GUI.Fermion_Type_choice(2));
    fermion_name(3) = fermion_menu3(GUI.Fermion_Type_choice(3));
 
    for field_nr = 1:3
      if VAR.Fermion_Pseu_choice(field_nr) == -1 
          fermion_name(field_nr) = strcat(' pseudo',fermion_name(field_nr));
      end
    end

    
    for field_nr = 1:3
      if VAR.Fermion_Pinv_choice(field_nr) == -1 
          fermion_name(field_nr) = strcat('P',fermion_name(field_nr));
      end
    end
    
    for field_nr = 1:3
      if VAR.Fermion_Tinv_choice(field_nr) == -1 
          fermion_name(field_nr) = strcat('T',fermion_name(field_nr));
      end
    end

    for field_nr = 1:3
      if VAR.Fermion_Anti_choice(field_nr) == -1 
          fermion_name(field_nr) = strcat('C',fermion_name(field_nr));
      end
    end
    
    for field_nr = 1:3
      if VAR.Fermion_Ninv_choice(field_nr) == -1 
          fermion_name(field_nr) = strcat('N',fermion_name(field_nr));
      end
    end
    
    
    particle_char   = [get(GUI.handles.text_Circle_1,'String'), ...
                       get(GUI.handles.text_Circle_2,'String'), ...
                       get(GUI.handles.text_Circle_3,'String'),''];
    
                 
    index_name = ['0o';'0x';'0y';'0z';'1o';'1x';'1y';'1z';'2o';'2x';'2y';'2z';'3o';'3x';'3y';'3z'];

end

