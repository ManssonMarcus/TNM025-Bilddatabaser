clear all

%contents = dir('TestBasen/*.jpg'); % location of database
contents = dir('../2015/Databases/andy_warhol/*.jpg'); % <---innerh�ller m�rkliga bilder med 9 kanaler....!!

picDatabase = [];

for i = 1:numel(contents)
  %Extract image from database
  filename = contents(i).name;
  [path, name] = fileparts(filename);
  %imgPath = strcat('TestBasen','\',filename);
  
  imgPath = strcat('../2015/Databases/andy_warhol','\',filename);
  
  img = imread(imgPath);
  img_2 = imread(imgPath);
  
  if(ndims(img) < 3)
      img = cat(3,img,img,img);
  end

  %Color classification
  colorRow = ColorClassification(img, img_2);
  
  %Saturation classification
  saturationRow = SaturationClassification(img, img_2);

  %Brightness classification
  brightnessRow =  BrightnessClassification(img);
  
  dataRow = [colorRow saturationRow brightnessRow];
  
  picDatabase = [picDatabase; dataRow];
  
end