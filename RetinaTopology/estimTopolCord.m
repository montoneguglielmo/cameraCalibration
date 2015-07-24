clear all;
addpath('~/Downloads/somtoolbox/');

%load()  here the name of the retian to load

unfoldMeth        = 'md'; % cmd || cca

doSave             = 1;
D                  = retina.D;
photo_time_collect = retina.photo_time_collect;
retina_name        = retina.retina_name; 
savedir            = retina.save_dir;


manif_dim = 2;
if(strcmp(unfoldMeth,'md'))
    tp_estim = mdscale(D, manif_dim);
end


if(strcmp(unfoldMeth,'cmd'))
    [tp_estim,eig] = cmdscale(D);
    tp_estim = tp_estim(:,1:manif_dim);
end


if(strcmp(unfoldMeth,'cca'))
    distance = squareform(D);
    tp_estim = cca(photo_time_collect, manif_dim, 5000, distance);
end

retina.tp_estim = tp_estim;

retina_name = [retina_name, '_unfoldMeth:', unfoldMeth];

figure
scatter(tp_estim(:,1),tp_estim(:,2));

if(doSave == 1)
    save([savedir '/' retina.name '.mat'],'retina');
end
