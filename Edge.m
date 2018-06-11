classdef Edge
    %EDGE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        NodeList
        Cost
        Level
    end
    
    methods
        function obj = Edge(node_list,cost,level)
            obj.NodeList = node_list;
            obj.Cost = cost;
            obj.Level = level;            
        end
    end
    
end

