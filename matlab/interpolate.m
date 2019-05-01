function [x_vector, y_vector] = interpolate(x_points, y_points)

figure(1)
plot(x_points, y_points);

x_points = [x_points, x_points(length(x_points))];
y_points = [y_points, y_points(length(y_points))];

x_vector = x_points(1):0.1:x_points(length(x_points));
y_vector = x_points(1):0.1:x_points(length(x_points));


tau = 20;

contador = 1;
for i=1:(length(x_vector) - 1)
    T_1 = x_points(contador + 1);
    T_2 = x_points(contador + 2);
    a = ((T_1 - x_points(contador))*(y_points(contador+2) - y_points(contador+1)) - (T_2 - x_points(contador))*(y_points(contador+1) - y_points(contador)))/(2*(T_1 - x_points(contador))*(T_2 - x_points(contador))*tau);
    
    if(x_vector(i) <= (T_1 - tau)) 
        y_vector(i) = y_points(contador) + (y_points(contador + 1) - y_points(contador))/(T_1 - x_points(contador)) * (x_vector(i) - x_points(contador));
    end
    
    if(x_vector(i) > (T_1 - tau) && x_vector(i) < (T_1 + tau)) 
        y_vector(i) = y_points(contador + 1) + (y_points(contador + 1) - y_points(contador))/(T_1 - x_points(contador)) * (x_vector(i) - T_1) + a/2 * (x_vector(i) - T_1 + tau) ^ 2;
    end
    
    if(x_vector(i) >= (T_1 + tau)) 
        y_vector(i) = y_points(contador + 1) + (y_points(contador + 1) - y_points(contador))/(T_1 - x_points(contador)) * (x_vector(i) - T_1) + a/2 * (x_vector(i) - T_1 + tau) ^ 2;
        contador = contador + 1;
        if ((contador + 2) > length(x_points))
            break;
        end
    end
    
end

%figure(2)
%plot(x_vector, y_vector);

end