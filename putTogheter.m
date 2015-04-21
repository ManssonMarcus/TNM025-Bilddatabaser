
lineImg = [];
resultImg = [];
imgSize = 100;

for i = 1:size(cropDatabase, 1)
    for j = 1:size(picDatabase,1) 
         if cropDatabase(i,:) == picDatabase(j, :) 
              img = imread( ['TestBasen/' num2str(j) '.jpg']);
              img = imresize(img, [imgSize imgSize]);
              lineImg = [lineImg img];
              break;
         end             
    end
   if size(lineImg,2)== 1300
      resultImg = [resultImg ; lineImg];
      lineImg =[];
   end    
    %resultImg = [resultImg ; lineImg];
    %lineImg = [];
end    
