function [ colorRow] = ColorClassification( img )
%ColorClassification Summary of this function goes here
%   Detailed explanation goes here

    %colorRow = zeros(1,7);
    
    meanRGB = mean(mean(img))./ 255;
    
    

    hsv_values = mean_RGB2HSV(meanRGB);
    picHue = hsv_values(1);
    
    %Test for "match diff"
    colorRow = picHue;
   
  



end

