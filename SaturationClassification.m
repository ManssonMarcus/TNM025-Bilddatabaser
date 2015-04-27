function [ saturationRow ] = SaturationClassification( img )
%SaturationClassification Summary of this function goes here
%   Detailed explanation goes here


    %saturationRow = zeros(1,5);
    
    meanRGB = mean(mean(img));
 
    hsv_values = mean_RGB2HSV(meanRGB);
    picSat = hsv_values(2);
    
    %Test for "match diff"
    saturationRow = picSat * 255;
  
%    
%     %Create  value bins (5) , from saturated to not saturated
%     
%    if(picSat >= 0 && picSat < 51 )
%        saturationRow(1) = 1;
% 
%    elseif (picSat >= 51 && picSat < 102 )
%        saturationRow(2) = 1;
% 
%    elseif(picSat >= 102 && picSat < 153 )
%        saturationRow(3) = 1;
%        
%    elseif(picSat >= 153 && picSat <  204 )
%       saturationRow(4) = 1;
%       
%    else
%       saturationRow(5) = 1;
%  
%    end

end

