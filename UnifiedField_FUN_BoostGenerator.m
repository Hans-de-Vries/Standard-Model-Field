function [rapidity,boost_generator] = UnifiedField_FUN_BoostGenerator(boost_direction, boost_amount,GEN)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_FUN_BoostGenerator
%
% Return a 16x16 boost generator
%  
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

boost_generator = zeros(16,16);


       
switch boost_direction
    case  0    % No Boost  
        boost_generator = +GEN.J0o;
    case +1    % Boost in +X direction
        boost_generator = +GEN.J1x;
    case -1    % Boost in -X direction
        boost_generator = -GEN.J1x;
    case +2    % Boost in +Y direction
        boost_generator = +GEN.J1y;
    case -2    % Boost in -Y direction
        boost_generator = -GEN.J1y;
    case +3    % Boost in +Z direction
        boost_generator = +GEN.J1z;
    case -3    % Boost in -Z direction
        boost_generator = -GEN.J1z;
    otherwise
        boost_generator = eye(16);
end

if boost_direction == 0
    rapidity = 0;
else
   %rapidity = 2*log(sqrt(1.20))*boost_amount;
    rapidity = asinh(boost_amount/5);
end

end

