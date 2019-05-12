
% pos_ini = 1;
% pos_fin = 5;
% container_vector = [8, 12, 12, 4, 5, 8, 1, 3];
% charged = 1;
% to_ship = 1;
% %[x_points, y_points] = traj(pos_ini, pos_fin, charged, container_vector, to_ship);
% %[x_vector, y_vector] = interpolate(x_points, y_points);
% figure(1)
% %plot(x_points, y_points)
% [x_points_trap, y_points_trap] = traj_trapezoid(pos_ini, pos_fin, charged, container_vector, to_ship);
% 
% %hold on 
% plot(x_points_trap, y_points_trap, 'r')
% hold on
% 
% plot_crane()



pos_ini = 1;
pos_fin = 5;
container_vector = [8, 12, 12, 4, 5, 8, 1, 3, 7, 1, 5, 6];
charged = 1;
to_ship = 1;
%[x_points, y_points] = traj(pos_ini, pos_fin, charged, container_vector, to_ship);
%[x_vector, y_vector] = interpolate(x_points, y_points);
figure(1)
%plot(x_points, y_points)
[x_points_trap, y_points_trap] = traj_trapezoid(pos_ini, pos_fin, charged, container_vector, to_ship);

%hold on 
plot(x_points_trap, y_points_trap, 'r')
%hold on

%plot_crane(x_points_trap(4), y_points_trap(4))


