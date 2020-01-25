function rotation_generator = UnifiedField_FUN_RotationGenerator(spin_direction,generation,GEN)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_FUN_RotationGenerator;
%
% Return a 16x16 rotation generator
%  
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%


generation_rotate = expm( (generation-1) * 2/3*pi * (GEN.J0x+GEN.J0y+GEN.J0z)/sqrt(3) );

switch spin_direction
    case  0    % No Rotation
        rotation_generator =  eye(16);
    case +1    % Spin in +X direction
        rotation_generator =  eye(16) * generation_rotate;
    case -1    % Spin in -X direction
        rotation_generator =  GEN.J0y * generation_rotate;
    case +2    % Spin in +Y direction
        rotation_generator = (eye(16)+GEN.J0z)/sqrt(2) * generation_rotate;
    case -2    % Spin in -Y direction
        rotation_generator = (eye(16)-GEN.J0z)/sqrt(2) * generation_rotate;
    case +3    % Spin in +Z direction
        rotation_generator = (eye(16)-GEN.J0y)/sqrt(2) * generation_rotate;
    case -3    % Spin in -Z direction
        rotation_generator = (eye(16)+GEN.J0y)/sqrt(2) * generation_rotate;
    case +4    % Spin in +XY direction
        rotation_generator = expm(   pi/8*GEN.J0z) * generation_rotate;
    case -4    % Spin in -XY direction
        rotation_generator = expm(-3*pi/8*GEN.J0z) * generation_rotate;
    case +5    % Spin in +XZ direction
        rotation_generator = expm(  -pi/8*GEN.J0y) * generation_rotate;
    case -5    % Spin in -XZ direction
        rotation_generator = expm( 3*pi/8*GEN.J0y) * generation_rotate;
    case +6    % Spin in +YZ direction
        rotation_generator = expm(+pi/4*(GEN.J0z-GEN.J0y)/sqrt(2)) * generation_rotate;
    case -6    % Spin in -YZ direction
        rotation_generator = expm(-pi/4*(GEN.J0z-GEN.J0y)/sqrt(2)) * generation_rotate;
    case +7    % Spin in +XYZ direction
        rotation_generator = expm(atan(sqrt(2))/2*(GEN.J0z-GEN.J0y)/sqrt(2)) * generation_rotate;
    case -7    % Spin in -XYZ direction
        rotation_generator = expm((-pi-atan(sqrt(2)))/2*(GEN.J0z-GEN.J0y)/sqrt(2)) * generation_rotate;
    otherwise
        rotation_generator = eye(16);
end

 

end

