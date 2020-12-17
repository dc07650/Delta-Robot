clear all; clc;
global ub sb wb up sp wp l L
l = 250; % Length of lower arm (elbow) 
L = 150; % Length of upper arm (shoulder) 
ub = 300; % Radius of the inscribed circle of the upper base = R
sb = 519.6152423;
wb = 150;
up = 50; % Radius of the inscribed circle of the lower platform = r
sp = 86.6025404;
wp = 25;
tt=0;


while 1 

% X = input('X : ');
% Y = input('Y : ');
% Z = input('Z : ');

xx = 100*cos(tt);
yy = 100*sin(tt);
disp(xx);
disp(yy);
disp(tt);
X = xx;
Y = yy;
Z = -200;

[A1,A2,A3,Flag] = XYZtoAngle(X,Y,Z);

if Flag == 0
    
    rotate3d on

    a1 = deg2rad(A1);
    a2 = deg2rad(A2);
    a3 = deg2rad(A3);
    R = ub;
    r = up;

    % Base Triangle
    plot3(0,0,0,'O','color', '#404040', 'MarkerSize',10)
    hold on
    xlim([-450 450]);
    ylim([-450 450]);
    zlim([-400 0]);
    grid on
    % B1 (A1)
    plot3(0,-R,0,'O','color', '#A2142F', 'MarkerSize',10)
    line([0 0],[0 -R],[0 0],'color', '#A2142F', 'LineWidth',2)
    % B2 (A2)
    plot3(+sqrt(3)*R/2,+R/2,0,'O','color', '#4DBEEE', 'MarkerSize',10)
    line([0 +sqrt(3)*R/2],[0 +R/2],[0 0],'color', '#4DBEEE', 'LineWidth',2)
    % B3 (A3)
    plot3(-sqrt(3)*R/2,+R/2,0,'O','color', '#77AC30', 'MarkerSize',10)
    line([0 -sqrt(3)*R/2],[0 +R/2],[0 0],'color', '#77AC30', 'LineWidth',2)
    % Base R (=ub)
    t = 0:pi/36:2*pi;
    xtb = R*sin(t);
    ytb = R*cos(t);
    plot3(xtb,ytb,t*0,'--','color', '#404040')

    % upper arms
    % B1 (A1)
    plot3(0,-R-L*cos(a1),-L*sin(a1),'O','color', '#A2142F', 'MarkerSize',10)
    line([0 0],[-R -R-L*cos(a1)],[0 -L*sin(a1)],'color', '#A2142F', 'LineWidth',2)
    % B2 (A2)
    plot3(+sqrt(3)*R/2+sqrt(3)*L*cos(a2)/2,+R/2+L*cos(a2)/2,-L*sin(a2),'O','color', '#4DBEEE', 'MarkerSize',10)
    line([+sqrt(3)*R/2 +sqrt(3)*R/2+sqrt(3)*L*cos(a2)/2],[+R/2 +R/2+L*cos(a2)/2],[0 -L*sin(a2)],'color', '#4DBEEE', 'LineWidth',2)
    % B3 (A3)
    plot3(-sqrt(3)*R/2-sqrt(3)*L*cos(a3)/2,+R/2+L*cos(a3)/2,-L*sin(a3),'O','color', '#77AC30', 'MarkerSize',10)
    line([-sqrt(3)*R/2 -sqrt(3)*R/2-sqrt(3)*L*cos(a3)/2],[+R/2 +R/2+L*cos(a3)/2],[0 -L*sin(a3)],'color', '#77AC30', 'LineWidth',2)

    % Plate Triangle
    plot3(X,Y,Z,'.','color', '#7E2F8E', 'MarkerSize',30)
    % B1 (A1)
    plot3(X,Y-r,Z,'O','color', '#A2142F', 'MarkerSize',10)
    line([X X],[Y Y-r],[Z Z],'color', '#A2142F', 'LineWidth',2)
    % B2 (A2)
    plot3(X+sqrt(3)*r/2,Y+r/2,Z,'O','color', '#4DBEEE', 'MarkerSize',10)
    line([X X+sqrt(3)*r/2],[Y Y+r/2],[Z Z],'color', '#4DBEEE', 'LineWidth',2)
    % B3 (A3)
    plot3(X-sqrt(3)*r/2,Y+r/2,Z,'O','color', '#77AC30', 'MarkerSize',10)
    line([X X-sqrt(3)*r/2],[Y Y+r/2],[Z Z],'color', '#77AC30', 'LineWidth',2)
    % Plate r (=up)
    t = 0:pi/36:2*pi;
    xtb = r*sin(t);
    ytb = r*cos(t);
    plot3(X+xtb,Y+ytb,0*t+Z,'--','color', '#7E2F8E')
    
    % lower arms
    % B1 (A1)
    line([0 X],[-R-L*cos(a1) Y-r],[-L*sin(a1) Z],'color', '#A2142F', 'LineWidth',2)
    % B2 (A2)
    line([+sqrt(3)*R/2+sqrt(3)*L*cos(a2)/2 X+sqrt(3)*r/2],[+R/2+L*cos(a2)/2 Y+r/2],[-L*sin(a2) Z],'color', '#4DBEEE', 'LineWidth',2)
    % B3 (A3)
    line([-sqrt(3)*R/2-sqrt(3)*L*cos(a3)/2 X-sqrt(3)*r/2],[+R/2+L*cos(a3)/2 Y+r/2],[-L*sin(a3) Z],'color', '#77AC30', 'LineWidth',2)

    hold off
else
    if Flag >= 8
        disp("Z가 유효범위가 아님");
        Flag = Flag - 8;
    end
     if Flag >= 4
        disp("Y가 유효범위가 아님");
        Flag = Flag - 4;
    end
    if Flag >= 2
        disp("X가 유효범위가 아님");
        Flag = Flag - 2;
    end
end
Str = ['A1 : ',num2str(A1),' A2 : ',num2str(A2),' A3 : ',num2str(A3)];
disp(Str);
pause(0.01);
tt=tt + pi/36;
end