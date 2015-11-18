\name{fulldim}
\alias{fulldim}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Reconstructs full dimensionality of MAgPIE objects}
\description{If a MAgPIE object is created from a source with more than one data dimension, these data dimensions are combined to a single dimension. fulldim reconstructs the original dimensionality and reports it.
}
\usage{
fulldim(x,sep=".")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ A MAgPIE-object }
  \item{sep}{A character separating joined dimension names}
}
\value{
  A list containing in the first element the dim output and in the second element the dimnames output of the reconstructed array.
}
\author{Jan Philipp Dietrich}
\seealso{\code{\link{as.magpie}},\code{\link{unwrap}},\code{\link{wrap}}}
\examples{
  a <- as.magpie(array(1:6,c(3,2),list(c("bla","blub","ble"),c("up","down"))))
  fulldim(a)

}