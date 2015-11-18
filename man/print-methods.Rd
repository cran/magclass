\name{print.magpie}
\alias{print.magpie}
\title{print}
\description{print method for MAgPIE objects for conventient display of magpie data.}
\usage{\method{print}{magpie}(x, drop=TRUE, ...)}
\arguments{
  \item{x}{MAgPIE object}
  \item{drop}{argument which controls whether empty dimensions should be skipped or not.}
  \item{...}{arguments to be passed to or from other methods.}
}
\value{print displays the given MAgPIE object on screen.}
\author{Jan Philipp Dietrich}
\seealso{\code{\link[base]{print}}}
\examples{
  data(population_magpie)
  print(population_magpie)
  print(population_magpie[,1,], drop=FALSE)
  print(population_magpie[,1,])
}

