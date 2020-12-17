clc
clear all
disp('Start');
%%
% Save the serial port name in comPort variable.

comPort = 'COM6';
%% 
% It creates a serial element calling the function "stupSerial"

if(~exist('serialFlag','var'))
    [arduino,serialFlag] = setupSerial(comPort);
end
disp('Connected');

%%

while (1)
    str = input('Input coordinate(or Command): ', 's');
    disp(str);
    fprintf(arduino, str);
    pause(1);
end
disp('Terminated');
% To remeber: when you are satisfied with you measurement click on the 
% "stop" button in the bottom left corner of the figure. Now you have to
% close the serial object "Arduino" using the command "fclose(arduino)",
% and close the h figure typing "close(h)". Now in "tcdata" variable you
% have your real time data. 





