classdef Graph
    %GRAPH Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        NodeList
        EdgeList
        Level
    end
    
    methods
        function obj = Graph(node_list,edge_list,level)
            obj.NodeList = node_list;
            obj.EdgeList = edge_list;
            obj.Level = level;
        end
    end
    
end

