function generator = UnifiedField_FUN_16x16_Generator(type,index,sign,GEN)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_FUN_16x16_Generator(GEN)
%
% Obtain the 16 x 16 generator identified by the choise and type
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


if     type == 1 
%---------------------------------------------------------------------------------------------------
% Obtain Lorentz type generator
%---------------------------------------------------------------------------------------------------
  switch index
   case 0
      generator = GEN.J0o;
   case 1
      generator = GEN.J0x;
   case 2
      generator = GEN.J0y;
   case 3
      generator = GEN.J0z;
   case 4
      generator = GEN.J1o;
   case 5
      generator = GEN.J1x;
   case 6
      generator = GEN.J1y;
   case 7
      generator = GEN.J1z;
   case 8
      generator = GEN.J2o;
   case 9
      generator = GEN.J2x;
   case 10
      generator = GEN.J2y;
   case 11
      generator = GEN.J2z;
   case 12
      generator = GEN.J3o;
   case 13
      generator = GEN.J3x;
   case 14
      generator = GEN.J3y;
   case 15
      generator = GEN.J3z;
   otherwise
      generator = zeros(16,16);
  end 
    
elseif type == 2
%---------------------------------------------------------------------------------------------------
% Obtain Internal type generator
%---------------------------------------------------------------------------------------------------
  switch index
   case 0
      generator = GEN.I0o;
   case 1
      generator = GEN.I0x;
   case 2
      generator = GEN.I0y;
   case 3
      generator = GEN.I0z;
   case 4
      generator = GEN.I1o;
   case 5
      generator = GEN.I1x;
   case 6
      generator = GEN.I1y;
   case 7
      generator = GEN.I1z;
   case 8
      generator = GEN.I2o;
   case 9
      generator = GEN.I2x;
   case 10
      generator = GEN.I2y;
   case 11
      generator = GEN.I2z;
   case 12
      generator = GEN.I3o;
   case 13
      generator = GEN.I3x;
   case 14
      generator = GEN.I3y;
   case 15
      generator = GEN.I3z;
   otherwise
      generator = zeros(16,16);
  end     
end

generator = sign*generator;

end

