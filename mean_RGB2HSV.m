function [hsv] = mean_RGB2HSV(meanRGB)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

  minRGB = min(meanRGB);
  maxRGB = max(meanRGB);
  v = maxRGB;

  delta = maxRGB - minRGB;
  
  s = delta/maxRGB;
   
  h = 0;  
  
  if(meanRGB(1,1) == maxRGB)
      h = (meanRGB(1,2)-meanRGB(1,3))/delta;
      
  elseif(meanRGB(1,2) == maxRGB)
      h = 2 + (meanRGB(1,3)-meanRGB(1,1))/delta;
      
  else
      h = 4 + (meanRGB(1,1)-meanRGB(1,2))/delta;
      
  end


  h = h*60;
  
  if(h<0)
      h = h+360;
  end

 hsv = [h,s,v];

end

