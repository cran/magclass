\name{getRegions}
\alias{getRegions}
\alias{getRegions<-}
\title{Get regions}
\description{Extracts regions of a MAgPIE-object}
\usage{getRegions(x)
       getRegions(x) <- value}
\arguments{
  \item{x}{MAgPIE object}
  \item{value}{Vector containing the new region names of the MAgPIE objects. If you also want to change the mapping of regions to cell please use \code{\link{getRegionList}} instead.}
}
\value{Regions of the MAgPIE-object}
\author{Jan Philipp Dietrich}
\seealso{\code{\link{getYears}}, \code{\link{getNames}}, \code{\link{getCPR}}, \code{\link{read.magpie}}, \code{\link{write.magpie}}, \code{"\linkS4class{magpie}"}}
\examples{
# a <- read.magpie("example.mz")
# getRegions(a)
}
