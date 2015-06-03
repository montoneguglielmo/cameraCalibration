function [phi,coor] = psiToPhi(imgBefAft, threshold)

R = corrcoef(imgBefAft);
numPhot = size(R,1)/2;

phi  = nan(1,numPhot);
coor = nan(1,numPhot);

for ind1 = 1:numPhot

    R_temp = R(ind1, numPhot+1:end);
    [val, indMax] = max(abs(R_temp));
    
    if(val > threshold)
        phi(ind1) = indMax;
        coor(ind1) = val;
    end

end
