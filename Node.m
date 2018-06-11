classdef Node
    %NODE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Pose
        Invariant
        Transition
        Level
        Parent
        ChildrenList
        Cost
        EdgeList
    end
    
    methods
        function obj = Node(pose,invariant,transition,level,parent,children_list,cost)
           obj.Pose = pose;
           obj.Invariant = invariant;
           obj.Transition = transition;
           obj.Level = level; 
           obj.Parent = parent;
           obj.ChildrenList = children_list;
           obj.Cost = cost;
        end
    end
    
end

