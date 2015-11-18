\name{getRegionList}
\alias{getRegionList}
\alias{getRegionList<-}
\title{Get a list of celluare region-belongings}
\description{Extracts a vector containing the region of each cell of a MAgPIE-object}
\usage{getRegionList(x)
       getRegionList(x) <- value}
\arguments{
  \item{x}{MAgPIE object}
  \item{value}{A vector with ncell elements containing the regions of each cell.}
}
\value{
A vector with ncell elements containing the region of each cell.  
}
\author{Jan Philipp Dietrich}
\seealso{\code{\link{getRegions}},\code{\link{getYears}}, \code{\link{getNames}}, \code{\link{getCPR}}, \code{\link{read.magpie}}, \code{\link{write.magpie}}, \code{"\linkS4class{magpie}"}}
\examples{
# a <- read.magpie("example.mz")
# getRegionList(a)
}
