
lineImg = [];
resultImg = [];
imgSize = 25;
%simVec = zeros(size(picDatabase(:,1)));
difVec = ones(size(picDatabase(:,1)))* 300;

for i = 1:size(cropDatabase, 1)
    
    
    %RIGHT NOW IT SEEMS LIKE IT DOESENT GET DIFFERENT MINIMUM
    %INDEX...WIERD!
    
    
    %Loop through all images in database
    for j = 1:size(picDatabase,1) 
        %calculate difference in crop and image values
        
        difference = [abs( cropDatabase(i,1) - picDatabase(j,1) ) abs( cropDatabase(i,2) - picDatabase(j,2) ) abs( cropDatabase(i,3) - picDatabase(j,3))];
        totalDif = abs(difference(1)+difference(2)+difference(3));
        difVec(j) = totalDif; 
        
        %Check similarity between the cropped image and the images in the database
        %similarity = dot(cropDatabase(i,:),picDatabase(j,:));
        %simVec(j) = similarity;          
    end
    
    %Take the the index of the image that has highest similarity
    %[M,index] = max(simVec(:));    
 
    [M,index] = min(difVec); 
    
    picDatabase(index,1) = picDatabase(index,1) + 100;
    picDatabase(index,2) = picDatabase(index,2) + 100;
    picDatabase(index,3) = picDatabase(index,3) + 100;
    
    filename = contents(index).name;
    [path, name] = fileparts(filename);
    imgPath = strcat('../2015/Databases/cat/','\',filename);
    img = imread(imgPath);
    img = imresize(img, [imgSize imgSize]);
    lineImg = [lineImg img];
    
    %if the size of lineImg reaches Original width, start new row
   if size(lineImg,2)== 1600
      resultImg = [resultImg ; lineImg];
      lineImg =[];
   end    
   
end    


imshow(resultImg);