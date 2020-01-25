function GEN = UnifiedField_GEN_Initialization()
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_GEN_Initialization()
%
% Define the Generators of the Field
% 
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all

 
% unit matrix
i3 = [  1  0  0;  0  1  0;  0  0  1  ];

% Generators of absolute rotation
rx = [  0  0  0;  0  0 -1;  0  1  0  ];
ry = [  0  0  1;  0  0  0; -1  0  0  ];
rz = [  0 -1  0;  1  0  0;  0  0  0  ];


% unit matrix
i4 = [  1  0  0  0;  0  1  0  0;  0  0  1  0;  0  0  0  1  ];
o4 = [  0  0  0  0;  0  0  0  0;  0  0  0  0;  0  0  0  0  ];

%% Generators of absolute rotation
jo = [  1  0  0  0;  0  1  0  0;  0  0  1  0;  0  0  0  1  ];
jx = [  0  1  0  0; -1  0  0  0;  0  0  0 -1;  0  0  1  0  ];
jy = [  0  0  1  0;  0  0  0  1; -1  0  0  0;  0 -1  0  0  ];
jz = [  0  0  0  1;  0  0 -1  0;  0  1  0  0; -1  0  0  0  ];

%% Generators of relative rotation
io = [  1  0  0  0;  0  1  0  0;  0  0  1  0;  0  0  0  1  ];
ix = [  0 -1  0  0;  1  0  0  0;  0  0  0 -1;  0  0  1  0  ];
iy = [  0  0 -1  0;  0  0  0  1;  1  0  0  0;  0 -1  0  0  ];
iz = [  0  0  0 -1;  0  0 -1  0;  0  1  0  0;  1  0  0  0  ];


%==========================================================================
%% Define the generator structure
%==========================================================================
%% the 3x3 generators

GEN.rx     =   rx;
GEN.ry     =   ry;
GEN.rz     =   rz;


%% the 4x4 generators

GEN.jo     =   jo;
GEN.jx     =   jx;
GEN.jy     =   jy;
GEN.jz     =   jz;

GEN.io     =   io;
GEN.ix     =   ix;
GEN.iy     =   iy;
GEN.iz     =   iz;

%% the 16x16 generators

GEN.J0o    =   kron(jo,jo);
GEN.J0x    =   kron(jo,jx);
GEN.J0y    =   kron(jo,jy);
GEN.J0z    =   kron(jo,jz);
GEN.J1o    =   kron(jx,jo);
GEN.J1x    =   kron(jx,jx);
GEN.J1y    =   kron(jx,jy);
GEN.J1z    =   kron(jx,jz);
GEN.J2o    =   kron(jy,jo);
GEN.J2x    =   kron(jy,jx);
GEN.J2y    =   kron(jy,jy);
GEN.J2z    =   kron(jy,jz);
GEN.J3o    =   kron(jz,jo);
GEN.J3x    =   kron(jz,jx);
GEN.J3y    =   kron(jz,jy);
GEN.J3z    =   kron(jz,jz);

GEN.I0o    =   kron(io,io);
GEN.I0x    =   kron(io,ix);
GEN.I0y    =   kron(io,iy);
GEN.I0z    =   kron(io,iz);
GEN.I1o    =   kron(ix,io);
GEN.I1x    =   kron(ix,ix);
GEN.I1y    =   kron(ix,iy);
GEN.I1z    =   kron(ix,iz);
GEN.I2o    =   kron(iy,io);
GEN.I2x    =   kron(iy,ix);
GEN.I2y    =   kron(iy,iy);
GEN.I2z    =   kron(iy,iz);
GEN.I3o    =   kron(iz,io);
GEN.I3x    =   kron(iz,ix);
GEN.I3y    =   kron(iz,iy);
GEN.I3z    =   kron(iz,iz);

%% the gamma matrices

GEN.Yo     =   kron(ix,io)*kron(jz,jo);
GEN.Yx     =   kron(ix,io)*kron(jy,jx);
GEN.Yy     =   kron(ix,io)*kron(jy,jx);
GEN.Yz     =   kron(ix,io)*kron(jz,jx);
GEN.Y5     =  -kron(ix,io)*kron(jx,jo);

%% the rotation generators

GEN.Jx     =   kron(jo,jx);
GEN.Jy     =   kron(jo,jy);
GEN.Jz     =   kron(jo,jz);

%% the boost generators

GEN.Kx     =   kron(jx,jx);
GEN.Ky     =   kron(jx,jy);
GEN.Kz     =   kron(jx,jz);

%%


GEN.R0o    =   kron((-io+jo)/2,io);
GEN.R0x    =   kron((-io+jo)/2,ix);
GEN.R0y    =   kron((-io+jo)/2,iy);
GEN.R0z    =   kron((-io+jo)/2,iz);
GEN.R1o    =   kron((+ix+jx)/2,io);
GEN.R1x    =   kron((+ix+jx)/2,ix);
GEN.R1y    =   kron((+ix+jx)/2,iy);
GEN.R1z    =   kron((+ix+jx)/2,iz);
GEN.R2o    =   kron((+iy+jy)/2,io);
GEN.R2x    =   kron((+iy+jy)/2,ix);
GEN.R2y    =   kron((+iy+jy)/2,iy);
GEN.R2z    =   kron((+iy+jy)/2,iz);
GEN.R3o    =   kron((+iz+jz)/2,io);
GEN.R3x    =   kron((+iz+jz)/2,ix);
GEN.R3y    =   kron((+iz+jz)/2,iy);
GEN.R3z    =   kron((+iz+jz)/2,iz);

%%

GEN.L0o    =   kron(( io+jo)/2,io);
GEN.L0x    =   kron(( io+jo)/2,ix);
GEN.L0y    =   kron(( io+jo)/2,iy);
GEN.L0z    =   kron(( io+jo)/2,iz);
GEN.L1o    =   kron((-ix+jx)/2,io);
GEN.L1x    =   kron((-ix+jx)/2,ix);
GEN.L1y    =   kron((-ix+jx)/2,iy);
GEN.L1z    =   kron((-ix+jx)/2,iz);
GEN.L2o    =   kron((-iy+jy)/2,io);
GEN.L2x    =   kron((-iy+jy)/2,ix);
GEN.L2y    =   kron((-iy+jy)/2,iy);
GEN.L2z    =   kron((-iy+jy)/2,iz);
GEN.L3o    =   kron((-iz+jz)/2,io);
GEN.L3x    =   kron((-iz+jz)/2,ix);
GEN.L3y    =   kron((-iz+jz)/2,iy);
GEN.L3z    =   kron((-iz+jz)/2,iz);


% % % 
% % % 
% % % GEN.R0o    =   kron((-io+jo)/2,io);
% % % GEN.R0x    =   kron((-io+jo)/2,ix);
% % % GEN.R0y    =   kron((-io+jo)/2,iy);
% % % GEN.R0z    =   kron((-io+jo)/2,iz);
% % % GEN.R1o    =   kron(+ix,io);
% % % GEN.R1x    =   kron(+ix,ix);
% % % GEN.R1y    =   kron(+ix,iy);
% % % GEN.R1z    =   kron(+ix,iz);
% % % GEN.R2o    =   kron(+iy,io);
% % % GEN.R2x    =   kron(+iy,ix);
% % % GEN.R2y    =   kron(+iy,iy);
% % % GEN.R2z    =   kron(+iy,iz);
% % % GEN.R3o    =   kron(+iz,io);
% % % GEN.R3x    =   kron(+iz,ix);
% % % GEN.R3y    =   kron(+iz,iy);
% % % GEN.R3z    =   kron(+iz,iz);
% % % 
% % % 
% % % i34 = [  0  0  0  0;  0  1  0  0;  0  0  1  0;  0  0  0  1  ];
% % % 
% % % GEN.R0o    =   kron(i34,io);
% % % GEN.R0x    =   kron(i34,ix);
% % % GEN.R0y    =   kron(i34,iy);
% % % GEN.R0z    =   kron(i34,iz);
% % % GEN.R1o    =   kron((+ix+jx)/2,io);
% % % GEN.R1x    =   kron((+ix+jx)/2,ix);
% % % GEN.R1y    =   kron((+ix+jx)/2,iy);
% % % GEN.R1z    =   kron((+ix+jx)/2,iz);
% % % GEN.R2o    =   kron((+iy+jy)/2,io);
% % % GEN.R2x    =   kron((+iy+jy)/2,ix);
% % % GEN.R2y    =   kron((+iy+jy)/2,iy);
% % % GEN.R2z    =   kron((+iy+jy)/2,iz);
% % % GEN.R3o    =   kron((+iz+jz)/2,io);
% % % GEN.R3x    =   kron((+iz+jz)/2,ix);
% % % GEN.R3y    =   kron((+iz+jz)/2,iy);
% % % GEN.R3z    =   kron((+iz+jz)/2,iz);


end

