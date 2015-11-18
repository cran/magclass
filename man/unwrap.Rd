\name{unwrap}
\alias{unwrap}

\title{Unwrap}
\description{Reconstruct the full dimensionality of a MAgPIE object}
\usage{unwrap(x,sep=".")}

\arguments{
  \item{x}{A MAgPIE object}
  \item{sep}{A character separating joined dimension names}
}
\value{An array with the full dimensionality of the original data}
\author{Jan Philipp Dietrich}

\seealso{\code{\link{wrap}},\code{\link{fulldim}}}
\examples{
  a <- as.magpie(array(1:6,c(3,2),list(c("bla","blub","ble"),c("up","down"))))
  fulldim(a)
  unwrap(a)
}




