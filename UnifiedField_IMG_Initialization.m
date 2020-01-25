function  IMG = UnifiedField_IMG_Initialization(GUI)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UnifiedField_IMG_Initialization()
%
% Load the images used in the GUI
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% ==================================================================================================
% Load GUI images 
% ==================================================================================================

symbols_image           =  imread('Symbols.jpg');
genSelect_image         =  imread('GenSelect.jpg');
cover_image             =  imread('ProgramCover.jpg');
bar_image               =  imread('UnifiedField_bar.jpg');


% ==================================================================================================
%  Addd images to image pool IMG
% ==================================================================================================

IMG.lagrangian_image         =  symbols_image(319:395,  1:358, 1:3);
IMG.lagrangian_imageP        =  symbols_image(319:395,359:716, 1:3);
IMG.lagrangian_imageF        =  symbols_image(236:312,359:716, 1:3);
IMG.lagrangian_imageM        =  symbols_image(153:229,359:716, 1:3);
IMG.bilinear_image           =  symbols_image(396:491,  1:250, 1:3);
IMG.bilinearT_image          =  symbols_image(492:587,  1:250, 1:3);
IMG.psi_image                =  symbols_image(406:590,251:370, 1:3);
IMG.xixi_image               =  symbols_image(  1:96 ,300:396, 1:3);

IMG.sigma_image              =  symbols_image(  1:104,  1:104, 1:3);  
IMG.Higgs_image              =  symbols_image(  1:104,105:208, 1:3);  
IMG.checkOmega_image         =  symbols_image(209:312,  1:104, 1:3); 
IMG.hatOmega_image           =  symbols_image(209:312,105:208, 1:3); 
IMG.tildeOmega_image         =  symbols_image(209:312,209:312, 1:3); 
IMG.checkPsi_image           =  symbols_image(105:208,  1:104, 1:3); 
IMG.hatPsi_image             =  symbols_image(105:208,105:208, 1:3); 
IMG.selfMass_image           =  symbols_image(  1:104,209:312, 1:3); 
IMG.gamma0_image             =  symbols_image(114:214,214:294, 1:3); 

IMG.W_image                  =  symbols_image(  1:104,405:508, 1:3);  
IMG.A_image                  =  symbols_image(  1:104,510:613, 1:3);  
IMG.Z_image                  =  symbols_image(  1:104,615:718, 1:3);  
IMG.B_image                  =  symbols_image(  1:104,720:823, 1:3);  
IMG.E_image                  =  symbols_image(  1:104,825:928, 1:3);  
IMG.SUM_image                =  symbols_image(105:208,720:823, 1:3);  
IMG.No_image                 =  symbols_image(105:208,825:928, 1:3);  

IMG.color                    =  GUI.color;

IMG.bar_image                =  bar_image;

IMG.RecordingMode            =  2;
IMG.MovieRecordingPending    =  false;
IMG.MovieRecordingBusy       =  false;

% ==================================================================================================
%  Put cover image on cover
% ==================================================================================================

axes(GUI.handles.axes_COVER_IMAGE);
imagesc(cover_image);

% ==================================================================================================
%  Apply images for GUI initializatiom: lagrangian image
% ==================================================================================================

dims = size(IMG.lagrangian_image);

axes(GUI.handles.axes_Lagrangian_Coupling1)
imagesc(uint8(double(IMG.lagrangian_image) .* reshape( repmat( squeeze(IMG.color(3,1:3)), dims(1)*dims(2), 1), dims) ))
set(GUI.handles.axes_Lagrangian_Coupling1,'XColor','none')
set(GUI.handles.axes_Lagrangian_Coupling1,'YColor','none')

axes(GUI.handles.axes_Lagrangian_Coupling2)
imagesc(uint8(double(IMG.lagrangian_image) .* reshape( repmat( squeeze(IMG.color(4,1:3)), dims(1)*dims(2), 1), dims) ))
set(GUI.handles.axes_Lagrangian_Coupling2,'XColor','none')
set(GUI.handles.axes_Lagrangian_Coupling2,'YColor','none')

axes(GUI.handles.axes_Lagrangian_Coupling3)
imagesc(uint8(double(IMG.lagrangian_image) .* reshape( repmat( squeeze(IMG.color(5,1:3)), dims(1)*dims(2), 1), dims) ))
set(GUI.handles.axes_Lagrangian_Coupling3,'XColor','none')
set(GUI.handles.axes_Lagrangian_Coupling3,'YColor','none')



% ==================================================================================================
%  Apply images for GUI initializatiom: psi image
% ==================================================================================================

dims = size(IMG.psi_image);

axes(GUI.handles.axes_Psi_Image1)
imagesc(uint8(double(IMG.psi_image) .* reshape( repmat( squeeze(IMG.color(3,1:3)), dims(1)*dims(2), 1), dims) ))
set(GUI.handles.axes_Psi_Image1,'XColor','none')
set(GUI.handles.axes_Psi_Image1,'YColor','none')

axes(GUI.handles.axes_Psi_Image2)
imagesc(uint8(double(IMG.psi_image) .* reshape( repmat( squeeze(IMG.color(4,1:3)), dims(1)*dims(2), 1), dims) ))
set(GUI.handles.axes_Psi_Image2,'XColor','none')
set(GUI.handles.axes_Psi_Image2,'YColor','none')

axes(GUI.handles.axes_Psi_Image3)
imagesc(uint8(double(IMG.psi_image) .* reshape( repmat( squeeze(IMG.color(5,1:3)), dims(1)*dims(2), 1), dims) ))
set(GUI.handles.axes_Psi_Image3,'XColor','none')
set(GUI.handles.axes_Psi_Image3,'YColor','none')


% ==================================================================================================
%  Apply images for GUI initializatiom: bilinear, sigma and psi images
% ==================================================================================================

background_color = squeeze(IMG.color(7,1:3));

dims = size(IMG.bilinear_image);
axes(GUI.handles.axes_Bilinear_Image)
imagesc(uint8(double(IMG.bilinear_image) .* reshape( repmat( background_color, dims(1)*dims(2), 1), dims) ))
set(GUI.handles.axes_Bilinear_Image,'XColor','none')
set(GUI.handles.axes_Bilinear_Image,'YColor','none')

dims = size(IMG.sigma_image);
axes(GUI.handles.axes_Generator_Image)
imagesc(uint8(double(IMG.sigma_image) .* reshape( repmat( background_color, dims(1)*dims(2), 1), dims) ))
set(GUI.handles.axes_Generator_Image,'XColor','none')
set(GUI.handles.axes_Generator_Image,'YColor','none')

dims = size(IMG.psi_image);
axes(GUI.handles.axes_Psi_Image)
imagesc(uint8(double(IMG.psi_image) .* reshape( repmat( background_color, dims(1)*dims(2), 1), dims) ))
set(GUI.handles.axes_Psi_Image,'XColor','none')
set(GUI.handles.axes_Psi_Image,'YColor','none')


% ==================================================================================================
% Apply Images for the Generator Selection
% ==================================================================================================


dims = size(genSelect_image);

axes(GUI.handles.axes_GeneratorSelect1)
imagesc(uint8(double(genSelect_image) .* reshape( repmat( squeeze(IMG.color(3,1:3)), dims(1)*dims(2), 1), dims) ))
set(GUI.handles.axes_GeneratorSelect1,'XColor','none')
set(GUI.handles.axes_GeneratorSelect1,'YColor','none')

axes(GUI.handles.axes_GeneratorSelect2)
imagesc(uint8(double(genSelect_image) .* reshape( repmat( squeeze(IMG.color(4,1:3)), dims(1)*dims(2), 1), dims) ))
set(GUI.handles.axes_GeneratorSelect2,'XColor','none')
set(GUI.handles.axes_GeneratorSelect2,'YColor','none')

axes(GUI.handles.axes_GeneratorSelect3)
imagesc(uint8(double(genSelect_image) .* reshape( repmat( squeeze(IMG.color(5,1:3)), dims(1)*dims(2), 1), dims) ))
set(GUI.handles.axes_GeneratorSelect3,'XColor','none')
set(GUI.handles.axes_GeneratorSelect3,'YColor','none')



% ==================================================================================================
% Apply Images for the Spinor Bilinears
% ==================================================================================================

dims = size(IMG.xixi_image);

axes(GUI.handles.axes_xixi_1)
imagesc(uint8(double(IMG.xixi_image) .* reshape( repmat( [0.941 0.941 0.941] , dims(1)*dims(2), 1), dims) ))
set(GUI.handles.axes_xixi_1,'XColor','none')
set(GUI.handles.axes_xixi_1,'YColor','none')

axes(GUI.handles.axes_xixi_2)
imagesc(uint8(double(IMG.xixi_image) .* reshape( repmat( [0.941 0.941 0.941] , dims(1)*dims(2), 1), dims) ))
set(GUI.handles.axes_xixi_2,'XColor','none')
set(GUI.handles.axes_xixi_2,'YColor','none')

axes(GUI.handles.axes_xixi_3)
imagesc(uint8(double(IMG.xixi_image) .* reshape( repmat( [0.941 0.941 0.941] , dims(1)*dims(2), 1), dims) ))
set(GUI.handles.axes_xixi_3,'XColor','none')
set(GUI.handles.axes_xixi_3,'YColor','none')

axes(GUI.handles.axes_xixi_4)
imagesc(uint8(double(IMG.xixi_image) .* reshape( repmat( [0.941 0.941 0.941] , dims(1)*dims(2), 1), dims) ))
set(GUI.handles.axes_xixi_4,'XColor','none')
set(GUI.handles.axes_xixi_4,'YColor','none')

end

