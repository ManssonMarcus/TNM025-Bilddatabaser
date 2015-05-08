function [ satBin ] = SaturationClassification( img )
%SaturationClassification Summary of this function goes here
%   Detailed explanation goes here
    
    [x, y, z] = size(img);
    imgSize = x * y;
  
    %BINS FOR SATURATION CLASSIFICATION
    img = rgb2hsv(img); % <--- This may be done before this function is called
    satBin = zeros(1,10);
    satBin(1) = sum(sum(0.1 >= img(:,:,2)))/imgSize;
    satBin(2) = sum(sum(0.2 >= img(:,:,2) & img(:,:,2) > 0.1))/imgSize;
    satBin(3) = sum(sum(0.3 >= img(:,:,2) & img(:,:,2) > 0.2))/imgSize;
    satBin(4) = sum(sum(0.4 >= img(:,:,2) & img(:,:,2) > 0.3))/imgSize;
    satBin(5) = sum(sum(0.5 >= img(:,:,2) & img(:,:,2) > 0.4))/imgSize;
    satBin(6) = sum(sum(0.6 >= img(:,:,2) & img(:,:,2) > 0.5))/imgSize;
    satBin(7) = sum(sum(0.7 >= img(:,:,2) & img(:,:,2) > 0.6))/imgSize;
    satBin(8) = sum(sum(0.8 >= img(:,:,2) & img(:,:,2) > 0.7))/imgSize;
    satBin(9) =sum(sum(0.9 >= img(:,:,2) & img(:,:,2) > 0.8))/imgSize;
    satBin(10) = sum(sum(img(:,:,2) > 0.9))/imgSize;
    
    
    satBin = satBin * 100;
    
    %MEAN SATURATION CLASSIFICATION(return picSat)
%     meanRGB = mean(mean(img));
%  
%     hsv_values = mean_RGB2HSV(meanRGB);
%     picSat = hsv_values(2);
    
    %Test for "match diff"
%     picSat = picSat * 100;
  

end

