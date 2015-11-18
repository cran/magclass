\name{getCPR}
\alias{getCPR}
\title{Get cells per region}
\description{Counts how many cells each region has and returns it as vector}
\usage{getCPR(x)}
\arguments{
  \item{x}{MAgPIE object or a resolution written as numeric (currently only data for 0.5 degree resolution is available).}
}
\value{cells per region}
\author{Jan Philipp Dietrich}
\seealso{\code{\link{getRegions}}, \code{\link{read.magpie}}, \code{\link{write.magpie}}}
\examples{
# a <- read.magpie("example.mz")
# getCPR(a)
getCPR(0.5)
}