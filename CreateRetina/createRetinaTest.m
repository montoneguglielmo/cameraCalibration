clear all;

retina_size         = 20;
step_retina_grid    = 1;

retina  = defineFictionRetinaSquare(retina_size, step_retina_grid);

figure;
tp = retina.topology_coord;
scatter(tp(:,1), tp(:,2), 'r+');

retina.name