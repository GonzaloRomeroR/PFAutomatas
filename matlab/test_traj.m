
pos_ini = 1;
pos_fin = 8;
container_vector = [8, 5, 9, 4, 5, 8, 4, 6];
charged = 1;
to_ship = 1;
[x_points, y_points] = traj(pos_ini, pos_fin, charged, container_vector, to_ship);
%[x_vector, y_vector] = interpolate(x_points, y_points);
figure(1)
plot(x_points, y_points)
[x_points_trap, y_points_trap] = traj_trapezoid(pos_ini, pos_fin, charged, container_vector, to_ship);

hold on 
plot(x_points_trap, y_points_trap, 'r')