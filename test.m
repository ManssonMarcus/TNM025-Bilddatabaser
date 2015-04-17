clear all

%for i = 1:1000
%   img = imread( ['../2015/Databases/animal/' num2str(i) '.jpg']);
%   imgKuler = mean( reshape( img, [], 3 ), 1 );
%   kulerArray = [kulerArray ; imgKuler];
%end

%Him = rgb2hsv(testPic);
%colorRGB = Him(:,:,1); from 0 to 1: resulting color varies red, yellow, green, blue, …
%saturation = Him(:,:,2); = 0, colors are unsaturated (gray), H(:,:,2) = 1, fully saturated
%intensity = Him(:,:,3); = 0, black and H(:,:,3) = 1, white

% for i = 1:1000
%    img = imread(['../2015/Databases/animal/' num2str(i) '.jpg']);
%    picData = rgb2hsv(img);
%    picHue = mean(mean(picData(:,:,1)));
%    picSaturation = mean(mean(picData(:,:,2)));
%    picIntensity = mean(mean(picData(:,:,3)))

 %  picDatabase = [picDatabase; picHue, picSaturation, picIntensity];
%end

contents = dir('../MiniBasen/*.jpg'); % or whatever the filename extension is

%%

clear all

contents = dir('TestBasen/*.jpg'); % or whatever the filename extension is

picDatabase = zeros(numel(contents),7);

for i = 1:numel(contents)
  filename = contents(i).name;
  % Open the file specified in filename, do your processing...
  [path, name] = fileparts(filename);
  imgPath = strcat('TestBasen','\',filename);
  img = imread(imgPath);
 
  img_hsv = rgb2hsv(img);
 
  picHue = mean(mean(img_hsv(:,:,1)))
  %mean_sat = mean(mean(img_hsv(:,:,2)));
  %mean_val = mean(mean(img_hsv(:,:,3)));
 
    %Red
   if(picHue >= 0 && picHue < (30/360) || picHue >= (320/360) && picHue <= (360/360))
       picDatabase(i,1) = 1;

   %Orange
   elseif(picHue >= (30/360) && picHue < (50/360))
       picDatabase(i,2) = 1;

   %Yellow
   elseif(picHue >= (50/360) && picHue < (70/360))
       picDatabase(i,3) = 1;
       
   %Green
   elseif(picHue >= (70/360) && picHue < (160/360))
       picDatabase(i,4) = 1;

   %Cyan
   elseif(picHue >= (160/360) && picHue < (190/360))
       picDatabase(i,5) = 1;

   %Blue
   elseif(picHue >= (190/360) && picHue < (280/360))
       picDatabase(i,6) = 1;

   %Magenta
   else
       picDatabase(i,7) = 1;
 
   end
end
%%
clear all

contents = dir('TestBasen/*.jpg'); % or whatever the filename extension is

picDatabase = zeros(numel(contents),7);

for i = 1:numel(contents)
  filename = contents(i).name;
  % Open the file specified in filename, do your processing...
  [path, name] = fileparts(filename);
  imgPath = strcat('TestBasen','\',filename);
  img = imread(imgPath);

  meanRGB = mean(reshape( img, [], 3 ), 1 )./255;

  hsv_values = mean_RGB2HSV(meanRGB);
  picHue = hsv_values(1,1);
  
    %Red
   if(picHue >= 0 && picHue < (30) || picHue >= (320) && picHue <= (360))
       picDatabase(i,1) = 1;

   %Orange
   elseif(picHue >= (30) && picHue < (50))
       picDatabase(i,2) = 1;

   %Yellow
   elseif(picHue >= (50) && picHue < (70))
       picDatabase(i,3) = 1;
       
   %Green
   elseif(picHue >= (70) && picHue < (160))
       picDatabase(i,4) = 1;

   %Cyan
   elseif(picHue >= (160) && picHue < (190))
       picDatabase(i,5) = 1;

   %Blue
   elseif(picHue >= (190) && picHue < (280))
       picDatabase(i,6) = 1;

   %Magenta
   else
       picDatabase(i,7) = 1;
 
   end
end