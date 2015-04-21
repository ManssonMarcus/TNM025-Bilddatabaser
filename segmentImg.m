

img = imread('BobMarley.jpg');

imgY = size(img,1);

imgX = size(img,2);

cropDatabase = [];

Red = [1 0 0 0 0 0 0];
Orange = [0 1 0 0 0 0 0];
Yellow = [0 0 1 0 0 0 0];
Green = [0 0 0 1 0 0 0];
Cyan = [0 0 0 0 1 0 0];
Blue = [0 0 0 0 0 1 0];
Magenta = [0 0 0 0 0 0 1];

%partKulerArray = [];

for i = 0:100:imgX
    n = 0;
   for j = 0:100:imgY
       n = n+1;
       cropPart = imcrop(img,[i j 100 100]);
           
       %partKuler = mean( reshape( part, [], 3 ), 1 );
       meanRGB = mean(reshape( cropPart, [], 3 ), 1 )./255;

       hsv_values = mean_RGB2HSV(meanRGB);
       picHue = hsv_values(1,1);
       
       %Red
       if(picHue >= 0 && picHue < (30) || picHue >= (320) && picHue <= (360))
           
           cropDatabase = [cropDatabase ; Red ];
           %picDatabase(i,1) = 1;

       %Orange
       elseif(picHue >= (30) && picHue < (50))
           cropDatabase = [cropDatabase ; Orange ];
           %picDatabase(i,2) = 1;

       %Yellow
       elseif(picHue >= (50) && picHue < (70))
           cropDatabase = [cropDatabase ; Yellow ];
           %picDatabase(i,3) = 1;

       %Green
       elseif(picHue >= (70) && picHue < (160))
           cropDatabase = [cropDatabase ; Green ];
           %picDatabase(i,4) = 1;

       %Cyan
       elseif(picHue >= (160) && picHue < (190))
           cropDatabase = [cropDatabase ; Cyan ];
           %picDatabase(i,5) = 1;

       %Blue
       elseif(picHue >= (190) && picHue < (280))
           cropDatabase = [cropDatabase ; Blue ];
           %picDatabase(i,6) = 1;

       %Magenta
       else
           cropDatabase = [cropDatabase ; Magenta ];
           %picDatabase(i,7) = 1;

       end
   
   end
    
end
