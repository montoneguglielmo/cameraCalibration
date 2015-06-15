clear all;

addpath('../CreateRetina/')
doSave = 0;
saveDir = '.';

square_retina     =  1;
retina_size       =  150;
retina_step       =  10;
corr_threshold    =  0.9;
ray               =  50;

%datasetImg   = '../LoadImages/grayScaleImgFish*';
datasetImg   = '../LoadImages/FishEyeData3Color*';

if(square_retina == 1)
    retina = defineFictionRetinaSquare(retina_size, retina_step);     
    Name  = createRetinaName(retina);
    Name = ['Type:Square_' Name '_coorThr:' num2str(corr_threshold)];
else
    retina = defineFictionRetinaCircle(retina_size, retina_step, ray);
    Name  = createRetinaName(retina);
    Name = ['Type:Circle_Ray:' int2str(ray) '_' Name '_coorThr:' num2str(corr_threshold)];
end

retina.name = Name;
   
%Evaluating the function phi and their norm
retina.corr_threshold = corr_threshold;
phi = evalMultPhiFun(datasetImg,retina);

%For each couple of photoreceptors find the phi-funcition that better
%associate them
[vectPhi, vectPhiCoor] = buildPhiVect(phi);
D = metEval(retina, vectPhi, vectPhiCoor, phi);


manif_dim = 2;
tp_estim = mdscale(D, manif_dim);

retina.tp_estim = tp_estim;
retina.DMat     = D;

figure
scatter(tp_estim(:,1),tp_estim(:,2));

retina.dataset = datasetImg;

if(doSave == 1)
    save([savedir '/' retina.name '.mat'],'retina');
end



