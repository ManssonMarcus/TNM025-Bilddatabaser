function [ saturationRow ] = SaturationClassification( img )
%SaturationClassification Summary of this function goes here
%   Detailed explanation goes here


    %saturationRow = zeros(1,5);
    
    meanRGB = mean(mean(img));
 
    hsv_values = mean_RGB2HSV(meanRGB);
    picSat = hsv_values(2);
    
    %Test for "match diff"
    saturationRow = picSat * 255;
  

end

