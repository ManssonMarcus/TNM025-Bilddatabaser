
%contents = dir('TestBasen/*.jpg'); % location of database
contents = dir('../Databases/andy_warhol/*.jpg'); % <---innerhåller märkliga bilder med 9 kanaler....!!

picDatabase = [];

for i = 1:numel(contents)
  %Extract image from database
  filename = contents(i).name;
  [path, name] = fileparts(filename);
  %imgPath = strcat('TestBasen','\',filename);
  
  imgPath = strcat('../Databases/andy_warhol','\',filename);
  
  
  img = imread(imgPath);
  
  if(ndims(img) < 3)
      img = cat(3,img,img,img);
  end
    
 
  %Color classification
  colorRow = ColorClassification(img);
  
  %Saturation classification
  saturationRow = SaturationClassification(img);

  %Brightness classification
  brightnessRow =  BrightnessClassification(img);
  
  dataRow = [colorRow saturationRow brightnessRow ];
  
  
  picDatabase = [picDatabase; dataRow];
  
end