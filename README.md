# GeometricMorphometricsMix

Miscellaneous geometric morphometric functions

This repository contains a few useful and fairly diverse geometric morphometric functions which may be useful to others.
All the functions are reasonably well commented with information on usage and similar.
It started as a simple set of function that I distributed as help to the students of my course in [Geometric Morphometrics](https://www.physalia-courses.org/courses-workshops/course22/) (organized by Physalia Courses).
They are incorporated into an R package to facilitate distribution and use.

## Currently available functions
- **EscoufierRV** : Computation of Escoufier RV, which quantifies levels of association between blocks of variables (Escoufier 1973 - Biometrics)
- **Kmultparallel** : Parallelised computation of Adams' Kmult (useful for distributions of trees, see Fruciano et al. 2017 - Ecology and Evolution)
- **ProjectOrthogonal** : Projects data to subspace orthogonal to a given vector (for use in allometric correction, see Burnaby 1966 - Biometrics; Rohlf & Bookstein 1987 - Systematic Zoology; for use in dealing with measurement error, see Valentin et al. 2008 - Journal of Fish Biology; Fruciano 2016 - Development Genes and Evolution)
- **reversePCA** : Simple function to obtain the original variables (e.g., shape) from PC scores (and mean)
- **RVrarefied** : Computation of rarefied estimates of Escoufier RV (see Fruciano et al. 2013 - Plos One)
- **RVcomparison** : Permutation test for the difference in Escoufier RV (see Fruciano et al. 2013 - Plos One)
- **TestOfAngle** : Test of angle between two vectors, optionally allowing "flipping" of one of the two

## Installation
From Github, using devtools

```
library(devtools)
install_github("fruciano/GeometricMorphometricsMix")
```

## Citation
Currently, and for the foreseeable future, there are no plans to publish a proper paper describing the package.
Each function, however, provides reasonable comments and references to the methods, which can (and should) be used when using the functions in the package (in addition to the usual citation to the package itself)

