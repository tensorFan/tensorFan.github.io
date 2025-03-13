---
layout: post
title:  "Subtlety of projection in conservative FEM"
date:   2021-05-28
---
I was recently exposed to the subtlety of projection by my friend Wietse (who has agreed to being associated to this first blog post of mine.)
<sup>1</sup>
Projections are ubiquitous in mathematics and they come in different guises. In this post I want to highlight a very important and subtle distinction between projections and interpolations in the FEM. I have the suspicion that this is one of those topics that is obvious to the initiated, but mysterious to the student. So it is of value to discuss these subtleties.

In the following we let $$S$$ be some finite element subspace of finite dimension.

# $$L^2$$ projections
Given a function $$f$$, a projection is a best approximation to $$f$$ from a subspace of the space wherein $$f$$ resides. The sense in which the projection is a best approximation is determined by the Hilbert space inner product one wants to use, this then gives that the functions are closest in the corresponding norm. The definition is simple; given some open set domain $$\Omega$$ and $$f\in L^2(\Omega)$$, then $$Pf\in S\subset L^2(\Omega)$$ is the unique function in $$S$$ for which
\begin{equation}
(f,g)=(Pf,g)\ \forall g\in S.
\end{equation}
The projector $$P:L^2(\Omega)\to S$$ is linear as an operator. The projection then has the property of best approximation, namely
\begin{equation}
||f-Pf||\leq ||f-g||\ \forall g\in S.
\end{equation}

# Conservation of mass in finite elements
In flow problems where the flow is modelled by for example the Darcy or the Stokes equations, one is also concerned with conservation of mass of the fluid. Conservation of mass simply means that in a closed system, the amount of fluid exiting the domain equals the amount coming in. This is a physical law, in contrast to the equations mentioned above which are just models in the end. Mathematically this law is written $$\nabla\cdot u=0$$, where $$u$$ is the velocity field. We have by integration by parts that $$ 0=(\nabla\cdot u,q) = (u\cdot n,q)_{\partial \Omega} - (u,\nabla q) = (g,q)_{\partial \Omega} - (u,\nabla q)$$, where $$u$$ satisfied the Neumann boundary condition $$u\cdot n=g\in L^2(\Omega)$$.

Thus it is of *paramount* importance that the equation above is satisfied, and we must therefore take extreme care in how we approximate $$g$$ when actually performing the computations. This is a fact which I have found is seldom emphasised.

If we know $$g$$ in closed form
<sup>2</sup>
then we must either evaluate $$g$$ directly in the quadrature points of the integration, or we must project $$g$$ to $$\partial \Omega$$. If we simply interpolate $$g$$, as is often convenient to do in a FEM code, then we will destroy mass conservation!

# Extra: should it matter to which polynomial space I project?
Short answer is no; not if the function you are testing against lies in both spaces. As an example, let $$g\in \mathbf{P}^0:=\mathbf{P}^0_{\partial\Omega}$$, the piecewise constants on edges of $$\partial\Omega$$. Then by definition $$(f,g)=(Pf,g)$$ if $$g\in \text{im}(P)$$, i.e. if the image $$\text{im}(P)\supset\mathbf{P}^0$$. So naturally if $$P$$ is the projection onto constants on $$\partial\Omega$$, the integral $$(f,g)$$ is preserved.

If $$P$$ is the projection to $$\mathbf{P}^1$$ instead, then $$(Pf,g)$$ is surprisingly enough *not* equal to $$(f,g)$$. If however $$P$$ instead is the projection to $$\mathbf{dP}^1$$, the discontinuous linear polynomials on $$\partial\Omega$$, then $$(Pf,g)=(f,g)$$ since $$g\in \mathbf{P}^0\subset \mathbf{dP}^1$$.

---

[Here](/assets/pdf/projection.pdf) is the same post in pdf format.

---

<sup>1</sup> Potential mistakes herein are entirely my own!

<sup>2</sup> If we are sampling $$g$$ from some physical system then I do not think there is any issue, but I lack experience of this so if you know something about it please contact me.
