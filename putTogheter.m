
imgSize = cropSize;


%Grundbildens storlek i 0:or
imgResult =(label2rgb(zeros(imgY,imgX)));


%simVec = zeros(size(picDatabase(:,1)));
difVec = ones(size(picDatabase(:,1)))* 500;
imgDatabase = picDatabase;

%Weights for classifications (larger value = less important)
colorWeight = 1;
satWeight = 1;
valWeight = 1;

%For loadingtime
wait= 1;

for i =  randperm(size(cropDatabase, 1)) 
    
    %Progress of loadingtime-ish
    wait = wait+1;
    waitbar(wait/(size(cropDatabase, 1)));
    
    %place to put the images
    putX = int64(cropDatabase(i,size(cropDatabase(1,:),2)-1));
    putY = int64(cropDatabase(i,size(cropDatabase(1,:),2)));
   
    %Loop through all images in database
    for j = 1:size(imgDatabase,1) 
        
        %calculate difference in crop and image values
        difference = abs( cropDatabase(i,1:size(cropDatabase(1,:),2)-2) - imgDatabase(j,:));
        
        totalDif = sum(difference);
        difVec(j) = totalDif; 
                 
    end
    
    %Take the the index of the image that has highest similarity    
    
    [M,index] = min(difVec); 
    filename = contents(index).name;
    [path, name] = fileparts(filename);
    
    %Make sure we dont reapeat an image
    imgDatabase(index,:) = NaN;
    
    imgPath = strcat('../2015/Databases/colorful/','\',filename);
    
    img = imread(imgPath);
    img = imresize(img, [imgSize imgSize]);
    
    
    if(ndims(img) < 3)
      img = cat(3,img,img,img);
    end

    %Place images on the correct place
    imgResult((putX+1):(putX+cropSize),(putY+1):(putY+cropSize),:)=img;

end    
imshow(imgResult);
