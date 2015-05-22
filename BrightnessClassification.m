function [ valBin ] = BrightnessClassification( img )
%BrightnessCalssification Summary of this function goes here
%   Detailed explanation goes here


    [x, y, z] = size(img);
    imgSize = x * y;
  
    %BINS FOR BRIGHTNESS CLASSIFICATION
    img = rgb2hsv(img);
    valBin = zeros(1,11);
    valBin(1) = sum(sum(0.1 >= img(:,:,3)))/imgSize;
    valBin(2) = sum(sum(0.2 >= img(:,:,3) & img(:,:,3) > 0.1))/imgSize;
    valBin(3) = sum(sum(0.3 >= img(:,:,3) & img(:,:,3) > 0.2))/imgSize;
    valBin(4) = sum(sum(0.4 >= img(:,:,3) & img(:,:,3) > 0.3))/imgSize;
    valBin(5) = sum(sum(0.5 >= img(:,:,3) & img(:,:,3) > 0.4))/imgSize;
    valBin(6) = sum(sum(0.6 >= img(:,:,3) & img(:,:,3) > 0.5))/imgSize;
    valBin(7) = sum(sum(0.7 >= img(:,:,3) & img(:,:,3) > 0.6))/imgSize;
    valBin(8) = sum(sum(0.8 >= img(:,:,3) & img(:,:,3) > 0.7))/imgSize;
    valBin(9) =sum(sum(0.9 >= img(:,:,3) & img(:,:,3) > 0.8))/imgSize;
    valBin(10) = sum(sum(img(:,:,3) > 0.9))/imgSize;
    
    
    valBin = valBin * 100;
 
    %MEAN BRIGHTNESS CLASSIFICATION
    brightnessRow = zeros(1,5);
    
    meanRGB = mean(mean(img));
 
    hsv_values = mean_RGB2HSV(meanRGB);
    %Put mean value in last bin
    valBin(11) = hsv_values(3);
    %picVal = hsv_values(3);
  

end

