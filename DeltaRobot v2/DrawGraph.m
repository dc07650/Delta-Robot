function DrawGraph(X, Y, Z, a1, a2, a3)
    global ub up L count

    R = ub;
    r = up;
    
    % Base Triangle
    plot3(0,0,0,'O','color', '#404040', 'MarkerSize',10)
    if count == 0
        view(60,30)
    end
    xlim([-500 500])
    ylim([-500 500])
    zlim([-400 100])
    hold on
    grid on
    grid minor
    rotate3d on
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