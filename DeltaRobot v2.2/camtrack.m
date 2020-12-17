clear all;
clc

%% Set webcam connection
cam = webcam(1);
% preview(cam);

%% Inifinite loop with breaking function
finish=false;
set(gcf,'CurrentCharacter','@'); % set to a dummy character

x_ulim = 200;
x_tlim = 250;
y_ulim = 100;
y_tlim = 150;

subplot(1, 2, 2);
plot(0,0);
xlim([0 640]);
ylim([0 480]);
rectangle('Position',[x_ulim,y_ulim,x_tlim,y_tlim],'LineWidth',2,'LineStyle','-', 'EdgeColor', 'g');

while ~finish
  % do things in loop...
  
  img = snapshot(cam);
  
  gray_img = rgb2gray(img);
   
  [centers,radii] = imfindcircles(img,[20 40],'ObjectPolarity','bright','Sensitivity',0.9)

  
  
  dim = size(radii);
  disp(dim);
  if dim(1) == 1
      fig = subplot(1, 2, 2);
      plot(centers(1), centers(2), 'ro', 'MarkerSize', 30, 'LineWidth', 10, 'MarkerFaceColor', 'y');
      rectangle('Position',[x_ulim,y_ulim,x_tlim,y_tlim],'LineWidth',2,'LineStyle','-', 'EdgeColor', 'g');
      xlim([0 640]);
      ylim([0 480]);
      if (x_ulim < centers(1) && centers(1)) < x_tlim  && (y_ulim < centers(2) && centers(2) < y_tlim)
          disp("Capture");          
      end
  end
 
  subplot(1, 2, 1);
  imshow(img);
  rectangle('Position',[x_ulim,y_ulim,x_tlim,y_tlim],'LineWidth',2,'LineStyle','-', 'EdgeColor', 'g');
 
  pause(0.005);
  % check for keys
  k=get(gcf,'CurrentCharacter');
  if k~='@' % has it changed from the dummy character?
    set(gcf,'CurrentCharacter','@'); % reset the character
    % now process the key as required
    if k=='q', finish=true; disp('Terminated'); end
  end
end

%% Terminate
close all;
clear;
