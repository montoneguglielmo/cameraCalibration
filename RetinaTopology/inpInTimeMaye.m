function photo_Time = inpInTimeMaye(retina, indFrame1, indFrame2, grayScaleImg)

[szImgX, szImgY] = size(grayScaleImg{1}{1});

sz_ret = retina.retina_size;
filter = false(szImgX, szImgY);
XBound = szImgX/2 - sz_ret/2 + 1:szImgX/2 + sz_ret/2;
YBound = szImgY/2 - sz_ret/2 + 1:szImgY/2 + sz_ret/2;

filter(XBound,YBound) = retina.retina_frame;
numTp                 = size(retina.topology_coord,1);
photo_Time            = nan(2*numTp, length(grayScaleImg));

for indImg = 1:length(grayScaleImg)
        pic_bef = grayScaleImg{indImg}{indFrame1};
        pic_aft = grayScaleImg{indImg}{indFrame2};
        photo_value = [pic_bef(filter); pic_aft(filter)];
        photo_Time(:,indImg) = photo_value;
end