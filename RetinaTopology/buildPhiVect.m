function [vectPhi, vectPhiCoor] = buildPhiVect(phi)

vectPhi = [];
vectPhiCoor =[];

for ind = 1:numel(phi)
    
    X = phi{ind}.X;
    Y = phi{ind}.Y;
    coor =phi{ind}.coor';
    
    vectPhi_temp = [X, Y];
    
    vectPhi = [vectPhi; vectPhi_temp];

    vectPhiCoor = [vectPhiCoor; coor];
end