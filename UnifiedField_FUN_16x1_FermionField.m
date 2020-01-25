function field = UnifiedField_FUN_16x1_FermionField(family,generation,charge_inv,ncharge_inv,anti,mass,pseudo,GEN)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_FUN_16x1_FermionField
%
% Define the unified field according to particle family, generation and
% anti-proportie
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Family 1:  Charged Leptons
% Family 2:  Neutrinos
% Family 3:  DSB Quarks
% Family 4:  UCT Quarks
% Family 5:  Sterile Neutrinos
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


switch generation
   case 1
      gen4x4 = GEN.ix;
   case 2
      gen4x4 = GEN.iy;
   case 3
      gen4x4 = GEN.iz;
    otherwise
      gen4x4 = GEN.io;
end
        
spinor0   =   [1,0,0,0]';
empty     =   [0,0,0,0]';

spinorQ1  =   (sqrt(2/3)*GEN.io + sqrt(1/3)*gen4x4)*spinor0; 
spinorQ2  =   (sqrt(1/3)*GEN.io + sqrt(2/3)*gen4x4)*spinor0; 

ispinorQ1  =  inv(sqrt(2/3)*GEN.io + sqrt(1/3)*gen4x4); 
ispinorQ2  =  inv(sqrt(1/3)*GEN.io + sqrt(2/3)*gen4x4);    

spinor_L1 = spinor0;
spinor_L2 = spinor0;
spinor_R1 = spinor0;
spinor_R2 = spinor0;        

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


field     =   zeros(16,1);


switch family
   %-----------------------------------------------------------------------------------------------
   %     Charged Leptons
   %-----------------------------------------------------------------------------------------------
   case 1
       if  anti == +1
           spinor_L1 =  spinor0;
           spinor_L2 = -gen4x4*spinor0;
           spinor_R1 =  spinor0;
           spinor_R2 = -gen4x4*spinor0;        
       else
           spinor_L1 =  spinor0;
           spinor_L2 =  gen4x4*spinor0;
           spinor_R1 = -spinor0;
           spinor_R2 = -gen4x4*spinor0;                   
       end
   %-----------------------------------------------------------------------------------------------
   %     Neutrinos
   %-----------------------------------------------------------------------------------------------
   case 2
       if  anti == +1
           spinor_L1 =  spinor0;
           spinor_L2 = -gen4x4*spinor0;
           spinor_R1 =  gen4x4*spinor0;
           spinor_R2 = -spinor0;                   
       else          
           spinor_L1 =  spinor0;
           spinor_L2 =  gen4x4*spinor0;
           spinor_R1 =  gen4x4*spinor0;
           spinor_R2 =  spinor0;             
       end
   %-----------------------------------------------------------------------------------------------
   %     DSB Quarks    
   %-----------------------------------------------------------------------------------------------
   case 3
%        if  anti == +1
%            spinor_L1 =  ispinorQ1 * spinorQ1;
%            spinor_L2 =  ispinorQ1 * spinorQ2;
%            spinor_R1 =  ispinorQ1 * gen4x4*spinor0;
%            spinor_R2 =  ispinorQ1 * spinor0;                   
%        else
%            spinor_L1 =  ispinorQ2 * spinorQ2;
%            spinor_L2 =  ispinorQ2 * spinorQ1;
%            spinor_R1 = -ispinorQ2 * spinor0;
%            spinor_R2 = -ispinorQ2 * gen4x4*spinor0;                  
%        end
       if  anti == +1
           spinor_L1 =  spinorQ1;
           spinor_L2 =  spinorQ2;
           spinor_R1 =  gen4x4*spinor0;
           spinor_R2 =  spinor0;                   
       else
           spinor_L1 =  spinorQ2;
           spinor_L2 =  spinorQ1;
           spinor_R1 = -spinor0;
           spinor_R2 = -gen4x4*spinor0;                  
       end
   %-----------------------------------------------------------------------------------------------
   %     UCT Quarks    
   %-----------------------------------------------------------------------------------------------
   case 4
%        if  anti == +1
%            spinor_L1 =  ispinorQ1 * spinorQ1;
%            spinor_L2 =  ispinorQ1 * spinorQ2;
%            spinor_R1 = -ispinorQ1 * spinor0; 
%            spinor_R2 = -ispinorQ1 * gen4x4*spinor0;                  
%        else
%            spinor_L1 =  ispinorQ2 * spinorQ2;
%            spinor_L2 =  ispinorQ2 * spinorQ1;
%            spinor_R1 =  ispinorQ2 * gen4x4*spinor0;   
%            spinor_R2 =  ispinorQ2 * spinor0;                   
%        end
       if  anti == +1
           spinor_L1 = -spinor0;                   
           spinor_L2 = -gen4x4*spinor0;
           spinor_R1 =  spinorQ1;
           spinor_R2 =  spinorQ2;
       else
           spinor_L1 =  gen4x4*spinor0;                  
           spinor_L2 =  spinor0;
           spinor_R1 =  spinorQ2;
           spinor_R2 =  spinorQ1;
       end

       
   %-----------------------------------------------------------------------------------------------
   %     Sterile Neutrinos
   %-----------------------------------------------------------------------------------------------
   case 5
       if  anti == +1
           spinor_L1 =  spinor0;
           spinor_L2 = -gen4x4*spinor0;
           spinor_R1 =  spinor0;                   
           spinor_R2 =  gen4x4*spinor0;
       else
           spinor_L1 =  spinor0;
           spinor_L2 =  gen4x4*spinor0;
           spinor_R1 =  spinor0;             
           spinor_R2 = -gen4x4*spinor0;
       end
   %-----------------------------------------------------------------------------------------------
   %     Radeons
   %-----------------------------------------------------------------------------------------------
   case 7
       if  anti == +1
           spinor_L1 =  spinor0;
           spinor_L2 =  spinor0;
           spinor_R1 =  gen4x4*spinor0;
           spinor_R2 = -gen4x4*spinor0;        
       else
           spinor_L1 =  spinor0;
           spinor_L2 = -spinor0;
           spinor_R1 =  gen4x4*spinor0;
           spinor_R2 = -gen4x4*spinor0;        
       end
   %-----------------------------------------------------------------------------------------------
   %       massless bosons L
   %-----------------------------------------------------------------------------------------------
   case 9
       if  anti == +1
           spinor_L1 =  spinor0;
           spinor_L2 = -gen4x4*spinor0;
           spinor_R1 =  empty;
           spinor_R2 =  empty;        
       else
           spinor_L1 =  spinor0;
           spinor_L2 =  gen4x4*spinor0;
           spinor_R1 =  empty;
           spinor_R2 =  empty;        
       end
   %-----------------------------------------------------------------------------------------------
   %       massless bosons R
   %-----------------------------------------------------------------------------------------------
       
   case 10
       if  anti == +1
           spinor_L1 =  empty;
           spinor_L2 =  empty;        
           spinor_R1 = -gen4x4*spinor0;
           spinor_R2 =  spinor0;
       else
           spinor_L1 =  empty;
           spinor_L2 =  empty;        
           spinor_R1 =  gen4x4*spinor0;
           spinor_R2 =  spinor0;
       end
       
   %-----------------------------------------------------------------------------------------------
   %       massive bosons 2L
   %-----------------------------------------------------------------------------------------------
   case 11
       if  anti == +1
           spinor_L1 =  spinor0;
           spinor_L2 =  empty;
           spinor_R1 = -gen4x4*spinor0;
           spinor_R2 =  empty;        
       else
           spinor_L1 =  spinor0;
           spinor_L2 =  empty;
           spinor_R1 =  gen4x4*spinor0;
           spinor_R2 =  empty;        
       end
   %-----------------------------------------------------------------------------------------------
   %       massive bosons 2R
   %-----------------------------------------------------------------------------------------------
   case 12
       if  anti == +1
           spinor_L1 =  empty;
           spinor_L2 =  spinor0;
           spinor_R1 =  empty;
           spinor_R2 = -gen4x4*spinor0;        
       else
           spinor_L1 =  empty;
           spinor_L2 =  spinor0;
           spinor_R1 =  empty;
           spinor_R2 =  gen4x4*spinor0;        
       end
   %-----------------------------------------------------------------------------------------------
   %       massive bosons 3L
   %-----------------------------------------------------------------------------------------------
   case 13
       if  anti == +1
           spinor_L1 =  spinor0;
           spinor_L2 =  empty;
           spinor_R1 =  empty;
           spinor_R2 = -gen4x4*spinor0;        
       else
           spinor_L1 =  spinor0;
           spinor_L2 =  empty;
           spinor_R1 =  empty;
           spinor_R2 =  gen4x4*spinor0;        
       end
   %-----------------------------------------------------------------------------------------------
   %       massive bosons 3R
   %-----------------------------------------------------------------------------------------------
   case 14
       if  anti == +1
           spinor_L1 =  empty;
           spinor_L2 =  spinor0;
           spinor_R1 = -gen4x4*spinor0;
           spinor_R2 =  empty;        
       else
           spinor_L1 =  empty;
           spinor_L2 =  spinor0;
           spinor_R1 =  gen4x4*spinor0;
           spinor_R2 =  empty;        
       end
   %-----------------------------------------------------------------------------------------------
   %       Vacuum 1
   %-----------------------------------------------------------------------------------------------
   case 15
       if  anti == +1
           spinor_L1 =  expm((   -acos( sqrt(1/3) ))/2*(GEN.iy-GEN.iz)/sqrt(2) ) * spinor0;
           spinor_L2 =  expm((-pi-acos( sqrt(1/3) ))/2*(GEN.iy-GEN.iz)/sqrt(2) ) * spinor0;
           spinor_R1 =  GEN.jx*spinor_L1;      
           spinor_R2 =  GEN.jx*spinor_L2;
       else
           spinor_L1 =  expm((   acos( sqrt(1/3) ))/2*(GEN.iy-GEN.iz)/sqrt(2) ) * spinor0;
           spinor_L2 = -expm((pi+acos( sqrt(1/3) ))/2*(GEN.iy-GEN.iz)/sqrt(2) ) * spinor0;
           spinor_R1 = -GEN.jx*spinor_L1;      
           spinor_R2 = -GEN.jx*spinor_L2;
       end

   %-----------------------------------------------------------------------------------------------
   %       Vacuum 2
   %-----------------------------------------------------------------------------------------------
   case 16
      %rotateXp = expm(+(pi-0.2222220471)/2*GEN.jx);
       if  anti == +1
           spinor_L1 =  expm((   -acos( sqrt(1/3) ))/2*(GEN.iy-GEN.iz)/sqrt(2) ) * spinor0;
           spinor_L2 =  expm((-pi-acos( sqrt(1/3) ))/2*(GEN.iy-GEN.iz)/sqrt(2) ) * spinor0;
           spinor_R1 =  spinor_L1;      
           spinor_R2 =  spinor_L2;
       else
           spinor_L1 =  expm((   acos( sqrt(1/3) ))/2*(GEN.iy-GEN.iz)/sqrt(2) ) * spinor0;
           spinor_L2 = -expm((pi+acos( sqrt(1/3) ))/2*(GEN.iy-GEN.iz)/sqrt(2) ) * spinor0;
           spinor_R1 = spinor_L1;      
           spinor_R2 = spinor_L2;
       end
   %-----------------------------------------------------------------------------------------------
   %       Vacuum 3
   %-----------------------------------------------------------------------------------------------
   case 17
           gen4x4 = (GEN.ix+GEN.iy+GEN.iz)*sqrt(1/3);

       if  anti == +1
           spinor_L1 =  spinor0;
           spinor_L2 = -gen4x4*spinor0;
           spinor_R1 =  spinor0;
           spinor_R2 = -gen4x4*spinor0;        
       else
           spinor_L1 =  spinor0;
           spinor_L2 =  gen4x4*spinor0;
           spinor_R1 = -spinor0;
           spinor_R2 = -gen4x4*spinor0;                   
       end

       
   %-----------------------------------------------------------------------------------------------
   %     
   %-----------------------------------------------------------------------------------------------
end       


    field(  1:4  ,1)  =  spinor_L1;
    field(  5:8  ,1)  =  spinor_L2;
    field(  9:12 ,1)  =  spinor_R1*mass;
    field( 13:16 ,1)  =  spinor_R2*mass;
    
if pseudo == -1
%   field(  9:12 ,1)  =  gen4x4*field(  9:12 ,1);
%   field( 13:16 ,1)  =  gen4x4*field( 13:16 ,1);    
    field(  9:12 ,1)  =  -gen4x4*field(  9:12 ,1);
    field( 13:16 ,1)  =  -gen4x4*field( 13:16 ,1);    
end
    

if  ncharge_inv == -1
    field  =  GEN.I1o*field;
end
if  charge_inv  == -1
    field  =  GEN.I2o*field;
end


% % % if  mass == -1
% % %     field  =  GEN.J1o*field;
% % % end





end

