\name{getCells}
\alias{getCells}
\alias{getCells<-}
\alias{setCells}
\title{Get Cells}
\description{Extracts cell names of a MAgPIE-object}
\usage{getCells(x)
       getCells(x) <- value
       setCells(object,nm)}
\arguments{
  \item{x,object}{MAgPIE object}
  \item{value,nm}{cell names the data should be set to.}
}
\details{setCells is a shortcut to use a MAgPIE object with manipulated cell names. setCells uses the variable names "object" and "nm" in order to be consistent to the already existing function setNames.}
\value{getCells returns cell names of the MAgPIE-object, whereas setCells returns the MAgPIE object with the manipulated cell names.}
\author{Jan Philipp Dietrich}
\seealso{\code{\link{getRegions}}, \code{\link{getNames}}, \code{\link{setNames}}, \code{\link{getCPR}}, \code{\link{read.magpie}}, \code{\link{write.magpie}}, \code{"\linkS4class{magpie}"}}
\examples{
 a <- as.magpie(1)
 getCells(a)
 setCells(a,"AFR.1")
}
