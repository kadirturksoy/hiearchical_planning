% x	y	en	e[]	l	tn	t	p	cn	c cost

listing = dir('db');

h = [];
tmp_listing = [];

for i=1:size(listing,1)
    
    if listing(i).name(end) ~= '~'
        tmp_listing = [tmp_listing; listing(i)];
    end
end

    
listing = tmp_listing;

for j = 3:size(listing,1)
    
    str = listing(j).name;
    
    i = 2;
    
    l_idx_str = [];
    
    while i < size(str,2)+1 && str(i) ~= '_'
        l_idx_str = [l_idx_str str(i)];
        i = i+1;
    end
    
    l_idx = str2num(l_idx_str);
    
    g_idx_str = [];
    
    i = i+1;
    
    while i < size(str,2)+1
        g_idx_str = [g_idx_str str(i)];
        i = i+1;
    end
    
    g_idx = str2num(g_idx_str);
    
    fileID = fopen(['db/' str],'r');

    formatSpec = '%f';

    line = fgets(fileID);

    node_list = [];
    edge_list = [];

    n_idx = 0;


    while line ~= -1

        n_idx = n_idx + 1;

        %parse
        line = str2num(line);

        x = line(1);
        y = line(2);
        en = line(3);

        e = [];

        count = 4;

        for i=1:en
            e = [e line(count) line(count+1) line(count+2)];  
            count = count + 1;
            count = count + 1;
            count = count + 1;
        end

        l = line(count);
        count = count + 1;

        tn = line(count);
        count = count + 1;

        t = [];

        for i=1:tn
            t = [t; line(count) line(count+1) line(count+2)];
            count = count + 1;
            count = count + 1;
            count = count + 1;
        end

        p = line(count);
        count = count + 1;

        cn = line(count);
        count = count + 1;

        c = [];

        for i=1:cn
            c = [c line(count)];
            count = count + 1;
        end
        
        cost = [line(count) line(count+1)];

        tmp_n = Node([x y],0,t,l,p,c,cost);
        node_list = [node_list tmp_n];

        for i=1:en
            tmp_e = Edge([n_idx e(3*i-2)], [e(3*i-1) e(3*i)], l);
            edge_list = [edge_list tmp_e];
            tmp_e = Edge([e(3*i-2) n_idx], [e(3*i-1) e(3*i)], l);
            edge_list = [edge_list tmp_e];
        end
        
        %read
        line = fgets(fileID);
    end

    g = Graph(node_list,edge_list,l);
    
    for i=1:size(g.EdgeList,2)
        g.EdgeList(i).Cost(1) = norm(g.NodeList(g.EdgeList(i).NodeList(1)).Pose - g.NodeList(g.EdgeList(i).NodeList(2)).Pose);
        g.EdgeList(i).Cost(2) = g.EdgeList(i).Cost(1);
    end
    
    for i=1:size(g.EdgeList,2)
        g.NodeList(g.EdgeList(i).NodeList(1)).EdgeList = [g.NodeList(g.EdgeList(i).NodeList(1)).EdgeList; g.EdgeList(i).NodeList(2) g.EdgeList(i).Cost];
        g.NodeList(g.EdgeList(i).NodeList(2)).EdgeList = [g.NodeList(g.EdgeList(i).NodeList(2)).EdgeList; g.EdgeList(i).NodeList(1) g.EdgeList(i).Cost];
    end
    
    
    h{l_idx,g_idx} = g;

    fclose(fileID);
    
end

g = h{1,2};