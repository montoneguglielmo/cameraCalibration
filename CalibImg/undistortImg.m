clear all;

%datasetImg   = '../LoadImages/grayScaleImgFishEyeData3.mat';
datasetImg   = '../LoadImages/FishEyeData3Color1.mat';

load(datasetImg);

%retina       = '../../Server/cameraCalibration/RetinaTopology/RetSz:150_RetStpGrid:5_threshold0.9.mat';
%retina       = '../../Server/cameraCalibration/RetinaTopology/RetSz:150_RetStpGrid:5.mat';
retina       = '../../Server/cameraCalibration/RetinaTopology/RetSz:130_RetStpGrid:2.mat';

load(retina);

figure;
img = grayScaleImg{1}{1};
imshow(img);

UndisImg = showUndistortImg(img, retina);

UndisImg = imrotate(UndisImg, 3);
figure;
imshow(UndisImg)


