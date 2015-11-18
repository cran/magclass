\name{counter}
\alias{ncells}
\alias{nyears}
\alias{ndata}
\alias{nregions}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Count elements}
\description{ Functions to count the number of cells/years/datasets/regions of an
MAgPIE-object
}
\usage{
ncells(x)
nyears(x)
ndata(x,fulldim=FALSE)
nregions(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ A MAgPIE-object }
  \item{fulldim}{specifies, how the object is treated. In case of FALSE, it is assumed that x is 3 dimensional and dimnames(x)[[3]] is returned. In case of TRUE, the dimnames of the real third dimension namesare returned}
}
\value{
  \item{value}{The number of cells/years/datasets/regions of \code{x}}
}
\author{Jan Philipp Dietrich}
\examples{
  a <- is.magpie(NULL)
  ncells(a)
  nyears(a)
  ndata(a)
  nregions(a)
}