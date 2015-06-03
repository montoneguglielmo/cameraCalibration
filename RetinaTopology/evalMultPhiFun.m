function phi = evalMultPhiFun(datasetImg, retina)

fprintf('Loading image dataset...');
load(datasetImg);
fprintf('done\n\n');


fprintf('Evaluating the phi functions...\n');
phi = cell(1, size(grayScaleImg{1},1)^2);

corr_threshold = retina.corr_threshold;

p = ProgressBar(numel(phi));
count = 0;
for indFrame1 = 1:size(grayScaleImg{1},1)
    for indFrame2 = 1:size(grayScaleImg{1},1)
        
        p.progress;
        
        photo_Time = inpInTimeMaye(retina, indFrame1, indFrame2, grayScaleImg);
        
        [phi_ind, coor]      = psiToPhi(photo_Time', corr_threshold);
        count = count+1;
        
        phi{count}.coor     = coor;
        phi{count}.X        = retina.topology_coord;
        phi{count}.indY     = phi_ind;
        
        Y = nan(size(retina.topology_coord,1),2);
        
        for ind = 1:size(phi_ind,2)
            if(~isnan(phi_ind(ind)))
                Y(ind,:) = retina.topology_coord(phi_ind(ind),:);
            else
                Y(ind,:) = [NaN, NaN];
            end
        end
        
        phi{count}.Y = Y;
        nPhi = normPhi(phi{count});
        phi{count}.nPhi = nPhi;
        
    end
end
p.stop;