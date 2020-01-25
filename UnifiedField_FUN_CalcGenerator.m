function VAR = UnifiedField_FUN_CalcGenerator(VAR,GEN,particle_nr)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_FUN_CalcGenerator()
%
% Calculate the generator
%  
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if  VAR.Generator_minus(particle_nr)
    sign = -1;
else
    sign = +1;
end

chargeSign   =  VAR.Generator_ChargeSign(particle_nr);
chargeValue  =  VAR.Generator_ChargeValue(particle_nr)/3;
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

               
               
switch VAR.Generator_Select(particle_nr)

    %---------------------------------------------------------------------------------------------------
    %   GENERATOR:   POTENTIAL or FORCE FIELD
    %---------------------------------------------------------------------------------------------------
    case 0
       VAR.Generator(particle_nr,:,:)    =  squeeze(VAR.Lorentz_Generator( particle_nr,1:16,1:16)) ...
                                         *  squeeze(VAR.Internal_Generator(particle_nr,1:16,1:16)) ...
                                         *  sign;
    %---------------------------------------------------------------------------------------------------
    %   GENERATOR:   SIGMA 
    %---------------------------------------------------------------------------------------------------
    case 1
       VAR.Generator(particle_nr,:,:)    =  squeeze(VAR.Lorentz_Generator( particle_nr,1:16,1:16)) ...
                                         *  squeeze(VAR.Internal_Generator(particle_nr,1:16,1:16)) ...
                                         *  sign;
    %---------------------------------------------------------------------------------------------------
    %   GENERATOR:   HIGGS FOR LEPTONS
    %---------------------------------------------------------------------------------------------------
    case 2
       VAR.Generator(particle_nr,:,:)  =  eye(16);

    %---------------------------------------------------------------------------------------------------
    %   GENERATOR:   OMEGA INTERNAL
    %---------------------------------------------------------------------------------------------------
    case 3 
        if   VAR.Generator_LorR(particle_nr) == +1 % left
             VAR.Generator(particle_nr,:,:)  =  chargeSign*GEN.I1o + sqrt(1-chargeValue)*(GEN.I2o + GEN.I3o*GEN.J1o); 
        else % right
             VAR.Generator(particle_nr,:,:)  =  chargeSign*GEN.I1o - sqrt(1-chargeValue)*(GEN.I2o - GEN.I3o*GEN.J1o); 
        end 
        switch VAR.Generator_Generation(particle_nr)
            case 1
                VAR.Generator(particle_nr,:,:) = GEN.I0x * squeeze(VAR.Generator(particle_nr,:,:));
            case 2
                VAR.Generator(particle_nr,:,:) = GEN.I0y * squeeze(VAR.Generator(particle_nr,:,:));
            case 3
                VAR.Generator(particle_nr,:,:) = GEN.I0z * squeeze(VAR.Generator(particle_nr,:,:));
        end
        
    %---------------------------------------------------------------------------------------------------
    %   GENERATOR:   OMEGA POINCARE
    %---------------------------------------------------------------------------------------------------
    case 4
        if   VAR.Generator_LorR(particle_nr) == +1 % left
             VAR.Generator(particle_nr,:,:)  =  chargeSign*GEN.J1o + sqrt( chargeValue )*(GEN.J3o - GEN.J2o*GEN.I1o); 
        else % right
             VAR.Generator(particle_nr,:,:)  = -chargeSign*GEN.J1o + sqrt( chargeValue )*(GEN.J3o + GEN.J2o*GEN.I1o); 
        end        
        switch VAR.Generator_Generation(particle_nr)
            case 1
                VAR.Generator(particle_nr,:,:) = GEN.I0x * squeeze(VAR.Generator(particle_nr,:,:));
            case 2
                VAR.Generator(particle_nr,:,:) = GEN.I0y * squeeze(VAR.Generator(particle_nr,:,:));
            case 3
                VAR.Generator(particle_nr,:,:) = GEN.I0z * squeeze(VAR.Generator(particle_nr,:,:));
        end
        
    %---------------------------------------------------------------------------------------------------
    %   GENERATOR:   OMEGA TOTAL
    %---------------------------------------------------------------------------------------------------
    case 5
        if   VAR.Generator_LorR(particle_nr) == +1 % left
             VAR.Generator(particle_nr,:,:)  = -(chargeSign*GEN.I1o + sqrt(1-chargeValue)*(GEN.I2o + GEN.I3o*GEN.J1o)) ...
                                             *  (chargeSign*GEN.J1o + sqrt( chargeValue )*(GEN.J3o - GEN.J2o*GEN.I1o)); 
        else % right
             VAR.Generator(particle_nr,:,:)  =  (chargeSign*GEN.I1o - sqrt(1-chargeValue)*(GEN.I2o - GEN.I3o*GEN.J1o)) ...
                                             *  (chargeSign*GEN.J1o + sqrt( chargeValue )*(GEN.J3o + GEN.J2o*GEN.I1o)); 
        end  
        
    %---------------------------------------------------------------------------------------------------
    %   GENERATOR:   INTERNAL GENERATOR EXPANSION OF THE FIELD
    %---------------------------------------------------------------------------------------------------
    case 6
             VAR.Generator(particle_nr,:,:)  =  InternalGenerator/2;  
             
    %---------------------------------------------------------------------------------------------------
    %   GENERATOR:   POINCARE GENERATOR EXPANSION OF THE FIELD
    %---------------------------------------------------------------------------------------------------
    case 7
             VAR.Generator(particle_nr,:,:)  =  PoincareGenerator/2; 
             
    %---------------------------------------------------------------------------------------------------
    %   GENERATOR:   SELF GENERATOR 
    %---------------------------------------------------------------------------------------------------
    case 8
       
        VAR.Generator(particle_nr,:,:) = UnifiedField_FUN_CalcSelfGenerator(VAR,GEN,particle_nr);  

                        
             
    case 9 %NOT IN MENU
        VAR.Generator(particle_nr,:,:)  =  InternalGenerator * PoincareGenerator /4;  
             
end


end

