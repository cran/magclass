\name{is.temporal}
\alias{is.temporal}
\alias{is.spatial}
\title{is.temporal, is.spatial}
\description{Functions to find out whether a vector consists of strings consistent with the definition for auto-detection of temporal or spatial data.}
\usage{is.temporal(x)
is.spatial(x)}
\arguments{
  \item{x}{A vector}
}
\value{ Returns TRUE or FALSE }
\author{Jan Philipp Dietrich}
\examples{
is.temporal(1991:1993)
is.spatial(c("GLO","AFR"))
}


