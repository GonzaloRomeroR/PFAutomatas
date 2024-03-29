function [x_points, y_points] = traj_trapezoid(pos_ini, pos_fin , charged, y_vector, to_ship)

x_edge = 2;
y_edge = 2;
container_size_x = 2.44;
container_size_y = 2.79;
y_ini = 4;
y_platform = 0;
y_ship_botton = -10;
y_safe = container_size_y;

x_ini = 0;
y_fin = 0;

distancia_carriles = 4;

position_vector = zeros(length(y_vector));
for i = 1:length(y_vector)
    position_vector(i) = i;
end

x_positions = position_vector * container_size_x - container_size_x / 2;

if(pos_ini == 1)
    x_ini = -3 * distancia_carriles;
elseif(pos_ini == 2)
    x_ini = -2 * distancia_carriles;
elseif(pos_ini == 3)
    x_ini = -1 * distancia_carriles;
end


if(charged == 1)
    y_safe = y_safe + container_size_y;
end

%Final position

if (pos_fin ~= 1)
    if (pos_fin == length(y_vector))
        if (y_vector(pos_fin) > y_vector(pos_fin - 1))
            y_fin = y_vector(pos_fin) * container_size_y + y_safe + y_ship_botton;
        else
            y_fin = y_vector(pos_fin - 1) * container_size_y + y_safe + y_ship_botton;
        end
    else
        if (y_vector(pos_fin) > y_vector(pos_fin - 1) && y_vector(pos_fin) > y_vector(pos_fin + 1))
            y_fin = y_vector(pos_fin) * container_size_y + y_safe + y_ship_botton;
        else
            y_fin = max(y_vector(pos_fin - 1), y_vector(pos_fin + 1)) * container_size_y + y_safe + y_ship_botton;
        end
    end
else
    if (y_edge < (y_vector(pos_fin + 1)  * container_size_y + y_ship_botton))
        y_fin = y_vector(pos_fin + 1) * container_size_y + y_safe + y_ship_botton;
    else
        if (y_edge > (y_vector(pos_fin)  * container_size_y + y_ship_botton))
            y_fin = y_safe + y_edge;
        else
            y_fin = y_vector(pos_fin) * container_size_y + y_safe + y_ship_botton;
        end
    end
end



obstacules_x = zeros(1, 40);
obstacules_y = zeros(1, 40);

obstacules_x(1) = x_edge;
obstacules_y(1) = y_edge + y_safe;

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


x_points = zeros(1, 4);
y_points = zeros(1, 4);

x_points(1) = x_ini;
y_points(1) = y_ini + container_size_y;

x_points(4) = obstacules_x(length(obstacules_x));
y_points(4) = obstacules_y(length(obstacules_y));

max_steep = -100;
angle = 0;

for i=1:length(obstacules_x)
    steep = (obstacules_y(i) - y_points(1)) / (obstacules_x(i) - x_points(1));
    if (steep > max_steep)
        max_steep = steep;
        angle = atan2(obstacules_y(i) - y_points(1), obstacules_x(i) - x_points(1));
    end
    
end
y_max = max(obstacules_y);

if (tan(angle) ~= 0)
    x_points(2) = x_points(1) + (y_max - y_points(1)) / tan(angle); 
else
    x_points(2) = x_points(1) + container_size_x;
end
y_points(2) = y_max;

min_steep = 100;
angle = 0;

for i=1:length(obstacules_x)
    steep = (- obstacules_y(i) + y_points(4)) / (- obstacules_x(i) + x_points(4));
    if (steep < min_steep)
        min_steep = steep;
        angle = atan2(- obstacules_y(i) + y_points(4), - obstacules_x(i) + x_points(4));
    end
    
end
y_max = max(obstacules_y);

tan(angle)

if (tan(angle) ~= 0)
    x_points(3) =   x_points(4) + (y_max - y_points(4)) / tan(angle);
else 
    x_points(3) = x_points(4);
end
y_points(3) = y_max;


% Correction in x to consider container x dimention

x_points(2) = x_points(2) - container_size_x;
x_points(3) = x_points(3) + container_size_x;

if x_points(3) > x_points(4)
    x_points(3) = x_points(4);
end




end