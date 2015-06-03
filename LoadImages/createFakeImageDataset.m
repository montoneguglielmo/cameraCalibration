clear all;

numEnv     = 40;
numMov     = 60;

grayScaleImg = cell(1,numEnv);
dim_data_pic = 200;

for indEnv = 1:numEnv
    grayScaleEnv = cell(numMov,1);
    num_points = 60;
    pic_sz     = 400;
    picture = genRandImg(pic_sz,(num_points)*0.05*randn + num_points);
    
    centerImgX = floor(pic_sz/2);
    centerImgY = floor(pic_sz/2);
    
    Mov = round(linspace(-dim_data_pic/2, dim_data_pic/2, numMov/2));
        
    rangePicX = centerImgX-dim_data_pic/2+1:centerImgX + dim_data_pic/2;
    rangePicY = centerImgY-dim_data_pic/2+1:centerImgY + dim_data_pic/2;
        
    
    for indMov = 1:numMov/2
        frameX = rangePicX + Mov(indMov);
        grayScaleEnv{indMov} = picture(frameX,rangePicY);
    end
    
    for indMov = 1:numMov/2
        frameY = rangePicY + Mov(indMov); 
        grayScaleEnv{numMov/2 + indMov} = picture(rangePicX, frameY);
    end
    
    grayScaleImg{indEnv} = grayScaleEnv;
    
end

save('grayScaleImg', 'grayScaleImg');
