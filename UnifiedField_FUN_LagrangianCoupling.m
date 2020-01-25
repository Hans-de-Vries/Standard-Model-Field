function VAR = UnifiedField_FUN_LagrangianCoupling(VAR,GEN)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_FUN_LagrangianCoupling
%
% Calculates the Lagrangian coupling for the field / generator combination
%  
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%---------------------------------------------------------------------------------------------------
% Since we can do a weighted sum of three generators we need to check the
% Lagrangian coupling of each particle with all three generators
%---------------------------------------------------------------------------------------------------

generator_sums =   zeros(3,16,16);
coupling_sums  =   [0,0,0];
im_generator   =   (GEN.I0x + GEN.I0y + GEN.I0z);

for particle_nr = 1:3
    
    field      =  VAR.Field_in(particle_nr,1:16,1);
    couple     = ~VAR.Lagrangian_Coupling_Overrule(particle_nr);
    
    
    for gen = 1:3
        
      if VAR.Sum_Generators(particle_nr,gen) == true
        
        generator      =   squeeze(VAR.Generator(gen,1:16,1:16));
        internal_gen   =   squeeze(VAR.Internal_Generator(gen,1:16,1:16));
        scale          =   VAR.Lagrangian_Coupling_Scale(gen);
        generation     =   VAR.Field_generation(particle_nr);
        
        switch VAR.Internal_Generator_index(gen)
            case {0,1,2,3}
                boson_gen = GEN.J1o;
            case {4,5,6,7}
                boson_gen = GEN.I1o;
            case {8,9,10,11}
                boson_gen = GEN.I2o;
            case {12,13,14,15}
                boson_gen = GEN.I3o;
       end
        
        switch VAR.Generator_Select(gen)
            
            
            %---------------------------------------------------------------------------------------------------
            %   GENERATOR:   POTENTIAL or FORCE FIELD
            %---------------------------------------------------------------------------------------------------
            case 0
  
                boson_type = fix(VAR.Internal_Generator_index(gen)/4);
                charge     = VAR.EW_Charges(boson_type+1,1,particle_nr);
                        
                %---------------------------------------------------------------------------------------------------
                %   GENERATOR:   SIGMA POTENTIAL FIELDS
                %---------------------------------------------------------------------------------------------------
                if  VAR.Generator_Potential_or_Force(gen) == 1
 
                    lagrangian_coupling_generator = -GEN.J3o;
                    lagrangian_coupling = -field * (im_generator * GEN.J3o * generator ) * field' / 4;
                     
                    VAR.Lagrangian_Coupling(particle_nr,gen) = lagrangian_coupling;
                    VAR.Lagrangian_Coupling_Generator(particle_nr,gen,:,:) = lagrangian_coupling_generator;
                    
                    if couple
                        VAR.Lagrangian_Coupling(particle_nr,gen)              =     lagrangian_coupling  * scale; 
                        VAR.Lagrangian_Coupling_Factor(particle_nr,gen)       = abs(lagrangian_coupling) * scale;
                        generator_to_sum(:,:) = generator * lagrangian_coupling_generator * abs(lagrangian_coupling) * scale;
                        coupling_to_sum       = lagrangian_coupling  * scale;
                    else
                        VAR.Lagrangian_Coupling(particle_nr,gen)              =  scale;
                        VAR.Lagrangian_Coupling_Factor(particle_nr,gen)       =  scale;
                        generator_to_sum(:,:) = generator * lagrangian_coupling_generator * scale;
                        coupling_to_sum       = scale;
                    end
                    
                %---------------------------------------------------------------------------------------------------
                %   GENERATOR:   SIGMA FORCE FIELDS
                %---------------------------------------------------------------------------------------------------
                else
                    
                    
                    
                     lagrangian_coupling_generator =   ( ...
                           (field * (GEN.I0x * boson_gen ) * field' / 4)*GEN.I0x ...  
                         + (field * (GEN.I0y * boson_gen ) * field' / 4)*GEN.I0y ...  
                         + (field * (GEN.I0z * boson_gen ) * field' / 4)*GEN.I0z  );  
                     lagrangian_coupling =  ( ...
                           (field * (GEN.I0x * boson_gen ) * field' / 4) / VAR.Lepton_Mass(1) ...
                         + (field * (GEN.I0y * boson_gen ) * field' / 4) / VAR.Lepton_Mass(2) ...
                         + (field * (GEN.I0z * boson_gen ) * field' / 4) / VAR.Lepton_Mass(3) ) / 2;                       
                     
                    VAR.Lagrangian_Coupling(particle_nr,gen) = lagrangian_coupling;
                    VAR.Lagrangian_Coupling_Generator(particle_nr,gen,:,:) = lagrangian_coupling_generator;
                
                    if couple
                        VAR.Lagrangian_Coupling(particle_nr,gen)              =     lagrangian_coupling  * scale; 
                        VAR.Lagrangian_Coupling_Factor(particle_nr,gen)       = abs(lagrangian_coupling) * scale;
                        generator_to_sum(:,:) = generator * lagrangian_coupling_generator * lagrangian_coupling  * scale;
                        coupling_to_sum       = lagrangian_coupling  * scale;
                    else
                        VAR.Lagrangian_Coupling(particle_nr,gen)              =  scale;
                        VAR.Lagrangian_Coupling_Factor(particle_nr,gen)       =  scale;
                        generator_to_sum(:,:) = generator * lagrangian_coupling_generator * scale * VAR.Lepton_Mass(generation);
                        coupling_to_sum       = scale;
                   end
                    
                end
                
            %---------------------------------------------------------------------------------------------------
            %   GENERATOR:   HIGGS FOR LEPTONS
            %---------------------------------------------------------------------------------------------------
            case 2
                
 
                lagrangian_coupling =    + ( ...
                      (field * (GEN.J3o * GEN.I0x ) * field' / 4) * VAR.Lepton_Mass(1)  ...
                    + (field * (GEN.J3o * GEN.I0y ) * field' / 4) * VAR.Lepton_Mass(2)  ...
                    + (field * (GEN.J3o * GEN.I0z ) * field' / 4) * VAR.Lepton_Mass(3)  );
                lagrangian_coupling_generator = abs(lagrangian_coupling) * GEN.J3o;
                 
                VAR.Lagrangian_Coupling_Generator(particle_nr,gen,:,:) = generator * lagrangian_coupling_generator;
                
                if couple
                   VAR.Lagrangian_Coupling(particle_nr,gen)              =     lagrangian_coupling  * scale; 
                   VAR.Lagrangian_Coupling_Factor(particle_nr,gen)       = abs(lagrangian_coupling) * scale;
                   generator_to_sum(:,:) = lagrangian_coupling_generator *  scale;
                   coupling_to_sum       = lagrangian_coupling  * scale;
                 else
                   VAR.Lagrangian_Coupling(particle_nr,gen)              =  scale;
                   VAR.Lagrangian_Coupling_Factor(particle_nr,gen)       =  scale;
                   generator_to_sum(:,:) = lagrangian_coupling_generator *  scale * VAR.Lepton_Mass(generation);
                   coupling_to_sum       = scale;
                end
                
            %---------------------------------------------------------------------------------------------------
            %   GENERATOR:   SELF GENERATOR
            %---------------------------------------------------------------------------------------------------           
            case 8
                
                lagrangian_coupling_generator = UnifiedField_FUN_CalcSelfGenerator(VAR,GEN,particle_nr);
                generator_to_sum(:,:) = lagrangian_coupling_generator * scale;
                coupling_to_sum       = scale;
              
                
            %---------------------------------------------------------------------------------------------------
            %   GENERATOR:   OTHER CASES
            %---------------------------------------------------------------------------------------------------
            case {1,3,4,5,6,7,8}
                
               lagrangian_coupling_generator = eye(16);
               lagrangian_coupling =  field * (im_generator * generator ) * field' / 4;
                    
               VAR.Lagrangian_Coupling(particle_nr,gen) = lagrangian_coupling;
               VAR.Lagrangian_Coupling_Generator(particle_nr,gen,:,:) = lagrangian_coupling_generator;                
               
               VAR.Lagrangian_Coupling(particle_nr,gen)              =  scale;
               VAR.Lagrangian_Coupling_Factor(particle_nr,gen)       =  scale;
               
               generator_to_sum(:,:) = generator * lagrangian_coupling_generator * scale;
               coupling_to_sum       = scale;
               
        end % switch
        
                
        generator_sums(particle_nr,:,:) = squeeze(generator_sums(particle_nr,1:16,1:16)) + generator_to_sum(1:16,1:16);
        coupling_sums(particle_nr)      = coupling_sums(particle_nr) + coupling_to_sum;
        
      end % if
        
    end % for gen
    
end % for particle_nr



VAR.Generator               =  generator_sums;
VAR.Lagrangian_Coupling_Sum =  coupling_sums; 

end

