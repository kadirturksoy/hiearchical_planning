%generating basic dataset
dataSet = ceil(10*rand([1000,1000]));

tic
%single linkage
[pies,lambda]=slink(dataSet);
toc

% tic
% % %complete linkage
% [pies,lambda]=clink(dataSet);
% toc


