% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PLS_fit.R
\name{pls}
\alias{pls}
\title{Partial least squares (PLS) analysis}
\usage{
pls(X, Y, perm = 999, global_RV_test = TRUE)
}
\arguments{
\item{X, Y}{Matrices or data frames
containing each block of variables
(observations in rows, variables in columns).}

\item{perm}{number of permutations to use for hypothesis testing}

\item{global_RV_test}{logical - whether global significance of the association should be tested}
}
\value{
The function outputs an object of class "pls_fit" and "list" with the following elements:
 \describe{
  \item{XScores}{Scores along each singular (PLS) axis for the first block of variables (X)}
  \item{YScores}{Scores along each singular (PLS) axis for the first block of variables (Y)}
  \item{U}{Left singular axes}
  \item{V}{Right singular axes}
  \item{D}{Singular values}
  \item{percentage_squared_covariance}{Percented squared covariance accounted by each pair of axes}
  \item{global_significance_RV}{(only if perm>0 and global_RV_test is TRUE) Observed value of Escoufier RV coefficient and p value obtained from the permutation test}
  \item{singular_axis_significance}{(only if perm>0) For each pair of singular (PLS) axis, the singular value, the correlation between scores, their significance level based on permutation, and the proportion of squared covariance accounted are reported}
  \item{OriginalData}{Data used in the analysis}
  \item{x_center}{Values used to center data in the X block}
  \item{y_center}{Values used to center data in the Y block}

}
}
\description{
Performs a two-block PLS analysis, optionally allowing
for tests of significance using permutations
}
\details{
This function performs a PLS analysis (sensu Rohlf & Corti 2000).
Given two blocks of variables (shape or other variables) scored on the same observations (specimens),
this analysis finds a series of pairs of axis accounting for maximal covariance between the two blocks.
If tests of significance with permutations are selected, three different significance tests are performed:
 \itemize{
  \item{Global significance:}{ tested using Escoufier RV}
  \item{Axis-specific significance based on singular value:}{ this is the same test described in Rohlf & Corti 2000}
  \item{Axis-specific significance based on correlation of PLS scores:}{ this is a commonly used test which uses as statistic, for each pair of PLS (singular) axes, the correlation of the scores of the first block with the scores of the second block}
}
The object of class pls_fit returned by the function has print() and summary() methods associated to it.
This means that using these generic functions on an object created by this function (see examples), it is possible to obtain information on the results.
In particular, print() returns a more basic set of results on the global association, whereas summary() returns (only if permutation tests are used) results for each pair of singular axes.
}
\section{Notice}{

\itemize{
\item{The function does NOT perform GPA when applied to separate configurations of points.}
\item{When using the Escoufier RV, notice that the value reported is the observed value without rarefaction.
For a description of the problem, please see Fruciano et al 2013. To obtain rarefied estimates of Escoufier RV and their confidence interval, use the function RVrarefied.}
\item{In the permutation test, rows of Y are permuted, so using the block with fewer variables as Y may speed up computations and substantially reduce memory usage}
\item{When using the print() and summary() on the pls_fit objects obtained with this function, some of the values are rounded for ease of interpretation. The non-rounded values can be obtained accessing individual elements of the object (see examples).}
}
}

\section{Citation}{

If you use this function to perform the PLS analysis and test for significance,
cite Rohlf & Corti 2000 (or earlier references outside of geometric morphometrics).
If you report the test of significance based on the Escoufier RV coefficient, also cite Escoufier 1975.
If you also use the major axis approach to obtain estimates of the shape (or other variable)
predicted by each pair of axes, please cite Fruciano et al. 2020
}

\examples{

##############################
### Example 1: random data ###
##############################

library(MASS)
set.seed(123)
A=as.data.frame(mvrnorm(100,mu=rep(0,20), Sigma=diag(20)))
B=as.data.frame(mvrnorm(100,mu=rep(0,10), Sigma=diag(10)))
# Create two blocks of, respectively, 20 and 10 variables
# for 100 observations.
# This simulates two different blocks of data (shape or otherwise) measured on the same individuals.
# Note that, as we are simulating them independently,
# we don't expect substantial covariation between blocks

PLS_AB=pls(A, B, perm=99)
# Perform PLS analysis and use 99 permutations for testing
# (notice that in a real analysis, normally one uses more permutations)
print(PLS_AB)
# As expected, we do not find significant covariation between the two blocks

summary(PLS_AB)
# The same happens when we look at the results for each of the axes

# Notice that both for print() and summary() some values are rounded for ease of visualization
# However, the correct values can be always obtained from the object created by the function
# e.g.,
PLS_AB$singular_axis_significance


######################################
### Example 2: using the classical ###
### iris data set as a toy example ###
######################################

data(iris)
# Import the iris dataset
set.seed(123)

versicolor_data=iris[iris$Species=="versicolor",]
# Select only the specimens belonging to the species Iris versicolor
versicolor_sepal=versicolor_data[,grep("Sepal", colnames(versicolor_data))]
versicolor_petal=versicolor_data[,grep("Petal", colnames(versicolor_data))]
# Separate sepal and petal data
PLS_sepal_petal=pls(versicolor_sepal, versicolor_petal, perm=99)
# Perform PLS with permutation test
# (again, chosen few permutations)

print(PLS_sepal_petal)
summary(PLS_sepal_petal)
# Global results and results for each axis (suggesting significant association)


}
\references{
Escoufier Y. 1973. Le Traitement des Variables Vectorielles. Biometrics 29:751-760.

Fruciano C, Colangelo P, Castiglia R, Franchini P. 2020. Does divergence from normal patterns of integration increase as chromosomal fusions increase in number? A test on a house mouse hybrid zone. Current Zoology 66:527–538.

Rohlf FJ, Corti M. 2000. Use of Two-Block Partial Least-Squares to Study Covariation in Shape. Systematic Biology 49:740-753.
}
\seealso{
\code{\link{RVrarefied}}
}
