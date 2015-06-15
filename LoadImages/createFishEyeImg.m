function imgFish = createFishEyeImg(coord, valueImg, sz_out_im)

retinaX    = coord(:,1);
retinaY    = coord(:,2);
num_points = numel(retinaX);

X = linspace(min(retinaX), max(retinaX), sz_out_im);
Y = linspace(min(retinaY), max(retinaY), sz_out_im);
r = sqrt((X(end)-X(1))*(Y(end)-Y(1))./(pi*num_points));

imgFish = zeros(sz_out_im, sz_out_im);
for cntx = 1:sz_out_im
    for cnty = 1:sz_out_im
        if(sum((retinaX-X(cntx)).^2 + (retinaY-Y(cnty)).^2 < r^2)>0)
            imgFish(cntx,cnty) = mean(...
                valueImg((retinaX-X(cntx)).^2+(retinaY-Y(cnty)).^2 < r^2));
        end
    end
end
