clearvars
close all
clc
relativePathToLib = './../lib'; addpath(relativePathToLib);

format short e; %Note that all the quantities involved are rationals, however
format compact; 

nodes = [0,0; 1,0; 1,1; 2,0];
elem = [1,2,3; 3,2,4];

h = 1;% length of edge 1-2 (edge 1 of element 1),
      %           edge 2-3 (edge 2 of element 1, or
      %                    (edge 1 of element 2)
      %           edge 2-4 (edge 2 of element 2)

%Element 1
a11 = 1; a12 = 0; a21 = 0; a22 = 1; a00 = 0; f = 0;
coeff1 = [a11,a12,a21,a22,a00,f];
%Element 2
a11 = 3; a12 = 0; a21 = 0; a22 = 1; a00 = 0; f = 0;
coeff2 = [a11,a12,a21,a22,a00,f];

coeffuy21 = -1; % in edge 1-2 uy21 = -u
uInf = 0;      % in edge 1-2

%Constant B.C.               
uy24 = -2;     % u_{y} along the edge 2-4
U1 = 1;
U3 = 0;
U4 = 0;

p = [1/2,1]; %Point for part (f)
a11f = 3;    %Coefficient for part (g) 
 
%Plot the mesh
numbering = 1;
fig1 = figure();
plotElementsOld(nodes, elem, numbering)

%
%Compute the local stiffness matrices
%

beta = zeros(3,1); gamma = zeros(3,1);
vectOnes = [1; 1; 1];
vertexs = nodes(elem(1,:),:);

Area = 0.5*det([vectOnes,vertexs]);

%Stiffness matrix of the 1st element, K1
beta(1) = vertexs(2,2) - vertexs(3,2);
beta(2) = vertexs(3,2) - vertexs(1,2);
beta(3) = vertexs(1,2) - vertexs(2,2);

gamma(1) = -(vertexs(2,1) - vertexs(3,1));
gamma(2) = -(vertexs(3,1) - vertexs(1,1));
gamma(3) = -(vertexs(1,1) - vertexs(2,1));

K1 = 0.25*(coeff1(1)*(beta*beta') + coeff1(4)*(gamma*gamma'))/Area;

%Print K1
fprintf(['Local stiffness matrix of the 1st element\n', 'K1 = \n'])
fprintf("%14.5e%14.5e%14.5e\n",K1')

clear beta gamma Area;
beta = zeros(3,1); gamma = zeros(3,1);
vertexs = nodes(elem(2,:),:);

Area = 0.5*det([vectOnes,vertexs]);

%Stiffness matrix for the 2nd element, K2
beta(1) = vertexs(2,2) - vertexs(3,2);
beta(2) = vertexs(3,2) - vertexs(1,2);
beta(3) = vertexs(1,2) - vertexs(2,2);

gamma(1) = -(vertexs(2,1) - vertexs(3,1));
gamma(2) = -(vertexs(3,1) - vertexs(1,1));
gamma(3) = -(vertexs(1,1) - vertexs(2,1));

K2 = 0.25*(coeff2(1)*(beta*beta') + coeff2(4)*(gamma*gamma'))/Area;

%Print K2
fprintf('\n')
fprintf(['Local stiffness matrix of the 2st element\n', 'K2 = \n'])
fprintf("%14.5e%14.5e%14.5e\n",K2')

%Assemble the local stiffness matrices to the global stiff matrix
K = zeros(4,4);
rows = [elem(1,1), elem(1,2), elem(1,3)]; cols = rows;
K(rows,cols) = K1;
rows = [elem(2,1), elem(2,2), elem(2,3)]; cols = rows;
K(rows,cols) = K(rows,cols)+K2;

% Print K
fprintf('\n')
fprintf(['Assembled global stiffness matrix\n', 'K = \n'])
fprintf("%14.5e%14.5e%14.5e%14.5e\n",K')

fprintf("\nSolution\n")
% 
% (a) $K_{1,2}$
%
fprintf('(a) K(1,2) = %s\n',strtrim(rats(K(1,2))))

%
% (b) $K_{2,2}$
%
fprintf('(b) K(2,2) = %s\n',strtrim(rats(K(2,2))))

% 
% (c) Computation of $Q^{1}_{2,1} = A U_{2} + B$.
%
A = -coeffuy21 * coeff1(4) * h/3; B = -coeffuy21 * coeff1(4) * h * U1/6; 

%
% (d) Computation of $Q^{2}_{2,2}$.
%

Q222 = -uy24 * coeff2(4) * h/2; %"Flow" on node 2 of element 2 due to the
                                %flow through edge 2 of the element,
                                %$Q^{2}_{2,2}$
fprintf('(c) Q{2}(2,2) = %s\n',strtrim(rats(Q222))) 

% 
% (e) Approximate value of $u(1,0)\approx U_{2}$.
%

Q = zeros(4,1);
F = zeros(4,1);
u = zeros(4,1);

%
%Boundary conditions (B.C.)
%

%Natural B.C.
K(2,2) = K(2,2) - A; %Add the convetion term to the (global) stiffness matrix
Q(2) = B + Q222;

%Essential B.C.
freeNods = 2;
fixedNods = [1,3,4];

u(1) = U1;
u(3) = U3;
u(4) = U4;

%Reduced system
Fm = Q(freeNods) + F(freeNods) - K(freeNods,fixedNods)*u(fixedNods);
Km = K(freeNods,freeNods);

% Solve the reduced system for the unknown displacements
um = Km \ Fm;
u(freeNods) = um;
fprintf('(e) u(1,0) %c U(2) = %s\n', char(0x2248), strtrim(rats(u(2))))

%
%(f) $\Omega^{k} = [6,0]\times [2,0]$. Find $\psi^{k}_{3}(x,y)$.
% 

%Plot the element, assuming node $1$ is at the origin, Trivially:
clear nodes elem
syms x y a22 
nodes = [0,0; 6,0; 6,2; 0,2];
elem = [1,2,3,4];
fig2 = figure();
plotElementsOld(nodes, elem, 1)
a = nodes(2,1) - nodes(1,1);
b = nodes(4,2) - nodes(1,2);
Psik3(x,y) = x*y / (a*b);
fprintf('(f) Psi{k}(3)(%s,%s)) = %s\n',...
    strtrim(rats(p(1))), strtrim(rats(p(2))), ...
    strtrim(rats(Psik3(p(1),p(2)))))

%
% (g) Compute $K{k}(3,3)$.
%

a11 = a11f;
a22(x,y) = 1+x;
dxPsik3(x,y) = diff(Psik3,x);
dyPsik3(x,y) = diff(Psik3,y);
K1133 = int(int(a11*dxPsik3*dxPsik3,y,0,2),x,0,6);
K2233 = int(int(a22*dyPsik3*dyPsik3,y,0,2),x,0,6);

%Finally
K33 = K1133 + K2233;
fprintf('(g) K(3,3) = %s\n',strtrim(rats(K33)))