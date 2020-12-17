clear all; clc;

x = 0;
y = 0;
z = -(199 - 15); % base 190

L = 150;
l = 250;
ub = 300;
wb = 150;
sb = 300.*sqrt(3);
up = 50;
wp = 25;
sp = 50.*sqrt(3);

a = wb - up;
b = sp/2 - (sqrt(3)/2) *wb;
c = wp - wb/2;

%% Theta 1

E1 = 2.*L.*(y+a);
F1 = 2.*z.*L;
G1 = x.^2 + y.^2 + z.^2 + a.^2 + L.^2 +2.*y.*a- l.^2;

% t1 = (-F1+sqrt(E1.^2 + F1.^2 - G1.^2))/(G1 - E1);
% 
% theta1 = 2*atan(t1)*180/pi;
% disp('Theta 1: '); disp(theta1)
t1 = (-F1-sqrt(E1.^2 + F1.^2 - G1.^2))/(G1 - E1);

theta1 = 2*atan(t1)*180/pi;
disp('Theta 1: '); disp(theta1)

%% Theta 2

E2 = -L.*(sqrt(3).*(x+b)+y+c);
F2 = 2.*z.*L;
G2 = x.^2 + y.^2 + z.^2 + b.^2 + c.^2 + L.^2 +2.*(x.*b + y.*c)- l.^2;

% t2 = (-F2+sqrt(E2.^2 + F2.^2 - G2.^2))/(G2 - E2);
% 
% theta2 = 2*atan(t2)*180/pi;
% disp('Theta 2: '); disp(theta2)
t2 = (-F2-sqrt(E2.^2 + F2.^2 - G2.^2))/(G2 - E2);

theta2 = 2*atan(t2)*180/pi;
disp('Theta 2: '); disp(theta2)

%% Theta 3

E3 = L.*(sqrt(3).*(x-b)-y-c);
F3 = 2.*z.*L;
G3 = x.^2 + y.^2 + z.^2 + b.^2 + c.^2 + L.^2 +2.*(-x.*b + y.*c)- l.^2;

% t3 = (-F3+sqrt(E3.^2 + F3.^2 - G3.^2))/(G3 - E3);
% 
% theta3 = 2*atan(t3)*180/pi;
% disp('Theta 3: '); disp(theta3)
t3 = (-F3-sqrt(E3.^2 + F3.^2 - G3.^2))/(G3 - E3);

theta3 = 2*atan(t3)*180/pi;
disp('Theta 3: '); disp(theta3)