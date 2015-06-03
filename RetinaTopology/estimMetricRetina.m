clear all;

addpath('../CreateRetina/')
doSave = 0;
saveDir = '';

retina_size       =  100;
retina_step       =  10;
corr_threshold    =  0.9;

datasetImg   = '../LoadImages/grayScaleImg.mat'; 

retina = defineFictionRetinaSquare(retina_size, retina_step);

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



