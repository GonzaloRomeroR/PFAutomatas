function [x_points, y_points] = traj(pos_ini, pos_fin , charged, y_vector, to_ship)

x_edge = 40;
y_edge = 40;
container_size_x = 200;
container_size_y = 200;
y_ini = 400;
y_platform = 0;
y_ship_botton = -400;
y_safe = 200;

x_ini = 0;
y_fin = 0;

x_positions = [ 1, 2, 3, 4, 5, 6, 7, 8] * container_size_x - container_size_x / 2;

if(pos_ini == 1)
    x_ini = -3 * 200;
elseif(pos_ini == 2)
    x_ini = -2 * 200;
elseif(pos_ini == 3)
    x_ini = -1 * 200;
end


if(charged == 1)
    y_safe = y_safe + container_size_y;
end

if (pos_fin ~= 1)
    if (y_vector(pos_fin) > y_vector(pos_fin - 1))
        y_fin = y_vector(pos_fin) * container_size_y + y_safe + y_ship_botton;
    else
        y_fin = y_vector(pos_fin - 1) * container_size_y + y_safe + y_ship_botton;
    end
else
    if (y_edge > (y_vector(pos_fin) + y_ship_botton))
        y_fin = y_ship_botton + y_safe;
    else
        y_fin = y_vector(pos_fin) * container_size_y + y_safe + y_ship_botton;
    end
end

obstacules_x = zeros(1, 20);
obstacules_y = zeros(1, 20);

obstacules_x(1) = x_edge;
obstacules_y(1) = y_edge;

counter = 2;

for i = 1:length(y_vector)
    obstacules_x(1, counter) = x_positions(i) - container_size_x / 2 + x_edge;
    obstacules_y(1, counter) = y_vector(i) * container_size_y + y_ship_botton + y_safe;
    counter = counter + 1;
    obstacules_x(1, counter) = x_positions(i) + container_size_x / 2 + x_edge;
    obstacules_y(1, counter) = y_vector(i) * container_size_y + y_ship_botton + y_safe;
    counter = counter + 1;
end

for i=1:length(obstacules_x)
    if (obstacules_x(i) >= (x_positions(pos_fin) + x_edge))
        obstacules_x(i) = x_positions(pos_fin) + x_edge;
        obstacules_y(i) = y_fin;
    end
end

points_len = 0;


for i=1:length(obstacules_x)
    if (obstacules_x(i) == (x_positions(pos_fin) + x_edge))
        points_len = i;
        break;
    end
end
obstacules_x = obstacules_x(1:points_len);
obstacules_y = obstacules_y(1:points_len);


x_points = zeros(1, 20);
y_points = zeros(1, 20);

x_points(1) = x_ini;
y_points(1) = y_ini + container_size_y;

counter = 1;

while(x_points(counter) < (x_positions(pos_fin) + x_edge))
    
    angle = -1000;
    best_point = 0;
    for i=1:length(obstacules_x)
        if (x_points(counter) < obstacules_x(i))
           aux_angle = (obstacules_y(i) - y_points(counter))/( obstacules_x(i) - x_points(counter));
           if (aux_angle > angle)
               angle = aux_angle;
               best_point = i;
           end
        end
    end
    x_points(counter + 1) = obstacules_x(best_point);
    y_points(counter + 1) = obstacules_y(best_point);
    counter = counter + 1;
    
end
points_len = 0;
for i=1:length(x_points)
    if (x_points(i) == 0)
        points_len = i;
        break;
    end
end
x_points = x_points(1:points_len - 1);
y_points = y_points(1:points_len - 1);

if (to_ship == 0)
    x_points = fliplr(x_points);
    y_points = fliplr(y_points);
end
end