function phase_color_generator = UnifiedField_FUN_PhaseColorGenerator(phase_color,generation,GEN)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_FUN_PhaseColorGenerator
%
% Return a 16x16 phase or color generator (relative rotation)
%  
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

    switch generation
        case 1
            phase_gen = -GEN.I0x;
        case 2
            phase_gen = -GEN.I0y;
        case 3
            phase_gen = -GEN.I0z;
        otherwise
            phase_gen =  GEN.I0o;
    end
    
    phase_color_generator = expm(2*pi/180 * phase_color/2 * phase_gen);

end

 