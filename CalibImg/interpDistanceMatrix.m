function tp_estim_new = interpDistanceMatrix(retina)

retina_size = retina.retina_size;

coord_new     = 1:retina_size;

tp            = retina.topology_coord;
tp_estim      = retina.tp_estim;

tp_new(:,1)   = kron(ones(1,size(coord_new,2)), coord_new);
tp_new(:,2)   = kron(coord_new, ones(1,size(coord_new,2)));


tp_estim_new  = nan(size(tp_new));

num_neib = 8;

for ind = 1:size(tp_new,1)
    
    tp_temp = tp_new(ind,:);
    tp_temp = repmat(tp_temp,size(tp,1),1);
    
    dist = sqrt(sum((tp_temp-tp).^2,2));
    
    [val, indNear] = sort(dist);
    
    if(val(1) < eps)
        tp_estim_new(ind,:) = tp_estim(indNear(1),:);
    else
        normW   = 1/(sum(1./val(1:num_neib)));
        weights = normW./val(1:num_neib);
        tp_estim_new(ind,:) = sum(repmat(weights, 1, 2).*tp_estim(indNear(1:num_neib),:));
    end
end