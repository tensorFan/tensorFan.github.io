---
layout: post
title:  "Pullback connections and why isometries preserve geodesics"
date:   2025-03-12
---
Why do isometries preserve geodesics (locally minimizing paths)? 
Under the isometry $$\phi:(M,g,\nabla)\to (\tilde M,\tilde g,\tilde \nabla)$$, we have that $$\nabla=\phi^*\tilde\nabla$$. In other words, the only Levi-Civita connection on $$M$$ is the pullback connection. 
How to prove this? The approach is to prove that the right hand side satisfies the properties of a connection on $$M$$, which is torsion-free and compatible with the metric $$g$$. Uniqueness of the connection on $$M$$ satisfying these properties then gives $$\nabla=\phi^*\tilde\nabla$$.
These aspects can be shown entirely within the framework tensor fields, making the results automatically global. 
Once we understand why $$\nabla=\phi^*\tilde\nabla$$ we can answer our question. 

 - First note that $$\phi^*\tilde\nabla$$ is a map $$\Gamma(TM)\times\Gamma(TM)\to \Gamma(TM)$$. Then we want to check linearity in the first entry and the characteristic Leibniz rule in the second.
Recall that $$\phi_*(fX)=(f\circ\phi^{-1})\ \phi_*X$$. Let for notation's sake $$\psi:=\phi^{-1}:N\to M$$, $$D:=\phi^*\tilde\nabla$$ and the application of a derivation $$X$$ on a function $$h$$ be $$X.h=Xh$$. Then for $$f\in C^{\infty}(M)$$

$$\begin{align} D_{fX}Y &= \psi_*\tilde\nabla_{\phi_*(fX)}\phi_*Y = \psi_*\tilde\nabla_{f\circ\psi\ \phi_*X}\phi_*Y \\
&= \psi_*(f\circ\psi\ \tilde\nabla_{\phi_*X}\phi_*Y) = (f\circ\psi\circ\phi)\ \psi_*\tilde\nabla_{\phi_*X}\phi_*Y \\
&= fD_X Y 
\end{align}$$

and recalling for $$g\in C^{\infty}(N)$$, $$(\phi_*X).g = (X.(f\circ\phi))\circ\psi$$ as functions on $$N$$,

$$\begin{align} 
D_{X}(fY) &= \psi_*\tilde\nabla_{\phi_*X}\phi_*(fY) = \psi_*\tilde\nabla_{\phi_*X}(f\circ\psi)\phi_*Y \\
&= \psi_*\left( (\phi_*X).(f\circ\psi)\phi_*Y + f\circ\psi\ \tilde\nabla_{\phi_*X}\phi_*Y \right) \\
&= \psi_*((X.(f\circ\psi\circ\phi))\circ\psi)\phi_*Y + f\psi_*\tilde\nabla_{\phi_*X}\phi_*Y \\
&= \psi_*(\underbrace{(X.f)\circ\psi)}_{\in C^{\infty}(N)}\phi_*Y + fD_{X}Y \\
&=(X.f) Y+ fD_{X}Y
\end{align}$$

 - Next we show that it is torsion free, using the fact that $$[\phi_* X,\phi_* Y]=\phi_*[X,Y]$$. We have from torsion-freeness of $$\tilde\nabla$$ that $$\tilde\nabla_{\phi_* X}\phi_* Y - \tilde\nabla_{\phi_* Y}\phi_* X = [\phi_* X,\phi_* Y] = \phi_*[X,Y]$$, whereby $$D_XY-D_YX = \psi_*\phi_*[X,Y]=[X,Y]$$ since pushforwards are isomorphisms.
 - Lastly we use compatibility of $$\tilde \nabla$$ with $$\tilde g$$ to get it for $$D$$ with $$g$$. Recall $$g(X,Y)=g_{Id}(X,Y)=\tilde g_{\phi}(\phi_*X,\phi_*Y)$$ since $$\phi:M\to N$$ is an isometry. Let $$\Gamma(TM)\ni Z=\psi_*\xi$$ for $$\xi\in\Gamma(TN)$$. Then since the expressions need to be equal as functions on $$M$$:
$$\begin{align}
g(D_XY,Z) &= g(\psi_*\tilde\nabla_{\phi_*X}\phi_*Y,\psi_*\xi) = \tilde g_\phi(\tilde\nabla_{\phi_*X}\phi_*Y,\xi) = \tilde g_\phi(\tilde\nabla_{\phi_*X}\phi_*Y,\phi_* Z) \\
&= ((\phi_*X).\tilde g_{Id}(\phi_*Y,\phi_*Z))\circ\psi - \tilde g_\phi (\phi_*Y,\tilde\nabla_{\phi_*X}\phi_*Z) \\
&= X.\tilde g_\phi(\phi_* Y,\phi_* Z) - g(Y,\psi_*\tilde\nabla_{\phi_*X}\phi_*Z) \\
&= X.g(Y,Z) - g(Y,D_XZ).
\end{align}$$

Thus $$\nabla=\phi^*\tilde\nabla$$. As a bonus we can nicely see from this that geodesics get mapped by an isometry $$\phi:M\to N$$. If $$c:I\to M$$ is a geodesic then the corresponding curve $$\gamma:=\phi\circ c:I\to N$$ is as well. (This curve is the flow $$\tilde\theta_t(n)=\gamma(t)$$ with $$\gamma(0)=n$$ from the vector field $$\phi_*c'(t)$$ with $$c(0)=\psi(n)$$.) 
$$\begin{equation} 
\psi_*\tilde\nabla_{\gamma'}\gamma' = \psi_*\tilde\nabla_{\phi_*c'}\phi_*c' = D_{c'}c'=\nabla_{c'}c'=0 
\end{equation}$$
so $$\tilde\nabla_{\gamma'}\gamma'=0$$ since $$\psi_*$$ is an isomorphism. (Note $$\gamma'(t) = \frac{d}{dt}(\phi\circ c(t))=T_{c(t)}\phi c'(t)=(\phi_*c')(t)$$ where $$T_{c(t)}\phi:T_{c(t)}M\to T_{\gamma(t)}N$$ is the tangent map or differential.)
