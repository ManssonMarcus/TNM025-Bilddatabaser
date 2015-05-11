
function [ colorBin ] = ColorClassification( img, img_2 )
%ColorClassification Summary of this function goes here
%   Detailed explanation goes here

    [x, y, z] = size(img);
    imgSize = x * y;
    
    %FIX BETTER BINS FOR COLORS!!
    
    %BINS FOR COLOR CLASSIFICATION
    img = rgb2hsv(img); % <--- This may be done before this function is called
    colorBin = zeros(1,11);

    %if(ndims(img_2) == 3)
        colorBin(1) =  sum(sum(0.083  >= img(:,:,1) | img(:,:,1) > 0.9167))/imgSize;
        colorBin(2) =  sum(sum(0.1250 >= img(:,:,1) &  img(:,:,1) > 0.083 ))/imgSize;
        colorBin(3) =  sum(sum(0.2083 >= img(:,:,1) &  img(:,:,1) > 0.1250))/imgSize;
        colorBin(4) =  sum(sum(0.4167 >= img(:,:,1) &  img(:,:,1) > 0.2083))/imgSize;
        colorBin(5) =  sum(sum(0.4583 >= img(:,:,1) &  img(:,:,1) > 0.4167))/imgSize;
        colorBin(6) =  sum(sum(0.5417 >= img(:,:,1) &  img(:,:,1) > 0.4583))/imgSize;
        colorBin(7) =  sum(sum(0.5833 >= img(:,:,1) &  img(:,:,1) > 0.5417))/imgSize;
        colorBin(8) =  sum(sum(0.75   >= img(:,:,1) &  img(:,:,1) > 0.5833))/imgSize;
        colorBin(9) =  sum(sum(0.7917 >= img(:,:,1) &  img(:,:,1) > 0.75  ))/imgSize;
        colorBin(10) = sum(sum(0.875  >= img(:,:,1) &  img(:,:,1) > 0.7917))/imgSize;
        colorBin(11) = sum(sum(0.9167 >= img(:,:,1) &  img(:,:,1) > 0.875 ))/imgSize;

        %Normalfördela färger
        colorBin(1) = colorBin(1) + colorBin(2)*0.5 + colorBin(11)*0.5;
        colorBin(2) = colorBin(2) + colorBin(3)*0.5 + colorBin(1)*0.5;
        colorBin(3) = colorBin(3) + colorBin(4)*0.5 + colorBin(2)*0.5;
        colorBin(4) = colorBin(4) + colorBin(5)*0.5 + colorBin(3)*0.5;
        colorBin(5) = colorBin(5) + colorBin(6)*0.5 + colorBin(4)*0.5;
        colorBin(6) = colorBin(6) + colorBin(7)*0.5 + colorBin(5)*0.5;
        colorBin(7) = colorBin(7) + colorBin(8)*0.5 + colorBin(6)*0.5;
        colorBin(8) = colorBin(8) + colorBin(9)*0.5 + colorBin(7)*0.5;
        colorBin(9) = colorBin(9) + colorBin(10)*0.5 + colorBin(8)*0.5;
        colorBin(10) = colorBin(10) + colorBin(11)*0.5 + colorBin(9)*0.5;
        colorBin(11) = colorBin(11) + colorBin(1)*0.5 + colorBin(10)*0.5;

        colorBin = colorBin * 100;
   
%     else
%         for i = 1:11
%             colorBin(i) = 10;
%         end
%     end

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

