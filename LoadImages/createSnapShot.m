function snapShot = createSnapShot(pic_frame, fishEye, angCor, dim_data_pic)

if(fishEye)
    %x = 1:dim_data_pic;
    %y = 1:dim_data_pic;
    %[X,Y]    = meshgrid(x,y);
    %[XI, YI] = meshgrid(coord_val, coord_val);
    %im_out   = interp2(X, Y, pic_frame, XI, YI);
    im_out   = reshape(pic_frame, numel(pic_frame), 1);
    snapShot  = createFishEyeImg(angCor, im_out, dim_data_pic); 
else
    snapShot = pic_frame;
end
