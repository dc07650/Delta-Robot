clear all;
clc;
disp('Start');

global ub sb wb up sp wp l L count
l = 250; % Length of lower arm (elbow)
L = 150; % Length of upper arm (shoulder)
ub = 300; % Radius of the inscribed circle of the upper base = R
sb = 519.6152423;
wb = 150;
up = 50; % Radius of the inscribed circle of the lower platform = r
sp = 86.6025404;
wp = 25;
% WorkSpace() = X : -40 ~ +40 / Y : -40 ~ +40 / Z : -260 ~ -180
count = 0;

pX = 0;
pY = 0;
pZ = 0;

%%
% Save the serial port name in comPort variable.

comPort = 'COM6';

%%
% It creates a serial element calling the function "stupSerial"

if(~exist('serialFlag','var'))
    [arduino,serialFlag] = setupSerial(comPort);
end
disp('Connected');

%% Loop


terminate = 0;

while true
    comm = inputdlg('COMM:: ','COMM');
    switch comm{1}
        case 'e'
            X = inputdlg('X : ','x');
            Y = inputdlg('Y : ','y');
            Z = inputdlg('Z : ','z');
        case 'c'
            disp('Terminated');
            close all;
            terminate = 1;
        case 't'
            str = horzcat(a1_s,' ',a2_s,' ',a3_s, 'q');
            fprintf(arduino, str);
                        
    end
    
    if terminate
        break;
    end
    
    X = str2double(X);
    Y = str2double(Y);
    Z = str2double(Z);
    
    [A1,A2,A3,Flag] = XYZtoAngle(X,Y,Z);
    
    a1 = deg2rad(A1);
    a2 = deg2rad(A2);
    a3 = deg2rad(A3);
    
    a1_s = sprintf('%.4f', A1);
    a2_s = sprintf('%.4f', A2);
    a3_s = sprintf('%.4f', A3);
    
    
    if Flag == 0 && abs(a1) <= 150 && abs(a2) <= 150 && abs(a3) <= 150
        
        str = horzcat(a1_s,' ',a2_s,' ',a3_s, 'w')
        
        fprintf(arduino, str);
        
        if count == 1
            Step = 10;
            for n = 1:Step
                tic;
                Time = 0;
                while true
                    Time = tic;
                    if Time >= 0.001
                        break;
                    end
                end
                drawnow limitrate
                if n < Step
                    sX = ((Step-n)*pX+n*X)/Step;
                    sY = ((Step-n)*pY+n*Y)/Step;
                    sZ = ((Step-n)*pZ+n*Z)/Step;
                    
                    [sA1,sA2,sA3,Flag] = XYZtoAngle(sX,sY,sZ);
                    sa1 = deg2rad(sA1);
                    sa2 = deg2rad(sA2);
                    sa3 = deg2rad(sA3);
                    if Flag == 0
                        DrawGraph(sX,sY,sZ,sa1,sa2,sa3)
                    end
                end
            end
            DrawGraph(X, Y, Z, a1, a2, a3)
            pX = X;
            pY = Y;
            pZ = Z;
        else
            DrawGraph(X, Y, Z, a1, a2, a3)
            count = 1;
            pX = X;
            pY = Y;
            pZ = Z;
        end
        
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
        if abs(a1) > 150
            disp("A1이 유효범위가 아님");
        end
        if abs(a2) > 150
            disp("A2이 유효범위가 아님");
        end
        if abs(a3) > 150
            disp("A3이 유효범위가 아님");
        end
    end
    Str = ['A1 : ',num2str(A1),' A2 : ',num2str(A2),' A3 : ',num2str(A3)];
    disp(Str);
    
end





