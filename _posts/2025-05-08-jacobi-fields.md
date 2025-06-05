---
layout: post
title:  "Jacobi fields I"
date:   2025-05-08
---
In these notes we will investigate some interesting properties of Riemannian manifolds, using Jacobi fields as the main technical tool. The numbering of results in these notes will be externally consistent, so we might refer back to Proposition 1, which is written in this note, in the next note.

Let $(M, g)$ be a Riemannian manifold with Levi-Civita connection $D$. We denote the Riemann curvature tensor by $R$, defined by 
$$
R(X,Y)Z := D_XD_YZ-D_YD_XZ-D_{[X,Y]}Z
$$
for vector fields $X,Y,Z : M\to TM$. We will write the inner product of two vector fields with respect to the metric as $\langle X,Y \rangle$, and norm by $|X|$. We start by going over some preliminaries.

## Technical preliminaries

Let $\Gamma: (-\varepsilon, \varepsilon) \times [0, T] \to M$ be a smooth variation of the smooth curve $\gamma: [0, T] \to M$. It is a local parametrization of $M$. Denote by 

$$
\Gamma_s (t) := \Gamma(s, t),\ \Gamma^t (s) := \Gamma(s, t)\\
T := \partial_t \Gamma,\ S := \partial_s \Gamma,\ V := S|_{s=0}.
$$

Here $V:[0,T]\to TM$ is called a smooth variation field. Note that we have $T = T_{(s,t)}\Gamma \partial_t$ and $S = T_{(s,t)}\Gamma \partial_s$ via the tangent map $T_{s,t}: T_{(s,t)}\mathbb{R}^2\to T_{\Gamma(s,t)}M.$ 
This implies 

$$
[S,T]=[T_{(s,t)}\Gamma \partial_t,T_{(s,t)}\Gamma \partial_s]=T_{(s,t)}\Gamma [\partial_s,\partial_t]=0
$$

In turn,

$$
\begin{align*}
R(S,T)V &= D_SD_TV-D_TD_SV-D_{[S,T]}V \\
&= \frac{D}{ds}\frac{D}{dt}V - \frac{D}{dt}\frac{D}{ds}V
\end{align*}.
$$

Lastly, one can check that $\frac{D}{dt}S = \frac{D}{ds}T$. This is called the symmetry lemma.

<!-- [*Diagram showing main curves with x and y axes, with points marked*] -->

## Geodesic variations

Let all curves $\Gamma_s$ for fixed $s$ be geodesics. Then $\frac{D}{dt}T=0$.
We have:

$$
\frac{D}{dt}\frac{D}{dt}S = \frac{D}{dt}\frac{D}{ds}T = \frac{D}{ds}\frac{D}{dt}T - R(S, T)T = R(S, T)T
$$

Setting $s=0$ gives us the Jacobi equation:

$$
V'' + R(V, \gamma')\gamma' = 0 \quad (*)
$$ 

where $V'$ is shorthand notation for $\frac{D}{dt} V$.

Let a proper variation be on with fixed end points satisfying $\Gamma(s,0)=\gamma(0)$, $\Gamma(s,T)=\gamma(T)$ and $V(0)=V(T)=0$. Note that the second proper variation of energy is:

$$\left.\frac{d^2}{ds^2}E(\Gamma_s)\right|_{s=0} = -\int_0^T \langle V, V'' + R(V, \gamma')\gamma' \rangle dt$$

and the so called index form, which is a symmetric bilinear form

$$
I(V, W) := -\int_0^T \langle V, W'' + R(W, \gamma')\gamma' \rangle dt \quad
$$

is degenerate if $W$ Jacobi field. $(V, W \text{ always proper})$

### Theorem 1

Every Jacobi field $V$ along geodesic $\gamma$ is the variation field of a geodesic variation of $\gamma$.

#### Proof

We have just seen that the variation field of a geodesic variation is a Jacobi field. $(*)$

Conversely, let $V: [0, 1] \to TM$ be Jacobi along $\gamma$, reparametrized $[0,T]\mapsto [0,1]$. Define a curve $\sigma(s) = \exp_{\gamma(0)}(sV(0))$ and a vector field $W: [0, \varepsilon] \to TM$ such that

$$
\begin{cases} W(0) = \gamma'(0) \\ \left.\frac{D}{ds}W\right|_{s=0} = \left.\frac{D}{dt}V\right|_{t=0} \end{cases}
$$

We can construct $W$ as follows. Let $W_1$, $W_2$ be parallel transports along $\sigma$ of $\gamma'(0), V'(0)$. Then $D_S W_i = 0$. Setting $W=W_1 + s W_2$ satisfies the conditions established above, since $W(0)=W_1(0)=\gamma(0)$ and $D_S W = W_2$. 

Then 
$\Gamma(s, t) := \exp_{\sigma(s)}(tW(s))$ 
is a geodesic variation since $\Gamma_s$ are geodesics by definition of the exponential map $\exp_{\sigma(s)}$.

From the first part $(*)$ we know 
$J:=S|_{s=0}$
is Jacobi.

We have:

$$
J(0) = \partial_s \Gamma(s, 0)|_{s=0} = \partial_s \sigma(s)|_{s=0} = V(0)
$$

since $\exp_p(0) = p$. Also:

$$
\frac{D}{dt}J(0) = \frac{D}{dt}J(t)|_{t=0} = \frac{D}{dt}S|_{s,t=0} = \frac{D}{dt}T(s,t)|_{s,t=0} = \frac{D}{ds}W(s)|_{s=0} = \frac{D}{dt}V(0)
$$

Since derivative at origin of exp is the identity.

Then $J = V$ by the following lemma. 

<div style="text-align: right"> $\square$ </div>


### Lemma 1

$\forall \xi, \eta \in T_{\gamma(0)}M \quad \exists! J :[0,T]\to TM$ such that 

$$
\begin{cases} J'' + R(J, \gamma')\gamma' = 0 \\ J(0) = \xi, \frac{D}{dt}J(0) = \eta \end{cases}
$$

#### Proof sketch

Choose parallel orthonormal frame along $\gamma$, so that 
$J(t) = J^k(t) E_k.$ 

$$
\Rightarrow \begin{cases} \dot{J}^i =: V^i \\ \dot{V}^i = -R_{jkl}^i J^j \gamma'^k \gamma'^l \end{cases}
$$

has a unique solution by Picard-Lindelöf Theorem. $\square$

## Consequences:
The space of vector fields along $\gamma$ satisfies the isomorphism $\Gamma(T\gamma) \simeq T_{\gamma(0)}M \oplus T_{\gamma(0)}M$ so $\dim\Gamma(T\gamma) = 2n$.

Meanwhile $\Gamma(s,t) = \gamma(s+t)$, $\Gamma(s,t) = \gamma(e^s t)$ are just reparametrizations,

So the interesting Jacobi fields are $2n-2$ many.

These are precisely the normal Jacobi fields.

Recall $I(V, V) = -\int_0^T \langle V, V'' + R(V, \gamma')\gamma' \rangle dt = \left.\frac{d^2}{ds^2}E(\Gamma_s)\right|_{s=0}$, where
$V$ is a proper normal vector field along the geodesic $\gamma$.

Since $E(\Gamma_\bullet): (-\varepsilon, \varepsilon) \to \mathbb{R}$ is a function the second derivative of a minimum satisfies $I(V, V) \geq 0$.

<!-- [*Small diagram showing curve with E(Γ) on vertical axis and s on horizontal*] -->

The normal Jacobi fields with vanishing ends are precisely those satisfying $I(V, V) = 0$. They are $n-1$ many.

### Proposition 1 (normal and tangential Jacobi fields)

A Jacobi field $J(t)$ remains tangential/normal:

i) $J(t) = \lambda t \gamma'(t) \Leftrightarrow J(0) = 0, J'(0) = \lambda \gamma'(0)$

Also in this case $J'' = 0.$
   
ii) $J(0), J'(0) \perp \gamma'(0) \Leftrightarrow J(t) \perp \gamma'(t) \forall t \in [0, T]$.

#### Proof

i) Let $J(t) = \lambda t \gamma'(t)$. Then $J(0) = 0$, $J'(t) = \lambda \gamma'(t) + 0$.
By existence-uniqueness only $J(t)$ satisfies these initial conditions. 
Clearly $J'' = 0$ since $\gamma$ is a geodesic.

ii) By compatibility with the metric
$$
\frac{d}{dt}\langle J, \gamma'\rangle = \langle J', \gamma'\rangle \Rightarrow \frac{d^2}{dt^2}\langle J, \gamma'\rangle = \langle J'', \gamma'\rangle
$$

Since $J'' = -R(J, \gamma')\gamma'$, we have $\langle J, \gamma'\rangle'' = -\langle R(J, \gamma')\gamma', \gamma' \rangle = 0$ by the properties of the Riemann curvature. Using the assumption $J(0) \perp \gamma'(0)$ and $J'(0) \perp \gamma'(0)$ we conclude

$$
\Rightarrow \begin{cases} \langle J(t), \gamma'(t)\rangle = at + b \\ \langle J'(t), \gamma'(t)\rangle = a \end{cases} \Rightarrow \begin{matrix} b = 0 \\ a = 0 \end{matrix}
$$
<!-- $\square$ -->
<div style="text-align: right"> $\square$ </div>
