function [ colorRow] = ColorClassification( img )
%ColorClassification Summary of this function goes here
%   Detailed explanation goes here

    %colorRow = zeros(1,7);
    
    meanRGB = mean(mean(img))./ 255;
    
    

    hsv_values = mean_RGB2HSV(meanRGB);
    picHue = hsv_values(1);
    
    %Test for "match diff"
    colorRow = picHue;
   
  
%     %Red
%    if(picHue >= 0 && picHue < (30) || picHue >= (320) && picHue <= (360))
%       colorRow(1) = 1;
% 
%    %Orange
%    elseif(picHue >= (30) && picHue < (50))
%        colorRow(2) = 1;
% 
%    %Yellow
%    elseif(picHue >= (50) && picHue < (70))
%        colorRow(3) = 1;
%        
%    %Green
%    elseif(picHue >= (70) && picHue < (160))
%       colorRow(4) = 1;
% 
%    %Cyan
%    elseif(picHue >= (160) && picHue < (190))
%        colorRow(5) = 1;
% 
%    %Blue
%    elseif(picHue >= (190) && picHue < (280))
%        colorRow(6) = 1;
% 
%    %Magenta
%    else
%       colorRow(7) = 1;
%  
%    end


end

