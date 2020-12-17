function [A1, A2, A3, Flag] = XYZtoAngle(X, Y, Z)
global wb up sp wp l L

    a = wb - up;
    b = (sp - (sqrt(3)*wb))/2;
    c = wp - wb/2;
    
    E = zeros(3, 1);
    F = zeros(3, 1);
    G = zeros(3, 1);
    
    E(1,1) = 2*L*(Y+a);
    F(1,1) = 2*Z*L;
    G(1,1) = X*X + Y*Y + Z*Z + a*a + L*L + 2*Y*a - l*l;
    
    E(2,1) = -L * (sqrt(3)*(X+b)+Y+c);
    F(2,1) = 2*Z*L;
    G(2,1) = X*X + Y*Y + Z*Z + b*b + c*c + L*L + 2*(X*b+Y*c) - l*l;
    
    E(3,1) = L*(sqrt(3)*(X-b)-Y-c);
    F(3,1) = 2*Z*L;
    G(3,1) = X*X + Y*Y + Z*Z + b*b + c*c + L*L + 2*(Y*c - X*b) - l*l;
    
    T = zeros(3, 1);
    Flag = 0;
    for i = 1 : 1 : 3
        D = (E(i,1)^2 + F(i,1)^2 - G(i,1)^2);
        if D < 0
            T(i ,1) = 0;
            Flag = Flag + 2^i;
            continue
        end
        t1 = (-F(i,1) + sqrt(D))/(G(i,1) - E(i,1)); 
        t2 = (-F(i,1) - sqrt(D))/(G(i,1) - E(i,1)); 
        
        if abs(t1) >= abs(t2)
            T(i,1) = t2;
        else
            T(i,1) = t1;
        end
    end
    
    A1 = rad2deg(2*atan(T(1,1)));
    A2 = rad2deg(2*atan(T(2,1)));
    A3 = rad2deg(2*atan(T(3,1)));
end