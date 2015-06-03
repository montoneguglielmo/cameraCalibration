function D = metEval(retina, vectPhi, vectPhiCoor, phi)

tp = retina.topology_coord;

D = nan(size(tp,1));

p = ProgressBar(size(tp,1));        

for ind1 = 1:size(tp,1)
    p.progress;
    
    vectPhiP1     = vectPhi(ismember(vectPhi(:,1:2), tp(ind1,:),'rows'),3:4);
    vectPhiCoorP1 = vectPhiCoor(ismember(vectPhi(:,1:2), tp(ind1,:),'rows'),:);
    
    for ind2 = ind1:size(tp,1)
        diff = sum((bsxfun(@minus,vectPhiP1, tp(ind2,:)).^2),2);
        indDiff = find(min(diff) == diff);
        [~, indMax] = max(vectPhiCoorP1(indDiff));
        D(ind1, ind2) = phi{indDiff(indMax)}.nPhi;
    end
    
end
p.stop;

D = triu(D) + triu(D, 1)';