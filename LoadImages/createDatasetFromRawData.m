clear all;

dirImg = '/home/guglielmo/Downloads/MayeImgFishEye3/';

dataImg = dir(dirImg);

grayScaleImg = cell(1,length(dataImg)-2);
grayScaleImgColor1 = cell(1,ceil((length(dataImg)-2)/3));
grayScaleImgColor2 = cell(1,ceil((length(dataImg)-2)/3));
grayScaleImgColor3 = cell(1,ceil((length(dataImg)-2)/3));

count0 = 0;
count1 = 0;
count2 = 0;
 
for ind = 1:length(dataImg)-2
    load([dirImg dataImg(ind+2).name]);
    
    grayScaleImg{ind} = imgCol2GrayScale(image);
    
    
    if mod(ind,3) == 0
        count0 = count0 + 1;
        grayScaleImgColor1{count0} = imgCol2Struct(image);
    end
    
    if mod(ind,3) == 1
        count1 = count1 + 1;
        grayScaleImgColor2{count1} = imgCol2Struct(image);
    end

    if mod(ind,3) == 2
        count2 = count2 + 1;
        grayScaleImgColor2{count2} = imgCol2Struct(image);
    end

end


save('grayScaleImgFishEyeData3', 'grayScaleImg');

clear grayScaleImg;
grayScaleImg = grayScaleImgColor1;
save('FishEyeData3Color1', 'grayScaleImg');

clear grayScaleImg;
grayScaleImg = grayScaleImgColor2;
save('FishEyeData3Color2', 'grayScaleImg');

clear grayScaleImg;
grayScaleImg = grayScaleImgColor2;
save('FishEyeData3Color3', 'grayScaleImg');

