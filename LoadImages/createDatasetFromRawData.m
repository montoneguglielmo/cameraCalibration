clear all;

dirImg = '/home/guglielmo/Downloads/MayeImgFishEye3/';

dataImg = dir(dirImg);

grayScaleImg = cell(1,length(dataImg)-2);

for ind = 1:length(dataImg)-2
    load([dirImg dataImg(ind+2).name]);
    grayScaleImg{ind} = imgCol2GrayScale(image);
end

%save('grayScaleImgFishEyeData3', 'grayScaleImg');
