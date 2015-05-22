
%contents = dir('TestBasen/*.jpg'); % location of database
contents = dir('../2015/Databases/colorful/*.jpg'); 

picDatabase = [];

%picPatternDatabase = [];

%cropSize = 50;

for i = 1:numel(contents)
  
  %Progress of loadingtime-ish
  waitbar(i/numel(contents)) 
  
  %Extract image from database
  filename = contents(i).name;
  [path, name] = fileparts(filename);
  %imgPath = strcat('TestBasen','\',filename);
  

  imgPath = strcat('../2015/Databases/colorful/','\',filename);
  

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
  
  %the binary pattern of the image
  %BW = im2bw(img,0.5);
  %BW = imresize(BW, [cropSize cropSize]);
  
  %store it in another dB
  %picPatternDatabase = [picPatternDatabase ; BW];
  
end