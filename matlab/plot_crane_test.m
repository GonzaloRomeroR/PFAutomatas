function plot_crane_test(containers)
x_edge = 2;
y_edge = 2;
container_size_x = 2.44;
container_size_y = 2.79;
y_ini = 4;
y_platform = 0;
y_ship_bottom = -10;
y_safe = 2;
y_t0 = 45;
distancia_carriles = 1;

x_ini = 0;
y_fin = 0;

barco_extremo_der = length(containers) * container_size_x + x_edge + 0.5;

x_min = -36;
x_max = 56;
y_min = -25;
y_max = 50;

%Viga horizontal
Yvigah = [y_t0, y_t0];
Xvigah = [x_min x_max];

figure(1)
plot(Xvigah, Yvigah,'r','linewidth', 2)



xlim([x_min x_max])
ylim([y_min y_max])
hold on
% Muelle

Xmuelleh = [x_min, 0];
Ymuelleh = [0, 0];
Xmuellev = [0, 0];
Ymuellev = [0, y_ship_bottom];

plot(Xmuelleh, Ymuelleh, 'k','linewidth', 3)
plot(Xmuellev, Ymuellev, 'k','linewidth', 3)

%Barco

Ybarco_izq = [y_edge, y_ship_bottom];
Xbarco_izq = [x_edge - 0.5 , x_edge - 0.5];

Ybarco_abajo = [y_ship_bottom - 0.2, y_ship_bottom - 0.3];
Xbarco_abajo = [x_edge - 0.8, barco_extremo_der + 0.3];



Ybarco_der = [y_edge, y_ship_bottom];
Xbarco_der = [barco_extremo_der, barco_extremo_der ];

plot(Xbarco_izq, Ybarco_izq, 'r','linewidth', 3)
plot(Xbarco_abajo, Ybarco_abajo, 'r','linewidth', 3)
plot(Xbarco_der, Ybarco_der, 'r','linewidth', 3)


position_vector = zeros(length(containers));
for i = 1:length(containers)
    position_vector(i) = i;
end

x_positions = position_vector * container_size_x - container_size_x + x_edge ;

for i = 1:length(containers)
    center_container_y = 0 + y_ship_bottom;
    for j = 1:containers(i)
        
        rectangle('Position', [x_positions(i),center_container_y, container_size_x, container_size_y], 'FaceColor',[0.5 0.5 0.5], 'EdgeColor','k','LineWidth',0.3)
        center_container_y = center_container_y + container_size_y;
    end
end

distancia_carriles = 4;
containers2 = [1, 1, 1];
x_positions2 = [0 0 0];
x_positions2(1) = -3 * distancia_carriles - container_size_x/2;
x_positions2(2) = -2 * distancia_carriles - container_size_x/2;
x_positions2(3) = -1 * distancia_carriles - container_size_x/2;



for i = 1:length(containers2 )
    center_container_y = 0;
    for j = 1:containers2(i)
        
        rectangle('Position', [x_positions2(i),center_container_y, container_size_x, container_size_y], 'FaceColor',[0.5 0.5 0.5], 'EdgeColor','k','LineWidth',0.3)
        center_container_y = center_container_y + container_size_y;
    end
end

% Marcadores de formas de funcionamiento
x_text = -30;
y_text = -10;
txt = 'Level 0';
text(x_text, y_text + 3, txt);
txt = 'Manual';
text(x_text, y_text, txt);
txt = 'Charged';
text(x_text, y_text - 3, txt);
txt = 'Balancing Control';
text(x_text, y_text - 6, txt);




end