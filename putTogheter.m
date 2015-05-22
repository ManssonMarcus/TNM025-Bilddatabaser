
lineImg = [];
resultImg = [];
imgSize = cropSize;
%simVec = zeros(size(picDatabase(:,1)));
difVec = ones(size(picDatabase(:,1)))* 500;
imgDatabase = picDatabase;

%Weights for classifications (larger value = less important)
colorWeight = 1;
satWeight = 1;
valWeight = 1;

for i = 1:size(cropDatabase, 1)
   
    %Loop through all images in database
    for j = 1:size(imgDatabase,1) 
        
        %calculate difference in crop and image values
        difference = abs( cropDatabase(i,:) - imgDatabase(j,:));
        
        %Weight the different parts of the difference
        %totalDif = difference(1) * colorWeight + difference(2) * satWeight + difference(3) * valWeight;
        
        totalDif = sum(difference);
        difVec(j) = totalDif; 
        
        %Check similarity between the cropped image and the images in the database
        %similarity = dot(cropDatabase(i,:),picDatabase(j,:));
        %simVec(j) = similarity;          
    end
    
    %Take the the index of the image that has highest similarity
    %[M,index] = max(simVec(:));    
    
    [M,index] = min(difVec); 
    filename = contents(index).name;
    [path, name] = fileparts(filename);
    
    %Make sure we dont reapeat an image
    imgDatabase(index,:) = NaN;
    
    %imgPath = strcat('TestBasen','\',filename);
    
    imgPath = strcat('../Databases/Beach/','\',filename);
    
    img = imread(imgPath);
    img = imresize(img, [imgSize imgSize]);
    
    
    if(ndims(img) < 3)
      img = cat(3,img,img,img);
    end
  
    lineImg = [lineImg img];
    
    %if the size of lineImg reaches Original width, start new row
   if size(lineImg,2)== imgX
      resultImg = [resultImg ; lineImg];
      lineImg =[];
   end    

end    


imshow(resultImg);