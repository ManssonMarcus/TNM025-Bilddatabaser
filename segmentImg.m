
img = imread('BobMarley.jpg');
imgY = size(img,1);
imgX = size(img,2);
cropDatabase = [];
cropSize = 10;

for i = 0:cropSize:imgY-cropSize
 
   for j = 0:cropSize:imgX-cropSize
      cropPart = imcrop(img,[j i cropSize cropSize]);
       
      %Color classification
      colorRow = ColorClassification(cropPart);
      
      %Saturation classification
      saturationRow = SaturationClassification(cropPart);

      %Brightness classification
      brightnessRow =  BrightnessClassification(cropPart);
  
      dataRow = [colorRow saturationRow brightnessRow ];

      cropDatabase = [cropDatabase ; dataRow ];
 
   end
    
end
