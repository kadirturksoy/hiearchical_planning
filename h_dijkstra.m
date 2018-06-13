s_node = [1 1 1];
f_node = [1 2 1];

% find common ancestor

h_level = 1;

while h{h_level,s_node(h_level+1)}.NodeList(s_node(h_level)).Parent ~= h{h_level,f_node(h_level+1)}.NodeList(f_node(h_level)).Parent
    h_level = h_level + 1;
end

common_ancestor = h{h_level,s_node(h_level+1)}.NodeList(s_node(h_level)).Parent;

prev_path = [common_ancestor];

path_cell = [];
    
for i=1:h_level
    
    count = 0;
    
    current_level = h_level-i+1;
    
    start = [-1 s_node(current_level)];
    if size(prev_path,2) == 1
        finish = [-1 f_node(current_level)];
        g = h{current_level,prev_path(1)};
    
        path = hl_dijkstra(start,finish,g);
        
        prev_path = path;
        
        path_cell{current_level,1} = path;
        
        continue;
    else
        finish = [prev_path(2) -1];
    end
    
    g = h{current_level,prev_path(1)};
    
    path_cell{current_level,1} = hl_dijkstra(start,finish,g);
    path = path_cell{current_level,1};
    
    
    for j=2:size(prev_path,2)-1
        
        start = [prev_path(j-1) path(end)];
        finish = [prev_path(j+1) -1];
        g = h{current_level,prev_path(j)};
        path_cell{current_level,j} = hl_dijkstra(start,finish,g);
        path = [ path path_cell{current_level,j}];
        
    end
    
    start = [prev_path(end-1) path(end)];
    finish = [prev_path(end) f_node(current_level)];
    g = h{current_level,prev_path(end)};
    
    finish(1) = -1;
    
    path_cell{current_level,size(path_cell,2)+1} = hl_dijkstra(start,finish,g);
    path = [path path_cell{current_level,end}];
    
    prev_path = path;
    
end

for i=1:size(path_cell,1)
    str = ['Level ' num2str(size(path_cell,2)-i) ': '];
    for j=1:size(path_cell,2)
        if size(path_cell{size(path_cell,2)-i+1,j},1) ~= 0
            str = [str '[' ];
            str = [str  num2str(path_cell{size(path_cell,2)-i+1,j})];
            str = [str ']'];
        end
    end
    disp(str)
    
end

