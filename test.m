clear all


 
kulerArray = [];

for i = 1:1000
   img = imread( ['../2015/Databases/animal/' num2str(i) '.jpg']);
   imgKuler = mean( reshape( img, [], 3 ), 1 );
   kulerArray = [kulerArray ; imgKuler];
end


 