% Proyecto Automatas y Control Discreto
%%
% Variables

%%
% Traslacion

min_pos_x = -30;
max_pos_x = 50;
vel_max = 4; % +/-
acel_max = 1; % +/-
min_pos_y = -20;
max_pos_y = 40;
y_t0 = 45;
y_sb = 15;
vel_max_load = 1.5; % +/-
vel_max_unload = 3; % +/-
g = 9.80665;
m_c = 15000;
m_cont = 2000;
m_i = 65000;
m_min = m_c + m_cont;
R_w = 0.5;
J_w = 2.0;
r_t = 15;
J_m = 10;
b_eq = 30;

%%
% Izaje

K_wi = 1800;
b_wi = 30;
R_di = 0.75;
J_di = 8;
r_i = 30;
J_mi = 30;
b_eqi = 18;


%%

M_t = m_c + (J_w + J_m * r_t ^ 2)/ R_w ^ 2;
b_t = b_eq * r_t ^ 2 / R_w ^ 2;


