clear all

contents = dir('TestBasen/*.jpg'); % location of database

picDatabase = [];

for i = 1:numel(contents)
  %Extract image from database
  filename = contents(i).name;
  [path, name] = fileparts(filename);
  imgPath = strcat('TestBasen','\',filename);
  img = imread(imgPath);
  
  %Color classification
  colorRow = ColorClassification(img);
  
  %Saturation classification
  saturationRow = SaturationClassification(img);

  %Brightness classification
  brightnessRow =  BrightnessClassification(img);
  
  dataRow = [colorRow saturationRow brightnessRow ];
  
  
  picDatabase = [picDatabase; dataRow];
  
end