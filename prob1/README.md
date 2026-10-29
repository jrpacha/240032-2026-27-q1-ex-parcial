# Midterm Exam. Course 2026-27 Q1

## Problem 1
Consider the boundary value problem on $[0, 1]$:

$$
-\frac{\mathrm{d}}{\mathrm{d} x}\left(\left( 1 + x^2 \right) 
\frac{\mathrm{d} u}{\mathrm{d} x}\right) = 2, \quad 0 < x < 1,
\quad u(0) = 0,\quad \frac{\mathrm{d} u}{\mathrm{d} x}(1) = -3.
$$

Use __one linear element__ on $[0, 1]$, with nodes $x_{1} = 0$, and 
$x_{2} = 1$.

Let $\psi_{i}$ be the linear shape functions and write
$u_{h} (x) = U_{1}\psi_{1}(x) + U_{2}\psi_{2}(x)$.

__Matlab is not permitted for this exercise.__ Select one answer per part.
Numerical choices are rounded to five decimal places. An incorrect choice
substracts 25% of the points for that part. Select "Empty answer (no 
penalty)' to receive zero points without penalty.

(a) (2 points) Compute $K_{11}$, the $(1,1)$ entry of the stiffness matrix,
$K$, before imposing boundary conditions.

- [x] `1.33333`
- [ ] `1.00000`
- [ ] `2.66667`
- [ ] `0.66667`
- [ ] Empty answer (no penalty)

(b) (2 points) Compute the source load $F_{1}$.

- [ ] Empty answer (no penalty)
- [ ] `2.00000`
- [ ] `-1.00000`
- [x] `1.00000`
- [ ] `0.50000`

\(c\) (4 points) Compute the FEM approximation using the boundary
 conditions. Give the average of its nodal values, $\bar{U} = \left(
U_{1} + U_{2}\right) / 2$.

- [ ] `-3.75000`
- [ ] `-0.93750`
- [ ] Empty answer (no penalty)
- [x] `-1.87500`
- [ ] `1.87500`

(d) (2 points) The exact solution is 
$u(x) = -4\arctan (x) - \ln\left(1 + x^{2}\right)$. At which point in
$[0, 1]$ does the absolute error $\left|u(x) - u_{h}(x)|$ attain its
maximum? Select the coordinate $x$. 

- [ ] `1.00000`
- [ ] Empty answer (no penalty)
- [ ] `0.13789`
- [ ] `0.00000`
- [x] `0.63785`

__Hint:__ The maximum absolute error is attained at an 
interior point where $u-u_{h}$ has a local minimum. Recall 
also that 
$\frac{\mathrm{d}}{\mathrm{d} x}\arctan(x) = \frac{1}{1 + x^{2}}$
and $\frac{\mathrm{d}}{\mathrm{d} x}\ln\left(1 + x^{2}\right) = \frac{2 x}{1 + x^{2}}$.
