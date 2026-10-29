# Final Exam. Course 2026-27 Q1

## Problem 2
Answer the following questions about the two dimensional finite element
method. The equation to be considered is

$$
-\frac{\partial}{\partial x}\left(%
a_{11}\frac{\partial u}{\partial x}
\right) - \frac{\partial}{\partial y}\left(
a_{22}\frac{\partial u}{\partial y}
\right) = 0, 
$$

with the domain and values $a_{11}$, $a_{22}$ provided in the questions.

__Note.__ Questions sets (a,b,c,d) and (f,g) are independent problems.
Questions a, b, c, d and f do not require any prior computations.

(a) (2 points) Consider the meshed domain: `nodes = [0 0; 1 0; 1 1; 2 0]`,
`elem = [1 2 3; 3 2 4]` with  $a_{11} = a_{22} = 1$ in $\Omega^{1}$ and,
$a_{11} = 3$, $a_{22} = 1$ in $\Omega^{2}$. The value $K_{1,2}$ in the
assembled matrix is
- [ ] `-3/2`
- [x] `-1/2`
- [ ] `-2`
- [ ] `-1`
- [ ] Leave it empty (no penalty)

(b) (1 point) Same setting as in question (a). The value $K_{2,2}$ in the
assembled system is
- [ ] Leave it empty (no penalty)
- [x] `3`
- [ ] `6`
- [ ] `5`
- [ ] `4`

\(c\) (2 points) Continue in the same setting. Consider the boundary
conditions $u(x,y) = 1 - y$ in $\overline{1,3}$; $u(x,y)\equiv 0$ in $\overline{3,4}$;
$\dfrac{\partial u}{\partial y}(x,y) = -u$ in $\overline{1,2}$ and, $\dfrac{\partial
u}{\partial y}(x,y) \equiv -2$ in $\overline{2,4}$. Given that $Q_{2,1}^{1} = A U_{2} +
B$, the value of $A$ is
- [ ] Leave it empty (no penalty)
- [ ] `2/3`
- [x] `1/3`
- [ ] `1`
- [ ] `4/3`

(d) (1 point) With the same boundary conditions as in \(c\). The value of
$Q^{2}_{2,2}$ is
- [ ] `3`
- [x] `1`
- [ ] Leave it empty (no penalty)
- [ ] `2`
- [ ] `3/2`

(e) (1 point) The approximate value of $u(1,0)$ for the problem defined in
(a)--\(c\) is
- [ ] Leave it empty (no penalty)
- [ ] `1`
- [ ] `17/14`
- [x] `5/8` 
- [ ] `17/20`

(f) (2 points) Consider the rectangular element $\Omega^{k} = [0,6]\times
[0,2]$ with local node number $1$ in $(0,0)$. The value of
$\psi^{k}_{3}\left(1/2,1\right)$ is
- [ ] `1/8`
- [ ] `1/12`
- [ ] Leave it empty (no penalty)
- [x] `1/24`
- [ ] `1/4`

(g) (1 point) Consider $a_{11}(x,y)\equiv 3$ and $a_{22}(x,y) = x + 1$. The
value of $K^{k}_{3,3}$ for $\Omega^{k}$ in (f) is 
- [ ] `34/6`
- [x] `35/6`
- [ ] `37/6`
- [ ] `38/6`
- Leave it empty (no penalty)
