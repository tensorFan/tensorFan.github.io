---
layout: post
title:  "On how to handle Dirichlet boundary conditions in code"
date:   2021-11-12
---
I will in this post attempt to summarise some different approaches to handling Dirichlet boundary conditions in implementations of FEM codes. We shall be concerned with the (weak) Poisson equation with inhomogeneous boundary condition,

\begin{equation} -\nabla\cdot\nabla u = f \text{ in } \Omega,\ u = g \text{ on } \partial\Omega. \end{equation}

Here $$f\in L^2(\Omega),g\in L^{\infty}(\partial\Omega)$$ represent data which we use to solve for $$u\in H^1(\Omega)$$. Since then the trace of $$u$$ is equal to $$g$$, we can say that $$g\in H^{1/2}(\partial\Omega)$$. Recast in a variational form, one typically wants to find $$u\in H^1_g(\Omega)= \\\{ v\in H^1(\Omega) : v\lvert_{\partial\Omega} = g \\\} $$ solving 

\begin{equation} \int_{\Omega} \nabla u \cdot \nabla v = \int_{\Omega} fv \ \ \forall v\in H^1_0(\Omega). \label{eq1}\end{equation}

To put the condition $$u\lvert_{\partial\Omega} = g$$ into the computer is the tricky part once we know how to discretise. This formulation is also difficult to analyse with respect to well-posedness<sup>1</sup>. Fortunately we may reduce to the homogeneous case in the following way. Set $$w=u-\hat{g}$$, where $$\hat{g}\in H^1(\Omega)$$ is the extension of $$g$$ to the entire domain (this exists if our domain is Lipschitz). We shall call this extension simply $$g$$ in the following. Then $$w\in H^1_0(\Omega)$$ and the equation for $$w$$ becomes homogeneous; its variational form nets us a unique solution. We may also find a unique extension of $$g$$ by taking the extension with the smallest (infimum) $$H^1$$ norm, thus getting a unique solution $$u$$. The modified variational form for $$w$$ becomes 

\begin{equation} \int_{\Omega} \nabla w \cdot \nabla v = \int_{\Omega} fv - \int_{\Omega} \nabla g \cdot \nabla v \ \ \forall v\in H^1_0(\Omega). \end{equation}

From here it is still not entirely clear how we should discretise. The only unknown data lies in our function $$w$$ so we should respect that when solving the discrete system. But what do we do about $$\nabla g$$, in particular $$g$$ could be sampled from some physical system so its gradient might not be something we can uniquely construct. We could try [projecting](https://tensorfan.github.io/blog/2021/subtlety-of-conservative-projection/) it, but we can actually avoid the problem entirely. 

The natural choice of finite elements for the Poisson equation are the [Lagrange](http://femwiki.wikidot.com/elements:lagrange-elements) $$\mathbf{P}^k$$ elements whose dual space consists in part of nodal evaluations. A subspace will be the piecewise linears $$\mathbf{P}^1$$ so consider the following. Set $$V_h\subset H^1(\Omega),\ V_{h,g}\subset H^1_g(\Omega)$$ as finite<sup>2</sup> dimensional $$\mathbf{P}^k$$ subspaces. Decompose the discrete solution $$u_h\in V_{h,g}$$ as $$u_h=w_h+u_{h,g}$$ where $$w_h \in V_{h,0}$$ and $$u_{h,g}\in V_{h,g}$$. Then we can pick $$u_{h,g}$$ to be the function which is $$0$$ on the interior of $$\Omega$$, meaning that we can solve the discrete version of \eqref{eq1} for $$w_h$$ as if our Dirichlet boundary condition was $$g=0$$. The nodal values along the boundary $$x_i$$ will be $$g(x_i)$$ regarded as known quantities.

We will now investigate different philosophies regarding the implementation of this in code. Let $$n=\text{dim}(V_{h,g})$$. In all sections below we will consider the linear $$n\times n$$ symmetric system arising from discretising \eqref{eq1}, $$Ax=b$$ with our unknowns in $$x$$.

# Note 20/11/23: For reasons I will omit the non-recommended approaches for now.
<!--
# Awkward way 1: row deletion
In each row $$j$$ of $$A$$ corresponding to a nodal boundary degree of freedom (dof) we set the value at each column except $$j$$ to 0, and we set column $$j$$ to 1. We change<sup>3</sup> the right hand side vector $$b_j=g(x_{j})$$. It works by putting the equation you want satisfied as a row in the linear system. However, this is awkward because such an incision in the matrix changes the way in which the condition number of the matrix scales. Perhaps more egregious is that you also destroy the symmetry of the system, making application of preconditioned conjugate gradient or other symmetric solvers impossible.

# Awkward way 2: computer precision witchcraft aka penalty method
As a solution to retaining the symmetry of the system, one could utilise the precision limits of modern computers by multiplying the value in column $$j$$ of $$A$$ and row $$j$$ of $$b$$ by a huge number, called the penalty, like $$10^{64}$$. The computer goes derp and only sees the effect of the boundary. It has been shown that in order for the solution to this perturbed problem to converge to the solution of the original problem in the limit as the penalty goes to infinity, it must depend on the mesh size. As we refine the mesh, the problem becomes increasingly [ill-conditioned](https://mooseframework.inl.gov/source/bcs/PenaltyDirichletBC.html). I would therefore not recommend this approach.-->

# Nice way: restriction and extension
Back to the drawing board then. As is the case in many situations of a mathematical nature, it helps to consider what is actually happening on a higher level of mathematical abstraction. When the solution is known on the boundary, what we are solving for is the restriction of the solution on the interior. When we then have the interior solution we want to extend back to the entire domain. Restriction and extension are in this context linear operators which can be represented by matrices (our spaces are finite-dimensional). 

Let $$n_I$$ be the number of dof's without the boundary nodes. Let $$R:\mathbb{R}^{n}\to \mathbb{R}^{n_I}$$ be the restriction to the interior and let $$R_{\partial}:\mathbb{R}^{n}\to \mathbb{R}^{n-n_I}$$ be the restriction to the boundary. Then if $$x_{\partial}\in\mathbb{R}^{n-n_I}$$ is the dof vector of boundary evaluations,

\begin{equation} RAR^Tx_I = R(b - A R_{\partial}^Tx_{\partial}) \label{eq:2}\end{equation}

is solvable for the interior dof's $$x_I$$, after which we get the entire solution from $$ R^T x_I + R_{\partial}^T x_{\partial} $$. 

This procedure changes nothing about the system, it retains its scaling and is still symmetric. Basically \eqref{eq:2} is exactly the system we want to solve. Pretty nice I would say.

---

<sup>1</sup> Note that the space $$H^1_g(\Omega)$$ is not a vector space!

<sup>2</sup> If $$g$$ is outside the space, this space is defined with respect to subspace projection using the Hilbert inner product in $$H^1$$.

<sup>3</sup> We have ordered the dof's so that the node evaluations occur first.
