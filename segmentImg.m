
img = imread('barack.jpg');
imgY = size(img,1);
imgX = size(img,2);
cropDatabase = [];

%cropPatternDatabase = [];

cropSize = 50;

Rx = rem(imgX, cropSize);
Ry = rem(imgY, cropSize);

imgX = imgX - Rx;
imgY = imgY - Ry;

for i = 0:cropSize:imgY-cropSize
   
   %Progress of loadingtime-ish
   waitbar(i/imgY)
   
   for j = 0:cropSize:imgX-cropSize
      cropPart = imcrop(img,[j i cropSize cropSize]);
      
      %BWcrop = im2bw(cropPart,0.5);
      %BWcrop = imresize(BWcrop, [cropSize cropSize]);
      
      %cropPatternDatabase = [cropPatternDatabase ; BWcrop];
      
      %Color classification
      colorRow = ColorClassification(cropPart);
      
      %Saturation classification
      saturationRow = SaturationClassification(cropPart);

      %Brightness classification
      brightnessRow =  BrightnessClassification(cropPart);
  
      dataRow = [colorRow saturationRow brightnessRow ];

      cropDatabase = [cropDatabase ; dataRow i j];
      

   end
    
end
