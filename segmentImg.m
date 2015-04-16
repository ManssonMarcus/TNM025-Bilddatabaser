
bob = imread('BobMarley.jpg');

bobY = size(bob,1);

bobX = size(bob,2);


partKulerArray = [];

for i = 0:100:bobX
   for j = 0:100:bobY
      
       part = imcrop(bob,[i j 100 100]);
           
       partKuler = mean( reshape( part, [], 3 ), 1 );
       
       partKulerArray = [partKulerArray ; partKuler];
   end
    
end
%{
result2 = [];

for k = 1:size(partKulerArray,1)
    
    tempPart = round(partKulerArray(k,1)) + round(partKulerArray(k,2))+round(partKulerArray(k,3));
    
    for m =1:1000
       partKuler = round(kulerArray(m,1))+ round(kulerArray(m,2))+round(kulerArray(m,3));
       if -30 < partKuler - tempPart < 30
            img = imread( ['../2015/Databases/animal/' num2str(m) '.jpg']);
            img = imresize(img, [100 100])
            result = [result  img];
            break;
       end 
       partKuler = 0;
    end
    result2 = [result2 ; result];
    tempPart = 0;
end
}%
