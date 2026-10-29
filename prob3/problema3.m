clearvars
close all

a = -11.0; b = 1.0; L = b-a;

A = airy(a);
B = airy(b);
C = airy(1,1); %for part (d);

numDiv = 190;
h = (b-a)/numDiv;


%(a)
fprintf('(a) B-A = %.5e\n',B-A)

nodes = linspace(a,b,numDiv+1)';
numNod = size(nodes,1);
elem = [1:numNod-1; 2:numNod]';
numElem = size(elem,1);

K = zeros(numNod);
Q = zeros(numNod,1);
for e = 1:numElem
    rows = [elem(e,1), elem(e,2)];
    cols = rows;
    xi = nodes(e);
    Ke = [1,-1; -1, 1]/h + ...
        h^2 * [4*xi/h + 1, 2*xi/h + 1; 2*xi/h + 1, 4*xi/h + 3]/12;
    if e == 10
        K10 = Ke;
    end
    K(rows,cols) = K(rows,cols)+Ke;
end
fprintf('(b) K(20,20) = %.5e\n',K(20,20))
fprintf('    Hint: trace K10 is about K10 = %.2e\n',trace(K10))

%Boundary conditons;
fixedNodes = [1,numNod];
freeNodes = setdiff(1:numNod,fixedNodes);

u = zeros(numNod,1);

%Natural B.C.
Q(freeNodes) = 0.; %Not necessary, since Q has been initialised to 0
%Essential B.C.
u(1) = A; u(end) = B;

%Reduced system
Fm = Q(freeNodes) - K(freeNodes,fixedNodes)*u(fixedNodes);
Km = K(freeNodes,freeNodes);

%Solve the reduced system
um = Km\Fm;
u(freeNodes) = um;

fprintf('(c) max |u(x(i)) - Airy(x(i)| = %.5e\n',max(abs(u-airy(nodes))))
fprintf('    Hint: u(x(1)) - Airy(x(1)) = %.5e\n',u(1)-airy(nodes(1)))
fprintf('          u(x(N)) - Airy(x(N)) = %.5e\n',u(end)-airy(nodes(end)))

fixedNodes = 1;
freeNodes = setdiff(1:numNod,fixedNodes);

%Natural B.C.
Q(end) = C;

%Essential B.C.
u(1) = A;   %The same as in (c) 

%Reduced system
Fm = Q(freeNodes) - K(freeNodes,fixedNodes)*u(fixedNodes);
Km = K(freeNodes,freeNodes);

%Solve the reduced system
um = Km\Fm;
u(freeNodes) = um;

fprintf('(d) Averaged value of u at the nodes: %.5e\n',sum(u)/numNod)