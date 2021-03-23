# FBGreflectivity
Scripts and functions for calculating the complex reflectivity of various fiber-bragg gratings (FBGs). FBGs are also referred to as Distributed Bragg Reflectors (DBRs) when not implemented in fibers, and the concept and equations are essentially the same.

In this repository we mainly provide example scripts and functions to calculate the complex reflectivity (amplitude and phase) of non-trivial FBGs. Specifically, the scripts do not include the standard uniform FBG which has a comparatively simple analytic description. The scripts we do include calculate the reflectiviy for:

1) Chirped FBGs (pitch of the grating varying linearly)
2) Chirped FBGs with a Gaussian apodization
3) ...

The reflectivity for these FBGs is solved in all cases using some type of boundary value problem solver, and we include example scripts in Mathematica, Python, and Matlab for each case. Mathematica files are ".nb", python jupyter notebooks are ".ipynb", and Matlab scripts are ".m". More detail of the equations, variables, and scalings along with important references can be found in the longer, more detailed document "FBGreflectivity.pdf" in this repository.

This work was done within the context of my research at Vrije Universiteit Brussel as a Postdoctoral researcher in Martin Virte's Nonlinear Laser Dynamics group, with input also from Martin Skënderas.
