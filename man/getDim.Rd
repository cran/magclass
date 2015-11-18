\name{.getDim}
\alias{.getDim}
\title{getDim}
\description{Function which tries to detect the dimension to which the given elems belong}
\usage{.getDim(elems, x)}
\arguments{
  \item{elems}{A vector of characters containing the elements that should be found in the MAgPIE object}
  \item{x}{MAgPIE object in which elems should be searched for.}
}
\value{The name of the dimension in which elems were found.}
\author{Jan Philipp Dietrich}
\seealso{\code{\link{mcalc}},\code{\link{dimCode}}}
\examples{
 data(population_magpie)
 magclass:::.getDim(c("AFR","CPA"),population_magpie)
}