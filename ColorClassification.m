function [ picHue ] = ColorClassification( img )
%ColorClassification Summary of this function goes here
%   Detailed explanation goes here

    %[x, y, z] = size(img);
    %imgSize = x * y;
    
    %FIX BETTER BINS FOR COLORS!!
    
    %BINS FOR COLOR CLASSIFICATION
%     img = rgb2hsv(img); % <--- This may be done before this function is called
%     colorBin = zeros(1,11);
%     colorBin(1) =  sum(sum(0.083  >= img(:,:,1) | img(:,:,1) < 0.9167))/imgSize;
%     colorBin(2) =  sum(sum(0.1250 >= img(:,:,1) &  img(:,:,1) > 0.083 ))/imgSize;
%     colorBin(3) =  sum(sum(0.2083 >= img(:,:,1) &  img(:,:,1) > 0.1250))/imgSize;
%     colorBin(4) =  sum(sum(0.4167 >= img(:,:,1) &  img(:,:,1) > 0.2083))/imgSize;
%     colorBin(5) =  sum(sum(0.4583 >= img(:,:,1) &  img(:,:,1) > 0.4167))/imgSize;
%     colorBin(6) =  sum(sum(0.5417 >= img(:,:,1) &  img(:,:,1) > 0.4583))/imgSize;
%     colorBin(7) =  sum(sum(0.5833 >= img(:,:,1) &  img(:,:,1) > 0.5417))/imgSize;
%     colorBin(8) =  sum(sum(0.75   >= img(:,:,1) &  img(:,:,1) > 0.5833))/imgSize;
%     colorBin(9) =  sum(sum(0.7917 >= img(:,:,1) &  img(:,:,1) > 0.75  ))/imgSize;
%     colorBin(10) = sum(sum(0.875  >= img(:,:,1) &  img(:,:,1) > 0.7917))/imgSize;
%     colorBin(11) = sum(sum(0.9167 >= img(:,:,1) &  img(:,:,1) > 0.875 ))/imgSize;
%     
%     
%     colorBin = colorBin * 100;
%    
    %colorRow = zeros(1,7);
    
    
    %MEAN COLOR CLASSIFICATION (return picHue)
     meanRGB = mean(mean(img))./ 255;
    
    hsv_values = mean_RGB2HSV(meanRGB);
    picHue = hsv_values(1);
   

end

