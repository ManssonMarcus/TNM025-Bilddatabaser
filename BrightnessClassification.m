function [ brightnessRow ] = BrightnessClassification( img )
%BrightnessCalssification Summary of this function goes here
%   Detailed explanation goes here

    %brightnessRow = zeros(1,5);
    
    meanRGB = mean(mean(img));
 
    hsv_values = mean_RGB2HSV(meanRGB);
    picVal = hsv_values(3);
  
    %test for "check diff"
    brightnessRow = picVal;
  
    
    %Create  value bins (19) , from dark to bright
    
%    if(picVal >= 0 && picVal < 51 )
%        brightnessRow(1) = 1;
% 
%    elseif (picVal >= 51 && picVal < 102 )
%        brightnessRow(2) = 1;
% 
%    elseif(picVal >= 102 && picVal < 153 )
%        brightnessRow(3) = 1;
%        
%    elseif(picVal >= 153 && picVal <  204 )
%       brightnessRow(4) = 1;   
%       
%    else
%       brightnessRow(5) = 1;
%  
%    end


end

