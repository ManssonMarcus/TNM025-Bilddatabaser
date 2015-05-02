clear all

contents = dir('../2015/Databases/cat/*.jpg'); % location of database

picDatabase = [];

for i = 1:numel(contents)
  %Extract image from database
  filename = contents(i).name;
  [path, name] = fileparts(filename);
  imgPath = strcat('../2015/Databases/cat/','\',filename);
  img = imread(imgPath);
  
  if  (ndims(img) < 3)
      img = repmat(img,[1 1 3]);
      img = cat(3,img,img,img);
  end     
  
  %Color classification
  colorRow = ColorClassification(img);
  
  %Saturation classification
  saturationRow = SaturationClassification(img);

  %Brightness classification
  brightnessRow =  BrightnessClassification(img);
  
  dataRow = [colorRow saturationRow brightnessRow ];
  
  
  picDatabase = [picDatabase; dataRow 0];
  
end