\name{quitte-class}
\docType{class}
\alias{quitte-class}
\alias{as.quitte}
\alias{as.quitte-methods}
\alias{as.quitte,quitte-method}
\alias{as.quitte,data.frame-method}
\alias{as.quitte,magpie-method}
\alias{is.quitte}

\title{Class "quitte" ~~~ }
\description{The quitte class is a more standardized data.frame format. \code{is.quitte} tests if \code{x} is an quitte-object, \code{as.quitte}
transforms \code{x} to an quitte-object (if possible). }
\usage{
is.quitte(x, warn=TRUE)
as.quitte(x, ...)
}
\arguments{
  \item{x}{ An object that should be either tested or transformed as/to an quitte-object. }
  \item{...}{period class: integer or POSIXct}
  \item{warn}{Boolean which determines whether warnings should be shown in the case that the class attribute of the object is "quitte" but it actually does not follow the quitte standard. If the object does no fullfill all quitte standards \code{is.quitte} will return FALSE in any case.}
}

\author{ Jan Philipp Dietrich }

\seealso{
	\code{\link{as.magpie}}
}
\examples{
showClass("quitte")

data(population_magpie)
q <- as.quitte(population_magpie)
is.quitte(q)
m <- as.magpie(q)

}
\keyword{classes}
