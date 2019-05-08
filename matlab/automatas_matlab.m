% Proyecto Automatas y Control Discreto
%%
% Variables

%%
% Traslacion

h_contenedor = 2.79;
b_contenedor = 2.44;
min_pos_x = -30;
max_pos_x = 50;
v_max_t = 4; % +/-
a_max_t = 1; % +/-
min_pos_y = -20;
max_pos_y = 40;
y_t0 = 45;% <------- cambiar para que sea identica
x_t0 = 0;
y_sb = 15;
g = 9.80665;
m_c = 50000;%15000;    <------- cambiar para que sea identica
m_cont = 2000;
m_i = 65000;
m_min = m_c + m_cont;
R_w_t = 0.5;
J_w_t = 2.0;
r_t = 15;
J_m_t = 10;
b_eq_t = 30;

angle_max = 0.6108;

%%
% Izaje

K_w_h = 1800000;
b_w_h = 30000;
R_d = 0.75;
J_d = 8;
r_h = 30;
J_m_h = 30;
b_eq_h = 18;
yl0 = h_contenedor + 5;
v_max_h_load = 1.5; % +/-
v_max_h_unload = 3; % +/-
a_max_h = 1;


%%
% Masas Equivalentes

M_t = m_c + (J_w_t + J_m_t * r_t ^ 2)/ R_w_t ^ 2;
b_t = b_eq_t * r_t ^ 2 / R_w_t ^ 2;


M_h = (J_d + J_m_h * r_h ^ 2)/ R_d ^ 2;
b_h = b_eq_h * r_h ^ 2 / R_d ^ 2;

%%
% PID

% Balanceo
n_bal = 3;
m_l = 65000;
m_l_min = 15000;
k_bal = 10;

% Traslacion

w_t    = b_t / M_t; 
n_t    = 3;
w_pos_t = 10 * w_t;

ba_t   =  M_t * n_t * w_pos_t;
Ksa_t  =  M_t * n_t * w_pos_t^2;
Ksia_t =  M_t * w_pos_t ^ 3;


% Izaje

w_h    = b_h / M_h; 
n_h    = 3;
w_pos_h = 10* w_h;

ba_h   =  M_h * n_h * w_pos_h;
Ksa_h  =  M_h * n_h * w_pos_h^2;
Ksia_h =  M_h * w_pos_h ^ 3;


