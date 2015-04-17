
bob = imread('BobMarley.jpg');

bobY = size(bob,1);

bobX = size(bob,2);


partKulerArray = [];

for i = 0:200:bobX
   for j = 0:200:bobY
      
       part = imcrop(bob,[i j 200 200]);
           
       partKuler = mean( reshape( part, [], 3 ), 1 );
       
       partKulerArray = [partKulerArray ; partKuler];
       
       
   end
    
end

result = [];



for k = 1:size(partKulerArray,1)

    for m = 1:1000
       R = partKulerArray(k,1)/kulerArray(m,1);
       G = partKulerArray(k,2)/kulerArray(m,2);
       B = partKulerArray(k,3)/kulerArray(m,3);
      
       if (1.1 > R)&& (R > 0.9) && (1.1 > G)&& (G > 0.9) && (1.1 > B)&& (B > 0.9)
            %img = imread( ['../2015/Databases/animal/' num2str(m) '.jpg']);
            %img = imresize(img, [50 50]);
            result = [result  m];
            %img = [];
            
            break;  
       end 
       
    end

end

%size(result,2)
result1 = [];
resultFinal = [];
for d = 1:8
    for c = 1:size(result,2)
    
        img = imread( ['../2015/Databases/animal/' num2str(c) '.jpg']);
        img = imresize(img, [50 50]);
        result1 = [result1 img];
    
    end  
    %result1 = imresize(result1, [50 2000]);
    resultFinal = [resultFinal ; result1];
    result1 = [];
end
