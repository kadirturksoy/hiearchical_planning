
list = ['frame0000';
    'frame0005';
    'frame0010';
    'frame0015';
    'frame0020';
    'frame0025';
    'frame0030';
    'frame0035';
    'frame0040';
    'frame0045';
    'frame0050';
    'frame0055';
    'frame0060';
    'frame0065';
    'frame0070';
    'frame0075';
    'frame0080';
    'frame0085';
    'frame0090';
    'frame0095'];

for i=1:20
    im = imread(['images/' list(i,:) '.jpg']);
    im = im(169:310,:,:);
    imwrite(im,['images/rgb_' num2str(i+9) '.jpg'])
end