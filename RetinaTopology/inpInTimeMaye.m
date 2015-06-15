function photo_Time = inpInTimeMaye(retina, indFrame1, indFrame2, grayScaleImg)

[szImgX, szImgY, num_color] = size(grayScaleImg{1}{1});

sz_ret = retina.retina_size;
filter = false(szImgX, szImgY);
XBound = szImgX/2 - sz_ret/2 + 1:szImgX/2 + sz_ret/2;
YBound = szImgY/2 - sz_ret/2 + 1:szImgY/2 + sz_ret/2;

filter(XBound,YBound) = retina.retina_frame;
numTp                 = size(retina.topology_coord,1);
photo_Time            = nan(2*numTp, num_color*length(grayScaleImg));

if num_color == 1 
    for indImg = 1:length(grayScaleImg)
        pic_bef = grayScaleImg{indImg}{indFrame1};
        pic_aft = grayScaleImg{indImg}{indFrame2};
        photo_value = [pic_bef(filter); pic_aft(filter)]; 
        photo_Time(:,indImg) = photo_value;
    end
end

if num_color == 3
    count = 1;
    for indImg = 1:length(grayScaleImg)
        for indCol = 1:num_color
            pic_bef = grayScaleImg{indImg}{indFrame1}(:,:,indCol);
            pic_aft = grayScaleImg{indImg}{indFrame2}(:,:,indCol);
            photo_value = [pic_bef(filter); pic_aft(filter)]; 
            photo_Time(:,count) = photo_value;
            count = count + 1;
        end
    end
end

% pic_rand = rand(size(filter));
% filter_full = false(szImgX, szImgY);
% for ind1 = 1:size(filter,1)
%     for ind2 = 1:size(filter,2)
%         dist = ((ind1-size(filter,1)/2).^2 + (ind2-size(filter,1)/2).^2).^(0.5);
%         if(dist<110)
%             filter_full(ind1, ind2) = true;
%         end
%     end
% end
% pic_rand(filter_full) = pic_aft(filter_full);
% figure;
% imshow(pic_rand)



%pic_bef_filter = pic_bef(XBound, YBound);
%pic_aft_filter = pic_aft(XBound, YBound);

%imshow(pic_bef_filter);
%figure;
%imshow(pic_aft_filter);
%figure;
%imshow(pic_bef);
%figure;
%imshow(pic_aft);
