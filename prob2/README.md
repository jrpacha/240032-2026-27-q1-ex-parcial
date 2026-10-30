# Midterm Exam. Course 2026-27 Q1

## Problem 2
Consider the mesh called `meshEscaire2foratsTirang`. Let 
$p_{0} = (-1.4,3.4)$ and assign the following _distasnce value_ to each 
node $v:$
$$
f(v) = \| v - p_{0}\|,
$$
that is, $f(v)$ is the distance from $v$ to $p_{0}$.

__Hint:__ In Matlab, the distance from $v$ to $p_{0}$ is computed with 
`norm(v - p0)`.

(a) (2points) The farthest (most distant) node from $p_{0}$ is node number:

- [ ] `85`
- [ ] `84`
- [x] `82`
- [ ] `81`
- [ ] `83` 
- [ ] `Empty answer (no penalty)`

__Hint:__ The command `[M,I] = max(A)` returns the maximum element `M` and 
its index `I`.

(b) (4 points) Interpolate the function $f$ at the point $p = (5.1, 2.9)$. 
The interpolated value is:

- [ ] `6.4478e+00`
- [ ] `6.5848e+00`
- [ ] `Empty answer (no penalty)`
- [x] `6.5196e+00`
- [ ] `6.4413e+00`

(c) (2 points) Given a triangular element, its barycenter $g$ has 
barycentric coordinates $(1/3, 1/3, 1/3)$. Find the barycenter of the 
element number $7$ in the mesh:

- [ ] `(4.6400e+00, 6.2143e-01)`
- [ ] `Empty answer (no penalty)`
- [ ] `(4.5369e+00, 6.0762e-01)`
- [ ] `(5.6196e+00, 7.5262e-01)`
- [x] `(5.1556e+00, 6.9048e-01)`

(d) (2 points) Given a triangular element with barycenter $g$, define it
_interpolation error_ as the difference between the interpolated value of 
$f$ at $g$. The interpolation error for element number $7$ in the mesh is:

- [ ] `4.0937e-03`
- [ ] `4.0568e-03`
- [ ] `Empty answer (no penalty)`
- [x] `3.6880e-03`
- [ ] `3.9831e-03`
 



  

