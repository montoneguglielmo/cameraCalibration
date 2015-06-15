function densityCircularRetina(retina)

tp = retina.tp_estim;
ray = retina.ray;

step = 2;
rayVal = 0:step:ray;

distCenter = sum((tp - repmat(mean(tp), size(tp,1),1)).^2,2).^(0.5);


for ind = 1:size(rayVal,2)-1
 
    surface(ind) = 2*pi*rayVal(ind+1)*step;
    
    num_phot(ind) = sum(uint8(distCenter >= rayVal(ind)) .* uint8(distCenter<rayVal(ind+1)));
    
    density(ind) = num_phot(ind)/surface(ind);
    
end


plot(density)