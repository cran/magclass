\name{as.data.frame-methods}
\docType{methods}
\alias{as.data.frame}
\alias{as.data.frame-methods}
\alias{as.data.frame,ANY-method}
\alias{as.data.frame,magpie-method}
\title{ ~~ Methods for Function as.data.frame  ~~}
\description{
 ~~ Methods for function \code{as.data.frame}  ~~
}
\arguments{
  \item{x}{A MAgPIE-object}
  \item{rev}{The revision of the algorithm that should be used for conversion. rev=1 creates columns with the predefined names Cell, Region, Year, Data1, Data2,... and Value, rev=2 uses the set names of the MAgPIE object for naming and adds an attribute "dimtype" to the data.frame which contains information about the types of the different columns (spatial, temporal, data or value).}
}
\section{Methods}{
\describe{

\item{\code{signature(x = "magpie")}}{
  Conversion creates columns for Cell, Region, Year, Data1, Data2,... and Value
}
}}
\examples{
data(population_magpie)
head(as.data.frame(population_magpie))
head(as.data.frame(population_magpie,rev=2))
}
\keyword{methods}

