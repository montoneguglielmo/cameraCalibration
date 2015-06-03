function Img = genRandImg(imSize,NumP)

X = 1:imSize;
Y = X;

[X,Y] = meshgrid(X,Y);

alfa = linspace(1, imSize, NumP);
C = rand(length(alfa));
[A,B] = meshgrid(alfa, alfa);

Img = interp2(A,B,C,X,Y);





