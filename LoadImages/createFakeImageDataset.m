clear all;

addpath('/home/guglielmo/Dropbox/oRegan/matlab_code/fishEye/')

numEnv     = 40;
numMov     = 60;

grayScaleImg = cell(1,numEnv);
dim_data_pic = 200;

fishEye     = 1;
coord_val   = linspace(1,dim_data_pic, dim_data_pic);
coord(:,1)  = kron(ones(1,size(coord_val,2)), coord_val);
coord(:,2)  = kron(coord_val, ones(1,size(coord_val,2)));
angCor      = sphereProj(coord, 0.1);

for indEnv = 1:numEnv
    grayScaleEnv = cell(numMov,1);
    num_points   = 60;
    pic_sz       = 400;
    picture      = genRandImg(pic_sz,(num_points)*0.05*randn + num_points);
    
    centerImgX = floor(pic_sz/2);
    centerImgY = floor(pic_sz/2);
    
    Mov = round(linspace(-dim_data_pic/2, dim_data_pic/2, numMov/2));
    
    rangePicX = centerImgX-dim_data_pic/2+1:centerImgX + dim_data_pic/2;
    rangePicY = centerImgY-dim_data_pic/2+1:centerImgY + dim_data_pic/2;
    
    for indMov = 1:numMov/2
        frameX = rangePicX + Mov(indMov);
        pic_frame = picture(frameX,rangePicY);
        grayScaleEnv{indMov} = createSnapShot(pic_frame, fishEye, angCor, dim_data_pic);
    end
    
    for indMov = 1:numMov/2
        frameY    = rangePicY + Mov(indMov);
        pic_frame = picture(rangePicX, frameY);
        grayScaleEnv{numMov/2 + indMov} = createSnapShot(pic_frame, fishEye, angCor, dim_data_pic);
    end
    
    grayScaleImg{indEnv} = grayScaleEnv;
    
end

if(fishEye==1)
    save('FakeGrayScaleImgFishEye', 'grayScaleImg');
else
    save('grayScaleImg', 'grayScaleImg');
end