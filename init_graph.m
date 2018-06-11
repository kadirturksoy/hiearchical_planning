
% ground level

% init g1

n1 = Node([-1.5873,0.9682],0,0,1,1,[]);
n2 = Node([-1.8792,1.9497],0,0,0,1,[]);

e1 = Edge([n1 n2],norm(n1.Pose-n2.Pose),0);

node_list = [n1 n2];
edge_list = [e1];

g1 = Graph(node_list,edge_list,0);


% init g2

node_list = [];
edge_list = [];

node_list = [node_list  Node([1.5000,0],0,0,1,1,[])];
node_list = [node_list  Node([0,0],0,0,1,1,[])];
node_list = [node_list  Node([1.6400,1.4520],0,0,1,1,[])];
node_list = [node_list  Node([2.0752,-2.5804],0,0,1,1,[])];
node_list = [node_list  Node([1.4045,-1.4250],0,0,1,1,[])];
node_list = [node_list  Node([0.1497,-1.0689],0,0,1,1,[])];
node_list = [node_list  Node([-1.9499,-1.7719],0,0,1,1,[])];
node_list = [node_list  Node([-1.5683,-0.6077],0,0,1,1,[])];
node_list = [node_list  Node([-1.1890,0.3041],0,0,1,1,[])];

n1 = node_list(1);
n2 = node_list(2);

edge_list = [edge_list  Edge([n1 n2],norm(n1.Pose-n2.Pose),0)];

n1 = node_list(1);
n2 = node_list(2);

edge_list = [edge_list  Edge([n1 n2],norm(n1.Pose-n2.Pose),0)];

n1 = node_list(1);
n2 = node_list(2);

edge_list = [edge_list  Edge([n1 n2],norm(n1.Pose-n2.Pose),0)];

n1 = node_list(1);
n2 = node_list(2);

edge_list = [edge_list  Edge([n1 n2],norm(n1.Pose-n2.Pose),0)];

n1 = node_list(1);
n2 = node_list(2);

edge_list = [edge_list  Edge([n1 n2],norm(n1.Pose-n2.Pose),0)];

n1 = node_list(1);
n2 = node_list(2);

edge_list = [edge_list  Edge([n1 n2],norm(n1.Pose-n2.Pose),0)];

n1 = node_list(1);
n2 = node_list(2);

edge_list = [edge_list  Edge([n1 n2],norm(n1.Pose-n2.Pose),0)];

n1 = node_list(1);
n2 = node_list(2);

edge_list = [edge_list  Edge([n1 n2],norm(n1.Pose-n2.Pose),0)];

n1 = node_list(1);
n2 = node_list(2);

edge_list = [edge_list  Edge([n1 n2],norm(n1.Pose-n2.Pose),0)];

n1 = node_list(1);
n2 = node_list(2);

edge_list = [edge_list  Edge([n1 n2],norm(n1.Pose-n2.Pose),0)];

n1 = node_list(1);
n2 = node_list(2);

edge_list = [edge_list  Edge([n1 n2],norm(n1.Pose-n2.Pose),0)];

n1 = node_list(1);
n2 = node_list(2);

edge_list = [edge_list  Edge([n1 n2],norm(n1.Pose-n2.Pose),0)];

n1 = node_list(1);
n2 = node_list(2);

edge_list = [edge_list  Edge([n1 n2],norm(n1.Pose-n2.Pose),0)];

n1 = node_list(1);
n2 = node_list(2);

edge_list = [edge_list  Edge([n1 n2],norm(n1.Pose-n2.Pose),0)];

n1 = node_list(1);
n2 = node_list(2);

edge_list = [edge_list  Edge([n1 n2],norm(n1.Pose-n2.Pose),0)];

n1 = node_list(1);
n2 = node_list(2);

edge_list = [edge_list  Edge([n1 n2],norm(n1.Pose-n2.Pose),0)];





g2 = Graph(node_list,edge_list,0);



