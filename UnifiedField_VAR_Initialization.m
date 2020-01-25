function VAR = UnifiedField_VAR_Initialization()
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_VAR_Initialization()
%
% Initialize the variable structure VAR
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Sequence_Length                            = 720;

VAR.Time_Step_Start                        = 0;

VAR.Generator_Potential_or_Force           = [ 1, 1, 1];
VAR.Generator_Select                       = [-1,-1,-1];
VAR.EW_Boson_Generator_choice              = [ 1, 1, 1];
VAR.Poincare_Generator_index               = [ 1, 1, 1];
VAR.Internal_Generator_index               = [ 1, 1, 1];
VAR.Sum_Generators                         = [true, false,false; ...
                                              false,true, false; ...
                                              false,false,true];
VAR.Fermion_Type_choice                    = [ 1, 1, 1];
VAR.Fermion_Ninv_choice                    = [-1,-1,-1];  
VAR.Fermion_Anti_choice                    = [-1,-1,-1]; 
VAR.Fermion_Pinv_choice                    = [-1,-1,-1];  
VAR.Fermion_Tinv_choice                    = [-1,-1,-1];  
VAR.Fermion_Mass_choice                    = [-1,-1,-1]; 
VAR.Fermion_Pseu_choice                    = [-1,-1,-1];  
VAR.Spin_Direction_choice                  = [ 1, 1, 1];
VAR.Boost_Direction_choice                 = [ 1, 1, 1];
VAR.Boost_Amount_choice                    = [ 1, 1 ,1];
VAR.Phase_or_Color_choice                  = [ 1, 1, 1];
VAR.Lagrangian_Coupling_Method             = 1;
VAR.Lagrangian_Coupling                    = [ 1, 1, 1 ; 1, 1, 1; 1, 1, 1];
VAR.Lagrangian_Coupling_Factor             = [ 1, 1, 1 ; 1, 1, 1; 1, 1, 1];
VAR.Lagrangian_Coupling_Generator(:,:,:,:) = zeros(3,3,16,16);
VAR.Lagrangian_Coupling_Overrule           = [false,false,false];
VAR.Lagrangian_Coupling_Scale              = [1,1,1];
VAR.Lagrangian_Coupling_Sum                = [1,1,1];
VAR.Generator_minus                        = [false,false,false];
VAR.Use_generators_for_all_particles       = false;
VAR.Field_rest                             = zeros(3,16,1);
VAR.Field_in                               = zeros(3,16,1);
VAR.Field_out                              = zeros(3,16,1);
VAR.Field_family                           = [ 1, 1, 1];
VAR.Field_generation                       = [ 1, 1, 1];
VAR.Fields_Independent                     = true;
VAR.Fields_Mixed                           = false;
VAR.EW_Charges                             = zeros(4,3,3);

VAR.Operator                               = zeros(3,16,16);
VAR.Generator                              = zeros(3,16,16);
VAR.Generator_NillPotent                   = [false,false,false];
VAR.Generator_Symmetric                    = [false,false,false];
VAR.Generator_Antisymmetric                = [false,false,false];
VAR.Generator_Cyclic                       = [false,false,false];

VAR.Lorentz_Generator                      = zeros(3,16,16);
VAR.Internal_Generator                     = zeros(3,16,16);
VAR.PreGenerator                           = zeros(3,16,16);
VAR.Rotation_Generator                     = zeros(3,16,16);
VAR.Boost_Generator                        = zeros(3,16,16);
VAR.Phase_Color_Generator                  = zeros(3,16,16);
VAR.Rapidity                               = [0,0,0];
VAR.Bilinear_Field_Matrix                  = zeros(3,16,16);
VAR.Bilinear_Field_Matrix_gamma            = true;
VAR.Bilinear_Construction_Choice           = [ 1 1 1 ];
VAR.Bilinear_Input_Fields_choice           = [ 1 1 ; 2 2 ; 3 3 ];
VAR.Bilinear_Spinor_Matrix                 = zeros(3,4,4,4);
VAR.Decompose_Generator                    = false;

VAR.Sequence_Length                        = Sequence_Length;
VAR.Sequence_Angle_Range                   = 6*pi;
VAR.Sequence_Angle_Delta                   = 6*pi/Sequence_Length;
VAR.Sequence_Angle_Offset                  = [0*pi, 0*pi, 0*pi];
VAR.Sequence_Ramp_Range                    = 2*log(2);
VAR.Sequence_Ramp_Delta                    = 2*log(2)/Sequence_Length;
VAR.Sequence_Entry                         = 1;
VAR.Sequence_Type                          = 1;                              % 1=Linear, 2=Circular
VAR.Sequence_Fields                        = zeros(Sequence_Length,3,16,1);  % The 3 output field sequences
VAR.Sequence_Operators                     = zeros(Sequence_Length,3,16,16); % The 3 Operator sequences
VAR.Sequence_Operator_Coefficient          = 0;     
VAR.Sequence_Bilinear_Field                = zeros(Sequence_Length,3,16,16); % Bilinear Field sequences
VAR.Sequence_Bilinear_Spinor               = zeros(Sequence_Length,3,4,4,4); % Bilinear Spinor sequences
VAR.Sequence_Previous_Entry                = -1;

end

