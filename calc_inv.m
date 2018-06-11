
dataSet = [];

for i=1:29
    
    str = ['images/rgb_' num2str(i) '.jpg'];
    
    im = imread(str);
    
    dataSet = [dataSet;invariant_desc(rgb2gray(im))];
    
    
end

t = linkage(dataSet,'single');
dendrogram(t);