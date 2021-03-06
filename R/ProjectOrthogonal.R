#' Project to subspace orthogonal to a vector
#'
#' This function projects data to the subspace orthogonal to a multivariate column vector
#'
#' This function is useful to remove from a dataset the variation along a specific direction
#' (e.g., a principal component).
#' It has been used extensively for many applications, such as
#'  \itemize{
#'   \item 'Size Correction' (removal of an allometric vector),
#'   also called 'Burnaby's method (Burnaby 1966; see also Rohlf & Bookstein 1987)
#'   \item Remove body arching from fish (Valentin et al. 2008; see also Fruciano 2016
#'   for a discussion and other examples of usage in the context of measurement error
#'   in geometric morphometrics)
#'   \item Removing variation due to sexual dimorphism on a set of individuals with
#'   unknown sex (Fruciano et al. 2014)
#' }
#' Optionally, vector can also be a matrix with more than one column
#' (in this case the Data is projected to the subspace orthogonal to the space
#' spanned by all dimensions in vector)
#'
#'
#' @param Data matrix n x p of n observation for p variables,
#' @param vector column vector (matrix p x 1 of p variables)
#'
#' @return The function outputs a matrix n x p of the original data projected
#' to the subspace orthogonal to the vector
#'
#' @references Burnaby T. 1966. Growth-invariant discriminant functions and generalized distances. Biometrics:96-110.
#' @references Fruciano C. 2016. Measurement error in geometric morphometrics. Development Genes and Evolution 226:139-158.
#' @references Fruciano C, Pappalardo AM, Tigano C, Ferrito V. 2014. Phylogeographical relationships of Sicilian brown trout and the effects of genetic introgression on morphospace occupation. Biological Journal of the Linnean Society 112:387-398.
#' @references Rohlf FJ, Bookstein FL. 1987. A Comment on Shearing as a Method for' Size Correction'. Systematic Zoology:356-367.
#' @references Valentin AE, Penin X, Chanut JP, Sévigny JM, Rohlf FJ. 2008. Arching effect on fish body shape in geometric morphometric studies. Journal of Fish Biology 73:623-638.
#'
#' @examples
#' library(MASS)
#' A=mvrnorm(50,mu=rep(1,50),Sigma=diag(50))
#' B=mvrnorm(50,mu=rep(0,50),Sigma=diag(50))
#' AB=rbind(A,B)
#' Group=as.factor(c(rep(1,50),rep(2,50)))
#' # Create two groups of observations (e.g., specimens)
#' # one centered at 0 and the other at 1
#' # and combine them in a single sample
#'
#' PCA=prcomp(AB)
#' # Combine the two groups and perform a PCA
#'
#' plot(PCA$x[,1],PCA$x[,2], asp=1, col=Group)
#' # Plot the scores along the first two principal components
#' # The two groups are clearly distinct (red and black)
#'
#' ABproj=ProjectOrthogonal(AB,cbind(PCA$rotation[,1]))
#' # Project the original data (both groups)
#' # to the subspace orthogonal to the first principal component
#' # (which is the direction along which there is most of variation among groups)
#'
#' PCAproj=prcomp(ABproj)
#' # Perform a new PCA on the 'corrected' dataset
#'
#' plot(PCAproj$x[,1], PCAproj$x[,2], asp=1, col=Group)
#' # Plot the scores along the first two principal components
#' # of the 'corrected' data
#' # Notice how the two groups are now pretty much indistinguishable
#'
#'
#'
#' @import stats
#' @export
ProjectOrthogonal = function(Data, vector) {
    if (is.vector(vector) & !is.list(vector)) {
        vector=cbind(vector)
    }
    if (nrow(vector)!=ncol(Data)) {
      stop(paste("The number of columns of Data (variables) doesn't match the number of variables implied by vector"))
    }
    Ip = diag(nrow(vector))
    F = vector
    L = Ip - F %*% (solve(t(F) %*% F)) %*% t(F)
    ProjectedData = Data %*% L
    return(ProjectedData)
}

