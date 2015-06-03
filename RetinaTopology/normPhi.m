function nPhi = normPhi(phi)

X = phi.X;
Y = phi.Y;

coor = phi.coor;
coor(isnan(coor)) = -inf;

[values, indMax] = sort(coor,'descend');

XY = [X, Y];

numEl = min(sum(~isnan(Y(:,1))),3);

XY = XY(indMax(1:numEl),:);
cXY = coor(indMax(1:numEl));

X = XY(:,1:2);
Y = XY(:,3:4);

cXY = cXY./(sum(cXY));

nPhi = sum(cXY'.*sqrt((Y(:,1)-X(:,1)).^2 + (Y(:,2)-X(:,2)).^2));