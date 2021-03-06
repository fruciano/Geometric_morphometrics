% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/disparity_test.R
\name{disparity_test}
\alias{disparity_test}
\title{Permutation test of difference in disparity/morphospace occupation}
\usage{
disparity_test(X1, X2, perm = 999)
}
\arguments{
\item{X1, X2}{Matrices or data frames containing data for each group
(observations in rows, variables in columns).}

\item{perm}{number of permutations}
}
\value{
The function outputs a dataframe containing:
  the observed values of the tests statistics for each group,
  their absolute differences, and
  The p values obtained through the permutational procedure
}
\description{
Performs a permutation test of difference in disparity between two groups.
}
\details{
The function employs commonly used test statistics
to quantify disparity/morphospace occupation/variation in each group.
The two statistics currently implemented are multivariate variance
(also known as sum of variances, trace of the covariance matrix, Procrustes variance),
and mean pairwise Euclidean distances.
These two metrics have a long history in the quantification of disparity both in geometric morphometrics
(e.g., Zelditch et al. 2004; Fruciano et al., 2014, 2016) and more in general in evolution (e.g., Foote, 1996; Willis 2001)
The observed statistics are then compared to their empirical distributions obtained through permutations,
to obtain a p-value.
}
\section{Notice}{

The values of the test statistics in the output are the observed in the sample.
If they are of interest, and the two groups have different sample size, consider
computing their rarefied versions (for instance with the function \code{\link{rarefied_disparity}})
for reporting in papers and the like.
}

\examples{
library(MASS)
set.seed(123)

X1=mvrnorm(20, mu=rep(0, 40), Sigma=diag(40))
X2=mvrnorm(100, mu=rep(5, 40), Sigma=diag(40))
# create two groups of random observations
# with different means and sample sizes,
# but the same covariance matrix

# We expect that the two groups will have the same
# variance (disparity/morphospace occupation)
# and therefore the test will be non-significant

disparity_test(X1, X2, perm=999)
# This is, indeed, the case

}
\references{
Foote M. 1997. The evolution of morphological diversity. Annual Review of Ecology and Systematics 28:129.

Wills MA. 2001. Morphological disparity: a primer. In. Fossils, phylogeny, and form: Springer. p. 55-144.

Zelditch ML, Swiderski DL, Sheets HD. 2004. Geometric morphometrics for biologists: a primer: Academic Press.

Fruciano C, Franchini P, Raffini F, Fan S, Meyer A. 2016. Are sympatrically speciating Midas cichlid fish special? Patterns of morphological and genetic variation in the closely related species Archocentrus centrarchus. Ecology and Evolution 6:4102-4114.

Fruciano C, Pappalardo AM, Tigano C, Ferrito V. 2014. Phylogeographical relationships of Sicilian brown trout and the effects of genetic introgression on morphospace occupation. Biological Journal of the Linnean Society 112:387-398.
}
\seealso{
\code{\link{rarefied_convex_hull}}, \code{\link{rarefied_disparity}}, \code{\link{BTailTest}}
}
