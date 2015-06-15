function IMG = show_retina(tp, retinaV, reSize_val)

retinaX    = tp(:,1);
retinaY    = tp(:,2);
num_points = size(tp,1); 

dim_img = round((num_points)^(0.5).*reSize_val);
%dim_img = round((num_points)^(0.5));

X = linspace(min(retinaX), max(retinaX), dim_img);
Y = linspace(min(retinaY), max(retinaY), dim_img);
%r = 0.5*sqrt((X(end)-X(1))*(Y(end)-Y(1))./(pi*num_points));
maxTp  = 50000*min(pdist(tp))^2;

IMG = ones(dim_img,dim_img);
for cntx = 1:dim_img
    for cnty = 1:dim_img
        [val, indM]= sort(sum((bsxfun(@minus,tp, [X(cntx), Y(cnty)]).^2),2));
        %[val, indM] = sort(sum((repmat([X(cntx), Y(cnty)],num_points,1) - tp).^2,2));
        if(val(1) <= maxTp)
            IMG(cntx, cnty) = mean(retinaV(indM(1:1)));
        end
        %IMG(cntx,cnty) = mean(...
        %    retinaV(find((retinaX-X(cntx)).^2+(retinaY-Y(cnty)).^2 < r^2)));
    end
end
