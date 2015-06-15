function grayScaleImg = imgCol2Struct(colImage)

grayScaleImg      = cell(size(colImage,1),1);

for indIm = 1:size(colImage,1)
    imgTemp                  = squeeze(uint8(colImage(indIm, :, :, :)));
    imgTemp                  = imrotate(imgTemp,180);
    imgTemp                  = double(imgTemp)./255;
    grayScaleImg{indIm}      = imgTemp;
end