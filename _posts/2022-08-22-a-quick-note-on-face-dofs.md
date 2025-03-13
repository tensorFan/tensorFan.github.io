---
layout: post
title:  "A not so quick note on implementing face degrees of freedom, and degrees of freedom in general"
date:   2022-08-22
---
Coming from an introductory course on FEM, a student may not (depending on the course) have encountered any finite element outside of the Lagrange family. This kind of element has a corresponding set of degrees of freedom (DOFs) being the nodal evaluations of a function (or for higher order also the nodal values of the derivatives of said function.) Recall that the basis functions $$\{\varphi_i\}_{i=1}^n$$ are those functions which evaluate to the kronecker delta on the DOFs,
\begin{equation} dof_j(\varphi_i) = \delta_{ij}. \end{equation}
Here $$n$$ is the dimension of the finite dimensional space in which we search for a discrete solution to some variational problem. In the case of the Lagrange family of order 1, the basis functions of an element are its barycentric coordinates.

Note here that the DOFs can be almost any type of functional, they are not restricted to being just nodal evaluations. Then the basis functions will change accordingly, and so will the space that they span. In fact, this is a general definition of a finite element which I am quite fond of. There are exceptions but it covers most if not all finite elements one can encounter. I like the following (slightly simplified) version from Ciarlet's book ["The Finite Element Method for Elliptic Problems"](https://books.google.se/books/about/The_Finite_Element_Method_for_Elliptic_P.html?id=1PF-WS0Nl9IC&source=kp_book_description&redir_esc=y)

A finite element is a triple $$(K,P,\Sigma)$$ where $$K$$ is a subset of $$\mathbb{R}^n$$, $$P$$ is some set of $$\mathbb{R}^k$$-valued functions ($$k\leq n$$) on $$K$$, and $$\Sigma$$ is a finite set of linearly independent linear forms $$\phi_i, 1\leq i\leq N$$ acting on $$P$$. Furthermore we assume that there exists functions $$\varphi_j$$ in $$P$$ for which $$\phi_i(\varphi_j)=\delta_{ij}$$. In other words we assume that $$P=\Sigma'$$ the linear dual space of $$\Sigma$$. This last property is also called $$P-$$unisolvency in the FEM literature. What's so nice about this definition is that if you have $$K$$ in the back of your mind as a triangle or quadrilateral, the element is entirely determined by how you choose $$\Sigma$$.

Okay, this was a tangent but now the reader knows that there are more elements out there than just the Lagrange element. See [this link](https://www-users.cse.umn.edu/~arnold/femtable/) for a cute table. The Lagrange element of order $$k$$ on geometry $$K$$ is usually denoted $$P_k(K)$$. In every case I have seen, the DOFs in $$\Sigma$$ are inherently tied to the geometry of the element $$K$$, which is interesting in and of itself.. but another example is given by the Raviart-Thomas family. This will lead us to what I really wanted to discuss here. I guess at this point I should change the title of this post..

The degrees of freedom of the lowest order member of the Raviart-Thomas family (RT family for short) are associated to the faces $$F$$ of $$K$$ and are given by 
\begin{equation} dof_F(\pmb{\varphi}) = \int_F \pmb{\varphi}\cdot \pmb{n}. \end{equation}
We see directly that $$k=2$$ here. In words, we just integrate the normal component of our vector-valued input on the face $$F$$. The RT element is very useful for certain applications in which the divergence is involved as a differential operator (can you figure out why? Hint: multivariate integration by parts!)

Let's go to higher order. The RT element of order 1, $$RT_1$$, is defined by the following DOFs
\begin{equation}\label{eq:1}
dof_{F,\psi}(\pmb{\varphi})=\int_F \pmb{\varphi}\cdot\pmb{n} \psi, \ \forall \psi\in P_1(F)
\end{equation}
\begin{equation}\label{eq:2}
dof_{\pmb{p}}(\pmb{\varphi})=\int_K \pmb{\varphi}\cdot \pmb{p}, \ \forall \pmb{p}\in P_0(K)
\end{equation}

A good warmup is to consider \eqref{eq:2}. It is integrating $$\pmb{\varphi}$$ against every vector-valued constant function, and there are only two (one for each component) up to linear independence. Thus we see that \eqref{eq:2} is equivalent to two DOFs, each integrating a component of $$\pmb{\varphi}$$ over $$K$$. Looking now at \eqref{eq:1}, we see that there are several DOFs per face, the amount of which is equal to the dimension of $$P_1(F)$$. Since $$F$$ is a piece of the geometry of 1 dimension, the barycentric coordinates are at most 2, one for each node. But in fact $$P_k(K)$$ is exactly the whole space of polynomials of degree less than or equal to $$k$$ on $$K$$, so any basis we can think of will work to span $$P_1(F)$$. Thus we have ambiguity when it comes to implementation!

The basis we choose matters because the corresponding basis functions of $$RT_1$$ must change according to our choice, and they might even scale differently! It might have other consequences too. We can choose the naive basis $$\{1,x\}$$ on our faces, in which case the subset of basis functions corresponding to the DOFs with $$\psi=1$$ will be precisely the $$RT_0$$ basis functions. This can be useful if you are for some reason wanting to use these basis functions / DOFs for a special purpose in your code. If your basis is something else, you can still construct them of course, but it might take a lot of work. [Here](https://defelement.com/elements/raviart-thomas.html) is a wonderful site where you can view a database of different finite elements. 
