\name{magpiesort}
\alias{magpiesort}
\title{MAgPIE-Sort}
\description{Brings the spatial and temporal structure of MAgPIE objects in the right order. This function is especially useful when you create new MAgPIE objects as the order typically should be correct for MAgPIE objects.}
\usage{magpiesort(x)}
\arguments{
  \item{x}{MAgPIE object which might not be in the right order.}
}
\value{
  The eventually corrected MAgPIE object (right order in spatial in temporal dimension)}
\author{Jan Philipp Dietrich}
\seealso{\code{"\linkS4class{magpie}"}}
\examples{
 data(population_magpie)
 a <- magpiesort(population_magpie)
}