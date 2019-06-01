function [x_points_trap, y_points_trap] = test_trajectories(ini, fin, charged_container)
 
container_vector = [2, 3, 4, 1, 2, 2, 4, 5, 1, 1, 0, 1];

to_ship = 1;
[x_points_trap, y_points_trap] = test_traj_trapezoid(ini, fin, charged_container, container_vector, to_ship);

plot_crane_test(container_vector)
plot(x_points_trap, y_points_trap)

end
