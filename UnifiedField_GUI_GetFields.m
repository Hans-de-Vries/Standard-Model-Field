function VAR = UnifiedField_GUI_GetFields(VAR,GUI,GEN)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_GUI_GetFields(VAR,GUI,GEN);
%
% Obtain the fields from the graphical user interface in case of GUI events
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if GUI.signal_GUI_data_input_event  == true

    
    
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Choises Sequence calculation
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sequence:    Linear in time,  Independend Fields
% Sequence:    Linear in time,  Combined Fields
% Sequence:    Circular combined generators,  Independend Fields
% Sequence:    Circular combined generators,  Combined Fields

VAR.Fields_Independent  = (GUI.Sequence_choice == 1) || (GUI.Sequence_choice == 3);
VAR.Fields_Mixed        = (GUI.Sequence_choice == 2) || (GUI.Sequence_choice == 4);
VAR.Sequence_choice     =  GUI.Sequence_choice;




% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Choises for Visualization
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Visualize Particle:      Four Spinors,  Four spinor components for each each spinor
% Visualize Particle:      Four Spinors,  Four spinor currents and summed to Axial current 
% Visualize Particle:      Four Spinors,  Four spinor currents and summed to Vector current 
% Visualize Bilinears:     Axial current, and EM: Vector current,  Magnetization & Polarization
% Visualize Bilinears:     Show the selected Vectors in the Bilinear Field Matrix window (5 max)
% Visualize 3 Bilinears:  Total and combined Electromagnetic Vector currents
% Visualize 3 Bilinears:  Total and combined Electromagnetic Magnetization
% Visualize 3 Bilinears:  Total and combined Electromagnetic Polarization
% Visualize 3 Bilinears:  Total and combined Axial vector current




% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Choises for the Boson Potential Field Generator
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Select Potential:
% Zo   Neutral weak boson (o)
% Zx   Neutral weak boson (x)
% Zy   Neutral weak boson (y)
% Zz   Neutral weak boson (o)
% Ao   Electromagnetic boson (o)
% Ax   Electromagnetic boson (x)
% Ay   Electromagnetic boson (y)
% Az   Electromagnetic boson (z)
% W1o  Weak boson W1 (o)
% W1x  Weak boson W1 (x)
% W1y  Weak boson W1 (y)
% W1z  Weak boson W1 (z)
% W2o  Weak boson W2 (o)
% W2x  Weak boson W2 (x)
% W2y  Weak boson W2 (y)
% W2z  Weak boson W2 (z)

Boson_Lorentz_P_index  = [ 0,  8,13,14,15,  12, 9,10,11,  12, 9,10,11,  12, 9,10,11 ];
BosonInternal_P_index  = [ 0,  0, 0, 0, 0,   4, 4, 4, 4,   8, 8, 8, 8,  12,12,12,12 ];
Boson_P_signs          = [ 0,  1, 1, 1, 1,   1, 1, 1, 1,   1, 1, 1, 1,   1, 1, 1, 1 ];

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Choises for the Boson Force Field Generator
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Select Force Field
% Bx   Z-Magnetic Field (x)
% By   Z-Magnetic Field (y)
% Bz   Z-Magnetic Field (z)
% Ex   Z-Electric Field (x)
% Ey   Z-Electric Field (y)
% Ez   Z-Electric Field (z)
% Bx   A-Magnetic Field (x)
% By   A-Magnetic Field (y)
% Bz   A-Magnetic Field (z)
% Ex   A-Electric Field (x)
% Ey   A-Electric Field (y)
% Ez   A-Electric Field (z)
% Bx   W1-Magnetic Field (x)
% By   W1-Magnetic Field (y)
% Bz   W1-Magnetic Field (z)
% Ex   W1-Electric Field (x)
% Ey   W1-Electric Field (y)
% Ez   W1-Electric Field (z)
% Bx   W2-Magnetic Field (x)
% By   W2-Magnetic Field (y)
% Bz   W2-Magnetic Field (z)
% Ex   W2-Electric Field (x)
% Ey   W2-Electric Field (y)
% Ez   W2-Electric Field (z)



Boson_Lorentz_F_index  = [ 0,  5, 6, 7, 1, 2, 3,  1, 2, 3, 5, 6, 7,  1, 2, 3, 5, 6, 7,  1, 2, 3, 5, 6, 7];
BosonInternal_F_index  = [ 0,  0, 0, 0, 0, 0, 0,  4, 4, 4, 4, 4, 4,  8, 8, 8, 8, 8, 8, 12,12,12,12,12,12];
Boson_F_signs          = [ 0,  1, 1, 1,-1,-1,-1, -1,-1,-1, 1, 1, 1, -1,-1,-1, 1, 1, 1, -1,-1,-1, 1, 1, 1];
                         
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Choises for the Lorentz Generator
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---  No generator
% ---  Poincare generator:  BiLinear generator:    Inversion type:
% J0o  Mass  Scalar         Scalar                 ...
% J0x  Rotate X             Magnetization X        ...          
% J0y  Rotate Y             Magnetization Y        ...           
% J0z  Rotate Z             Magnetization Z        ...            
% J1o  Pseudo Scalar        Pseudo Scalar          PT inversion
% J1x  Boost X              Polarization X         ...       
% J1y  Boost Y              Polarization Y         ...       
% J1z  Boost Z              Polarization Z         ...       
% J2o  Pseudo Vector Time   Axial potential Time   Time Inversion
% J2x  Translation X        Vector potential X     ...       
% J2y  Translation Y        Vector potential Y     ...       
% J2z  Translation Z        Vector potential Z     ...       
% J3o  Translation Time     Vector potential Time  Parity Inversion
% J3x  Pseudo Vector X      Axial potential X      ...  
% J3y  Pseudo Vector Y      Axial potential Y      ...  
% J3z  Pseudo Vector Z      Axial potential Z      ...  


Lorentz_index  = [ 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15];
Lorentz_signs  = [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Choises for the Internal Generator
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---  No generator
% I0o   
% I0x  1st fermion generation
% I0y  2nd fermion generation
% I0z  3th fermion generation
% I1o  Electromagnetic  generator
% I1x  Electromagnetic  1st fermion generation
% I1y  Electromagnetic  2nd fermion generation
% I1z  Electromagnetic  3th fermion generation
% I2o  Neutrino Charge  generator
% I2x  Neutrino Charge  1st fermion generation
% I2y  Neutrino Charge  2nd fermion generation
% I2z  Neutrino Charge  3th fermion generation
% I3o  Sterile Charge   generator
% I3x  Sterile Charge   1st fermion generation
% I3y  Sterile Charge   2nd fermion generation
% I3z  Sterile Charge   3th fermion generation
% 

Internal_index  = [ 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15];
Internal_signs  = [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Choises for the Field type
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Electron
%  Muon lepton
%  Tau lepton
%  Electron Neutrino
%  Muon Neutrino
%  Tau Neutrino
%  Down quark
%  Strange quark
%  Bottom quark
%  Up quark
%  Charm quark
%  Top quark
%  Sterile Electron Neutrino
%  Sterile Muon Neutrino
%  Sterile Tau Neutrino
%  Positron
%  Anti muon lepton
%  Anti tau lepton
%  Anti electron neutrino
%  Anti muon neutrino
%  Anti tau neutrino
%  Anti down quark
%  Anti strange quark
%  Anti bottom quark
%  Anti up quark
%  Anti charm quark
%  Anti top quark
%  Anti Sterile Electron Neutrino
%  Anti Sterile Muon Neutrino
%  Anti Sterile Tau Neutrino
%  Electron Radeon
%  Muon Radeon
%  Tau Radeon
%  gen1 massless B1L
%  gen2 massless B1L
%  gen3 massless B1L
%  gen1 massless B1R
%  gen2 massless B1R
%  gen3 massless B1R
%  gen1 massive B2L
%  gen2 massive B2L
%  gen3 massive B2L
%  gen1 massive B2R
%  gen2 massive B2R
%  gen3 massive B2R
%  gen1 massive B3L
%  gen2 massive B3L
%  gen3 massive B3L
%  gen1 massive B3R
%  gen2 massive B3R
%  gen3 massive B3R
%  Vacuum 1
%  Vacuum 2
%  Vacuum 3





Fermion_generation  = [ 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3,  1, 1, 1];
Fermion_family      = [ 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 7, 7, 7, 9, 9, 9,10,10,10,11,11,11,12,12,12,13,13,13,14,14,14, 15,16,17];
Fermion_anti        = [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,  1, 1, 1];


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Choises for the Spin direction
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  No rotation
%  Spin Up   in X direction
%  Spin Down in X direction
%  Spin Up   in Y direction
%  Spin Down in Y direction
%  Spin Up   in Z direction
%  Spin Down in Z direction
%  Spin Up   in XY direction
%  Spin Down in XY direction
%  Spin Up   in XZ direction
%  Spin Down in XZ direction
%  Spin Up   in YZ direction
%  Spin Down in YZ direction
%  Spin Up   in XYZ direction
%  Spin Down in XYZ direction


Fermion_spin  = [0, 1,-1, 2,-2, 3,-3, 4,-4, 5,-5, 6,-6, 7,-7];

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Choises for the Boost direction
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% No pre boost 
% Boost in + X direction
% Boost in - X direction
% Boost in + Y direction
% Boost in - Y direction
% Boost in + Z direction
% Boost in - Z direction
% Custom

Fermion_boost  = [ 0, 1,-1, 2,-2, 3,-3, 0];

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Choises for the Phase/Color relative rotation
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  No Phase or Color
%  -120°  -  Red
%     0°  -  Green
%  +120°  -  Blue
%   +60°  -  anti Red
%   180°  -  anti Green
%   -60°  -  anti Blue
%   +90° 
%   -90° 

Fermion_phase_color  = [ 0, -120, 0, 120, 60, 180, -60, 90, -90];




% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Copy VAR parameters from GUI
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    VAR.Decompose_Generator                    =  GUI.Decompose_Generator;
    VAR.Lagrangian_Coupling_Method             =  GUI.Lagrangian_Coupling_Method;

for field_nr = 1:3

    VAR.Generator_Potential_or_Force(field_nr) =  GUI.Generator_Potential_or_Force(field_nr);
    VAR.EW_Boson_Generator_choice(field_nr)    =  GUI.EW_Boson_Generator_choice(field_nr);
    VAR.Generator_Select(field_nr)             =  GUI.Generator_Select(field_nr);
    VAR.Generator_FieldNr(field_nr)            =  GUI.Generator_FieldNr(field_nr);  
    VAR.Generator_Generation(field_nr)         =  GUI.Generator_Generation(field_nr);
    VAR.Generator_ChargeSign(field_nr)         =  GUI.Generator_ChargeSign(field_nr);
    VAR.Generator_ChargeValue(field_nr)        =  GUI.Generator_ChargeValue(field_nr);
    VAR.Generator_LorR(field_nr)               =  GUI.Generator_LorR(field_nr);    
    VAR.Sum_Generators(field_nr,1:3)           =  GUI.Sum_Generators(field_nr,1:3); 
    VAR.Lagrangian_Coupling_Scale(field_nr)    =  GUI.Lagrangian_Coupling_Scale(field_nr);
    VAR.Lepton_Mass(field_nr)                  =  GUI.Lepton_Mass(field_nr);
end    


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Call the specific functions to calculate the generators and fields 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for field_nr = 1:3
    
    %-----------------------------------------------------------------------------------------------
    %   Determine the 16x16 Boson Generator acting on the Fermion Fields 
    %-----------------------------------------------------------------------------------------------
    
    
         
    if VAR.Generator_Select(field_nr) == 0
        
        nr    = VAR.EW_Boson_Generator_choice(field_nr);
        
        if VAR.Generator_Potential_or_Force(field_nr) == 1
            index = Boson_Lorentz_P_index(nr);
        else
            index = Boson_Lorentz_F_index(nr);
        end
        
        sign  = 1;
        type  = 1; % Lorentz generator
        
        VAR.Poincare_Generator_index(field_nr) = index;
        VAR.Lorentz_Generator(field_nr,:,:)    = UnifiedField_FUN_16x16_Generator(type,index,sign,GEN);
        
        if VAR.Generator_Potential_or_Force(field_nr) == 1
            index = BosonInternal_P_index(nr);
        else
            index = BosonInternal_F_index(nr);
        end
        
        type  = 2; % Internal generator
       
        if VAR.Generator_Potential_or_Force(field_nr) == 1
            sign = Boson_P_signs(nr);
        else
            sign = Boson_F_signs(nr);
        end
        
        
        VAR.Internal_Generator_index(field_nr) = index;
        VAR.Internal_Generator(field_nr,:,:)   = UnifiedField_FUN_16x16_Generator(type,index,sign,GEN);
    end
 
    
    %-----------------------------------------------------------------------------------------------
    %   Determine the 16x16 Lorentz Generator acting on the Fermion Fields 
    %-----------------------------------------------------------------------------------------------
    
        
   if VAR.Generator_Select(field_nr) ~= 0
         nr    = GUI.Poincare_Generator_choice(field_nr);
        index = Lorentz_index(nr);
        sign  = Lorentz_signs(nr);
        type  = 1; % Lorentz generator
        VAR.Poincare_Generator_index(field_nr)   = index;
        VAR.Lorentz_Generator(field_nr,:,:)      = UnifiedField_FUN_16x16_Generator(type,index,sign,GEN);
    end
        
  
    
    
    %-----------------------------------------------------------------------------------------------
    %    Determine the 16x16 Internal space Generator acting on the Fermion Fields 
    %-----------------------------------------------------------------------------------------------
    
       
   if VAR.Generator_Select(field_nr) ~= 0
        nr    = GUI.Internal_Generator_choice(field_nr);
        index = Internal_index(nr);
        sign  = Internal_signs(nr);
        type  = 2; % Internal generator
        VAR.Internal_Generator_index(field_nr)  = index;
        VAR.Internal_Generator(field_nr,:,:)    = UnifiedField_FUN_16x16_Generator(type,index,sign,GEN);
    end
        

  
     
    %-----------------------------------------------------------------------------------------------
    %     Determine the 16x1 Fermion Field input
    %-----------------------------------------------------------------------------------------------
    
    if  GUI.signal_GUI_start || ...
        VAR.Fermion_Type_choice(field_nr) ~= GUI.Fermion_Type_choice(field_nr)  || ...
        VAR.Fermion_Ninv_choice(field_nr) ~= GUI.Fermion_Ninv_choice(field_nr)  || ...   
        VAR.Fermion_Anti_choice(field_nr) ~= GUI.Fermion_Anti_choice(field_nr)  || ...   
        VAR.Fermion_Pinv_choice(field_nr) ~= GUI.Fermion_Pinv_choice(field_nr)  || ...   
        VAR.Fermion_Tinv_choice(field_nr) ~= GUI.Fermion_Tinv_choice(field_nr)  || ...   
        VAR.Fermion_Mass_choice(field_nr) ~= GUI.Fermion_Mass_choice(field_nr)  || ... 
        VAR.Fermion_Pseu_choice(field_nr) ~= GUI.Fermion_Pseu_choice(field_nr)
     
        VAR.Fermion_Type_choice(field_nr)  = GUI.Fermion_Type_choice(field_nr);
        VAR.Fermion_Ninv_choice(field_nr)  = GUI.Fermion_Ninv_choice(field_nr);        
        VAR.Fermion_Anti_choice(field_nr)  = GUI.Fermion_Anti_choice(field_nr);        
        VAR.Fermion_Pinv_choice(field_nr)  = GUI.Fermion_Pinv_choice(field_nr);        
        VAR.Fermion_Tinv_choice(field_nr)  = GUI.Fermion_Tinv_choice(field_nr);        
        VAR.Fermion_Mass_choice(field_nr)  = GUI.Fermion_Mass_choice(field_nr);        
        VAR.Fermion_Pseu_choice(field_nr)  = GUI.Fermion_Pseu_choice(field_nr);        
       

        nr          = VAR.Fermion_Type_choice(field_nr);
        ncharge_inv = VAR.Fermion_Ninv_choice(field_nr);
        charge_inv  = VAR.Fermion_Anti_choice(field_nr);
        parity_inv  = VAR.Fermion_Pinv_choice(field_nr);
        time_inv    = VAR.Fermion_Tinv_choice(field_nr);
        mass        = VAR.Fermion_Mass_choice(field_nr);
        pseudo      = VAR.Fermion_Pseu_choice(field_nr);
        generation  = Fermion_generation(nr);
        family      = Fermion_family(nr);
        anti        = Fermion_anti(nr);
        
        VAR.Field_rest(field_nr,:,1)    = UnifiedField_FUN_16x1_FermionField(family,generation,charge_inv,ncharge_inv,anti,mass,pseudo,GEN);
        VAR.Field_family(field_nr)      = family;
        VAR.Field_generation(field_nr)  = generation;
        
        
        % Adapt spin direction because it is fermion generation dependend
        nr             = VAR.Spin_Direction_choice(field_nr);
        spin_direction = Fermion_spin(nr);
        generation     = VAR.Field_generation(field_nr);
        VAR.Rotation_Generator(field_nr,:,:) = UnifiedField_FUN_RotationGenerator(spin_direction,generation,GEN);

    end

    

    %-----------------------------------------------------------------------------------------------
    %     Determine the rotation Generator for the Fermion Field
    %-----------------------------------------------------------------------------------------------
    
    if  GUI.signal_GUI_start || ...
        VAR.Spin_Direction_choice(field_nr) ~= GUI.Spin_Direction_choice(field_nr)        
        VAR.Spin_Direction_choice(field_nr)  = GUI.Spin_Direction_choice(field_nr);
       
        nr             = VAR.Spin_Direction_choice(field_nr);
        spin_direction = Fermion_spin(nr);
        generation     = VAR.Field_generation(field_nr);
        VAR.Rotation_Generator(field_nr,:,:) = UnifiedField_FUN_RotationGenerator(spin_direction,generation,GEN);
        
    end
    
    
    
    %-----------------------------------------------------------------------------------------------
    %      Determine the Boost Generator for the Fermion Field
    %-----------------------------------------------------------------------------------------------
    
    if  GUI.signal_GUI_start || ...
        VAR.Boost_Direction_choice(field_nr) ~= GUI.Boost_Direction_choice(field_nr) || ...
        VAR.Boost_Amount_choice(field_nr)    ~= GUI.Boost_Amount_choice(field_nr);
        VAR.Boost_Direction_choice(field_nr)  = GUI.Boost_Direction_choice(field_nr); 
        VAR.Boost_Amount_choice(field_nr)     = GUI.Boost_Amount_choice(field_nr);

       nr              = VAR.Boost_Direction_choice(field_nr);
       boost_direction = Fermion_boost(nr);
       boost_amount    = VAR.Boost_Amount_choice(field_nr);
       [VAR.Rapidity(field_nr),VAR.Boost_Generator(field_nr,:,:)] = UnifiedField_FUN_BoostGenerator(boost_direction,boost_amount,GEN);
       
    end
 
    
    
    %-----------------------------------------------------------------------------------------------
    %      Determine the Phase/Color Generator for the Fermion Field
    %-----------------------------------------------------------------------------------------------
    
    if  GUI.signal_GUI_start || ...
        VAR.Phase_or_Color_choice(field_nr) ~= GUI.Phase_or_Color_choice(field_nr)       
        VAR.Phase_or_Color_choice(field_nr)  = GUI.Phase_or_Color_choice(field_nr); 

       nr              = VAR.Phase_or_Color_choice(field_nr);
       phase_color     = Fermion_phase_color(nr);
       generation     = VAR.Field_generation(field_nr);
       VAR.Sequence_Angle_Offset (field_nr)     = pi/180 * phase_color;
       VAR.Phase_Color_Generator (field_nr,:,:) = UnifiedField_FUN_PhaseColorGenerator(phase_color,generation,GEN);
    end
 
    
    
    %-----------------------------------------------------------------------------------------------
    %      Determine the overrule flags for the Lagrangian Coupling factor
    %-----------------------------------------------------------------------------------------------
    
       VAR.Lagrangian_Coupling_Overrule(field_nr)  = GUI.Lagrangian_Coupling_Overrule(field_nr); 

       
    %-----------------------------------------------------------------------------------------------
    %      Determine the minus flags for the Generator
    %-----------------------------------------------------------------------------------------------

       VAR.Generator_minus(field_nr)               = GUI.Generator_minus(field_nr);

       VAR.Use_generators_for_all_particles        = GUI.Use_generators_for_all_particles;

    %-----------------------------------------------------------------------------------------------
    %      Determine the inputs for the Bilinear matrices
    %-----------------------------------------------------------------------------------------------

       VAR.Bilinear_Input_Fields_choice            = GUI.Bilinear_Input_Fields_choice;
       VAR.Bilinear_Construction_Choice            = GUI.Bilinear_Construction_Choice;
       
    % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %  Declare  main return values
    % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
    
    
    rapidity = VAR.Rapidity(field_nr);
    
    VAR.PreGenerator(field_nr,:,:)    =  expm(rapidity/2 * squeeze(VAR.Boost_Generator(       field_nr,1:16,1:16)) )  * ...
                                                           squeeze(VAR.Rotation_Generator(    field_nr,1:16,1:16));%    * ...
                                                          %squeeze(VAR.Phase_Color_Generator( field_nr,1:16,1:16)); 
                                                     
    VAR.Field_in(field_nr,:,1)        =  squeeze(VAR.PreGenerator(field_nr,1:16,1:16)) * reshape(VAR.Field_rest(field_nr,1:16,1),[16,1]); 
        
    if  VAR.Fermion_Tinv_choice(field_nr) == -1
        VAR.Field_in(  field_nr,:,1)  =  GEN.J2o*squeeze(VAR.Field_in(field_nr,1:16,1))';
    end

    if  VAR.Fermion_Pinv_choice(field_nr) == -1
        VAR.Field_in(  field_nr,:,1)  =  GEN.J3o*squeeze(VAR.Field_in(  field_nr,1:16,1))';
    end
    
end  % for field_nr
    
    


for field_nr = 1:3
    VAR = UnifiedField_FUN_CalcGenerator(VAR,GEN,field_nr); 
end  

% % % MyMatrix1 = squeeze(VAR.Field_in(1,1:16));
% % % MyMatrix2 = squeeze(VAR.Field_in(2,1:16));
% % % MyMatrix3 = squeeze(VAR.Field_in(3,1:16));
% % % save('Myfile.txt','MyMatrix1','MyMatrix2','MyMatrix3','-ascii');


   
    % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %   
    % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                                          
    VAR = UnifiedField_FUN_LagrangianCharges(VAR,GEN);
    VAR = UnifiedField_FUN_LagrangianCoupling(VAR,GEN);                              

    VAR = UnifiedField_FUN_CalcBilinearFields(1,VAR,GEN,0);
    VAR = UnifiedField_FUN_CalcSpinorFields(  1,VAR,GEN,0);
  
    VAR = UnifiedField_FUN_CalcSequence(VAR,GEN);

 
end  % if

end
