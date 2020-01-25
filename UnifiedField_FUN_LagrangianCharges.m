function VAR = UnifiedField_FUN_LagrangianCharges(VAR,GEN)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_FUN_LagrangianCharge
%
% Read the various charges of the fermion rest field from the Bilinear matrix
%  
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%



for particle_nr = 1:3
    
    field      =  VAR.Field_rest(particle_nr,1:16,1);
    generation =  VAR.Field_generation(particle_nr);
    
    InternalGenerator  = GEN.I0o * field( 1)  ...
                       + GEN.I0x * field( 2)  ...  
                       + GEN.I0y * field( 3)  ...  
                       + GEN.I0z * field( 4)  ...  
                       + GEN.I1o * field( 5)  ...
                       + GEN.I1x * field( 6)  ...  
                       + GEN.I1y * field( 7)  ...  
                       + GEN.I1z * field( 8)  ...
                       + GEN.I2o * field( 9)  ...
                       + GEN.I2x * field(10)  ...  
                       + GEN.I2y * field(11)  ...  
                       + GEN.I2z * field(12)  ...
                       + GEN.I3o * field(13)  ...
                       + GEN.I3x * field(14)  ...  
                       + GEN.I3y * field(15)  ...  
                       + GEN.I3z * field(16);

               
               
    PoincareGenerator  = GEN.J0o * field( 1)  ...
                       + GEN.J0x * field( 2)  ...  
                       + GEN.J0y * field( 3)  ...  
                       + GEN.J0z * field( 4)  ...  
                       + GEN.J1o * field( 5)  ...
                       + GEN.J1x * field( 6)  ...  
                       + GEN.J1y * field( 7)  ...  
                       + GEN.J1z * field( 8)  ...
                       + GEN.J2o * field( 9)  ...
                       + GEN.J2x * field(10)  ...  
                       + GEN.J2y * field(11)  ...  
                       + GEN.J2z * field(12)  ...
                       + GEN.J3o * field(13)  ...
                       + GEN.J3x * field(14)  ...  
                       + GEN.J3y * field(15)  ...  
                       + GEN.J3z * field(16);  
               
    Bilinear_matrix    = round(InternalGenerator * PoincareGenerator/4, 4);        
    
    VAR.EW_Charges(1,1,particle_nr) = Bilinear_matrix( 1  + generation, 1+generation);
    VAR.EW_Charges(2,1,particle_nr) = Bilinear_matrix( 5  + generation, 1);
    VAR.EW_Charges(3,1,particle_nr) = Bilinear_matrix( 9  + generation, 1);
    VAR.EW_Charges(4,1,particle_nr) = Bilinear_matrix(13  + generation, 1);
    
    VAR.EW_Charges(1,2,particle_nr) = Bilinear_matrix( 1  + generation, 5);
    VAR.EW_Charges(2,2,particle_nr) = Bilinear_matrix( 5  + generation, 1);
    VAR.EW_Charges(3,2,particle_nr) = Bilinear_matrix( 9  + generation, 1);
    VAR.EW_Charges(4,2,particle_nr) = Bilinear_matrix(13  + generation, 1);

    VAR.EW_Charges(1,3,particle_nr) = Bilinear_matrix( 1  + generation, 1+generation);
    VAR.EW_Charges(2,3,particle_nr) = Bilinear_matrix( 5  + generation, 5+generation);
    VAR.EW_Charges(3,3,particle_nr) = Bilinear_matrix( 9  + generation, 5+generation);
    VAR.EW_Charges(4,3,particle_nr) = Bilinear_matrix(13  + generation, 5+generation);
    

       
end % for particle_nr


end

