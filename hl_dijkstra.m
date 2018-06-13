function [ fpath ] = hl_dijkstra( start,finish,g )

n = size(g.NodeList,2);
en = size(g.EdgeList,2);

E = zeros(en,4);

for i=1:en
    E(i,1) = g.EdgeList(i).NodeList(1);
    E(i,2) = g.EdgeList(i).NodeList(2);
    E(i,3) = g.EdgeList(i).Cost(1);
    E(i,4) = g.EdgeList(i).Cost(2);
end

cost_l = sparse(E(:,1),E(:,2),E(:,3),n,n);
cost_u = sparse(E(:,1),E(:,2),E(:,3),n,n);

iTable = NaN(n,2);
minCost = Inf(n,2);
isSettled = false(n,1);
path = num2cell(NaN(n,1));
if (start(1) == -1)
    I = start(2);
else
    for i=1:size(g.NodeList,2)
        if (size(g.NodeList(i).Transition,1) == 0)
            continue;
        end
        idx_list = find(((g.NodeList(i).Transition(:,1)) == start(1)) .* ((g.NodeList(i).Transition(:,2) == start(2))));
        if (size(idx_list,1) ~= 0)
            break;
        end
    end
    I = i;
end

if (finish(1) == -1)
   finish = finish(2);
else
    for i=1:size(g.NodeList,2)
        if (size(g.NodeList(i).Transition,1) == 0)
            continue;
        end
        idx_list = find((g.NodeList(i).Transition(:,1) == finish(1)));
    end
    finish = idx_list(1);
end

minCost(I,:) = [0 0];
iTable(I,:) = [0 0];
isSettled(I) = true;
path(I) = {I};

isReverse = false;


while ~isSettled(finish)
    
    % Update the table
    jTable = iTable;
    iTable(I,:) = [NaN NaN];
    nodeIndex = find(E(:,1) == I);

    % Calculate the costs to the neighbor nodes and record paths
    for kk = 1:length(nodeIndex)
        J = E(nodeIndex(kk),2);
        if ~isSettled(J)
            c = [cost_l(I,J) cost_u(I,J)] + g.NodeList(J).Cost;
            empty = isnan(jTable(J));
            if empty || (jTable(J,1) > (jTable(I,2) + c(2)))
                iTable(J,:) = jTable(I,:) + c;
                if isReverse
                    path{J} = [J path{I}];
                else
                    path{J} = [path{I} J];
                end
            else
                iTable(J,:) = jTable(J,:);
            end
        end
    end

    % Find values in the table
    K = find(~isnan(iTable));
    if isempty(K)
        break
    else
        % Settle the minimum value in the table
        [~,N] = min(iTable(K));
        I = K(N);
        minCost(I,:) = iTable(I,:);
        isSettled(I) = true;
    end
end

% Store costs and paths
cost = minCost(finish,:);
path{finish};
fpath = path{finish};




end

