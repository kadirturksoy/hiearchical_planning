s_node = [1 1 1];
f_node = [1 2 1];

% find common ancestor

h_level = 1;

while h{h_level,s_node(h_level+1)}.NodeList(s_node(h_level)).Parent ~= h{h_level,f_node(h_level+1)}.NodeList(f_node(h_level)).Parent
    h_level = h_level + 1;
end

h_level
common_ancestor = h{h_level,s_node(h_level+1)}.NodeList(s_node(h_level)).Parent;


prev_path = [common_ancestor];
    
for i=1:h_level
    
    
    current_level = h_level-i+1;
    
    start = [-1 s_node(current_level)];
    if size(prev_path,2) == 1
        finish = [-1 f_node(current_level)];
        g = h{current_level,prev_path(1)};
    
        path = hl_dijkstra(start,finish,g);
        
        prev_path = path;
        
        continue;
    else
        finish = [prev_path(2) -1];
    end
    
    g = h{current_level,prev_path(1)};
    
    path = hl_dijkstra(start,finish,g);
    
    for j=2:size(prev_path,2)-1
        
        start = [prev_path(j-1) path(end)];
        finish = [prev_path(j+1) -1];
        g = h{current_level,prev_path(j)};
        path = [ path hl_dijkstra(start,finish,g)];
        
    end
    
    start = [prev_path(end-1) path(end)];
    finish = [prev_path(end) f_node(current_level)];
    g = h{current_level,prev_path(j)};
    path = [path hl_dijkstra(start,finish,g)];
    
    prev_path = path;
    
       
end




