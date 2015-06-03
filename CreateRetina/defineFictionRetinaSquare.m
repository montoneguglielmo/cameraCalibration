function retina = defineFictionRetinaSquare(retina_size, step_grid)

retina.fiction               = true(1);
retina.points_on_retina      = retina_size.^2;
retina.retina_size           = retina_size;
retina_frame                 = false(retina_size);

coord     = 1:step_grid:retina_size;
num_coord = size(coord,2);

for indX = 1:num_coord
    for indY = 1:num_coord
        retina_frame(coord(indX), coord(indY)) = 1;
    end
end

[topology_coord(:,1),topology_coord(:,2)] = find(retina_frame ==1);

retina.retina_frame   = retina_frame;
retina.topology_coord = topology_coord;
retina.step_grid      = step_grid;

Name  = createRetinaName(retina);

retina.name = Name;





