function UndisImg = showUndistortImg(img, retina)

tp_estim_new = interpDistanceMatrix(retina);
tp_estim_new(:,1) = -tp_estim_new(:,1); 

[szImgX, szImgY, num_color] = size(img);

sz_ret = retina.retina_size;

filter = false(szImgX, szImgY);

XBound = szImgX/2 - sz_ret/2 + 1:szImgX/2 + sz_ret/2;
YBound = szImgY/2 - sz_ret/2 + 1:szImgY/2 + sz_ret/2;

filter(XBound, YBound) = true;

for ind = 1:num_color
    img_tmp = img(:,:,ind);
    retinaV = img_tmp(filter);
    reSize_val = 1;
    UndisImg(:,:,ind) = show_retina(tp_estim_new, retinaV, reSize_val);
end


