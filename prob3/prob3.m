%[text] ## Problem 3
%[text] Consider the following problem:
%[text]{"align":"center"} $2 u - 4 u'' - 3 x - 3 = 0$
%[text] $x\\in \[4, 6\]$, with $u(4) = 2$ and $u(6) = 7$, and $150$ elements.
%[text] (a)  (1 point) The value of $\\frac{\\mathrm{d}\\psi^{149}\_{1}}{\\mathrm{d} x} (x)$ is:
%[text] - `-7.5000e+01 ✔️`
%[text] - `3.7500e+01`
%[text] - `-3.7500e+01`
%[text] - `2.5000e+01`
%[text] - `-2.5000e+01`
%[text] - Empty answer (no penalty)
%[text] - `7.5000e+01` \
%[text] **Soluiton**
%[text] Recall that, for quadratic elements:
%[text]{"align":"center"} $\\psi^{e}\_{i}(x) = \\frac{x - x^{e}\_{2}}{x^{e}\_{1} - x^{e}\_{2}} = \\frac{(-1)^{i}}{h\_{e}} \\left( x - x^{e}\_{i}),$
%[text] where $x^{e}\_{i}$ is the $i^{\\mathrm{th}$ node of the element $\\Omega^{e}$, so $h\_{e}$ is the length of the (linear) element, i.e., $h\_{e} = x^{e}\_{2} - x^{e}\_{1}$, $i = 1,2$, $e = 1\\div\\textrm{numelem}$. Therefore,
%[text]{"align":"center"} $\\frac{\\mathrm{d}\\psi^{e}\_{i}}{\\mathrm{d} x} (x) = \\frac{(-1)^{i}}{h\_{e}},\n$
%[text] $i = 1,2$, $e = 1\\div\\mathrm{numelem}$. For this case in point, $h\_{e} = \\frac{6 - 4}{ 150 } = \\frac{1}{75}$, for all $e = 1\\div\\mathrm{numelem}  = 150$ so, in particular for $i = 1$, $e = 149$,
%[text]{"align":"center"} $\\frac{\\mathrm{d}\\psi^{149}\_{1}}{\\mathrm{d} x} (x) = \\frac{(-1)^{1}}{h\_{149}} =- \\frac{1}{1 / 75} = -75.\n$
clearvars
close all

a1 = 4.0;
a0 = 2.0;

f1 = 3.0;
f0 = 3.0;

a = 4.0;
b = 6.0;

tempA = 2.0;
tempB = 7.0;
numelem = 150;
numnodes = numelem + 1;

nodes = linspace(a,b,numnodes);
elem = [1:numelem; 2:numnodes]';
h = (b - a) / numelem;
e = 149;
indexF = 38;

%Item (a)
fprintf("Question (a) The derivative of the first shape function " + ... %[output:group:22b89d2b] %[output:6cb5b6d1]
    "of the element %d is: %.4e", e, -1.0 / h); %[output:group:22b89d2b] %[output:6cb5b6d1]
%[text] (b) (2 points) The sum of the diagonal of matrix $K$ is:
%[text] - `9.0003e+04 ✔️`
%[text] - `8.9556e+04`
%[text] - `8.9795e+04`
%[text] - `9.0152e+04`
%[text] - Empty answer (no penalty)
%[text] - `8.9625e+04` \
%Item (b)
Ke = a1 * [1, -1; -1, 1]/h + a0 * h * [2, 1; 1, 2]/6; %The same for all
                                                      %the elements
K = zeros(numnodes);
F = zeros(numnodes,1);
Q = zeros(numnodes,1);
u = zeros(numnodes,1);

for e = 1:numelem
    rows = [elem(e,1), elem(e,2)];
    cols = rows;
    x1 = nodes(rows(1,1));
    x2 = nodes(rows(1,2));
    Fe = h * ( f1 * [2 * x1 + x2; x1 + 2 * x2] / 3 + ...
        f0 * [1; 1] ) / 2;
    K(rows, cols) = K(rows, cols) + Ke;
    F(rows) = F(rows) + Fe;
end

fprintf("Question (b) sum of the diagonal of matrix K: %.4e", sum(diag(K))); %[output:4bbafac9]
%[text] c) (2 points) The value of $F\_{38}$ is:
%[text] - Empty answer (no penalty)
%[text] - `2.1870e-01`
%[text] - `2.2116e-01`
%[text] - `2.2185e-01`
%[text] - `2.2025e-01`
%[text] - `2.1973e-01 ✔️` \
%Item (c)
fprintf("Question (c) F(%d) = %.4e\n",indexF, F(indexF)) %[output:84533b21]
%[text] (d) (2 points) Before imposing the boundary conditions, the global stiffness matrix obtained from the finite element discretization of the problem above is:
%[text] - Empty answer (no penalty)
%[text] - Symmetric only because linear elements are polynomials of degree 1
%[text] - Symmetric for linear and quadratic elements `✔️`
%[text] - Diagonal
%[text] - Non-symmetric
%[text] - Symmetric only because the number of elements is even \
%Item (d)
fprintf("Question (d) Symmetric for linear and quadratic elements") %[output:596c2910]
%[text] (e) (3 points) The mean value of the solution is:
%[text] - `5.1447e+00`
%[text] - `5.0809e+00`
%[text] - `5.1211e+00 ✔️`
%[text] - Empty answer (no penalty)
%[text] - `5.1297e+00`
%[text] - `5.1051e+00` \
%Item (e)
% Apply Dirichlet boundary conditions and solve the linear system
fixednods = [1, numnodes];
freenods = setdiff(1:numnodes, fixednods);

%Natural B.C.:
Q(freenods) = 0; %Not necessary, since vector Q is initialized to 0

%Essential B.C.:
u(1) = tempA;
u(end) = tempB;

%Reduced system
Fm = F(freenods) + Q(freenods) - K(freenods,fixednods) * u(fixednods);
Km = K(freenods, freenods);

%Solve the reduced system
um = Km \ Fm;
u(freenods) = um;

fprintf("Question (e) The mean value of the solution T is, <T> = %.4e", ... %[output:group:8170a776] %[output:77abba1b]
    sum(u) / numnodes) %[output:group:8170a776] %[output:77abba1b]

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":40}
%---
%[output:6cb5b6d1]
%   data: {"dataType":"text","outputData":{"text":"Question (a) The derivative of the first shape function of the element 149 is: -7.5000e+01","truncated":false}}
%---
%[output:4bbafac9]
%   data: {"dataType":"text","outputData":{"text":"Question (b) sum of the diagonal of matrix K: 9.0003e+04","truncated":false}}
%---
%[output:84533b21]
%   data: {"dataType":"text","outputData":{"text":"Question (c) F(38) = 2.1973e-01\n","truncated":false}}
%---
%[output:596c2910]
%   data: {"dataType":"text","outputData":{"text":"Question (d) Symmetric for linear and quadratic elements","truncated":false}}
%---
%[output:77abba1b]
%   data: {"dataType":"text","outputData":{"text":"Question (e) The mean value of the solution T is, <T> = 5.1211e+00","truncated":false}}
%---
