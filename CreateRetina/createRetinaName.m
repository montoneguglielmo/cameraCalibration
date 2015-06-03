function retinaName = createRetinaName(retina)


retina_size      = retina.retina_size;
retinaName = ['RetSz:' int2str(retina_size)];

step_grid = retina.step_grid;
retinaName = [retinaName '_RetStpGrid:' num2str(step_grid,2)];
