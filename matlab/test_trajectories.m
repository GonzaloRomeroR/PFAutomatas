function [x_points_trap, y_points_trap] = test_trajectories(ini, fin, charged_container)
 
container_vector = [8, 12, 12, 4, 5, 8, 1, 3, 7, 1, 5, 6];

to_ship = 1;
[x_points_trap, y_points_trap] = test_traj_trapezoid(ini, fin, charged_container, container_vector, to_ship);

end
