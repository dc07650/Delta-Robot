function[obj,flag] = setupSerial(comPort)
% It accept as the entry value, the index of the serial port
% Arduino is connected to, and as output values it returns the serial 
% element obj and a flag value used to check if when the script is compiled
% the serial element exists yet.
flag = 1;
% Initialize Serial object
obj = serial(comPort);
fprintf('.');
set(obj,'DataBits',8);
fprintf('.');
set(obj,'StopBits',1);
fprintf('.');
set(obj,'BaudRate',9600);
fprintf('.');
set(obj,'Parity','none');
fprintf('.');
fopen(obj);
fprintf('.');
a = 'b';
while (a~='a') 
    a=fread(obj,1,'uchar');
    fprintf('.');
end
if (a=='a')
    fprintf('\n');
    disp('Serial read');
end
fprintf(obj,'%c','a');
mbox = msgbox('Serial Communication Established'); uiwait(mbox);
fscanf(obj,'%u');
end
