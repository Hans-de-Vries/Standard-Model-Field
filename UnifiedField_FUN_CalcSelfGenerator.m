function self_generator = UnifiedField_FUN_CalcSelfGenerator(VAR,GEN,particle_nr)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_FUN_CalcGenerator()
%
% Calculate the generator
%  
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


field        =  squeeze(VAR.Field_in(VAR.Generator_FieldNr(particle_nr),:,1));    


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


bilinear =  InternalGenerator*PoincareGenerator/4;

scalar1  =  bilinear(5,13);
scalar2  =  bilinear(9,13);
pseudo   =  bilinear(13,9);
       
self_generator = -scalar1 * GEN.I1o - scalar2 * GEN.I2o + pseudo * GEN.I3o * GEN.J1o;  
        
        
end

 