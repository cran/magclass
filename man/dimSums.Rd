\name{dimSums}
\alias{dimSums}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Summation over dimensions}
\description{ This function sums over any dimension of a magpie object or an array
}
\usage{
dimSums(x,na.rm=FALSE,dims=NULL,dim=3,sep=".",...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ A MAgPIE-object or an array }
  \item{na.rm}{logical. Should missing values (including NaN) be omitted from the calculations? }
  \item{dims}{Depreceated version of argument dim. Please use dim instead (it is just it there for back compatibility and will be removed soon.)}
  \item{dim}{The dimensions(s) to sum over. A vector of integers or characters (dimension names). If the MAgPIE object has more than 1 actual dimension collected in the third real dimension, each actual dimension can be summed over using the corresponding dim code (see \code{\link{dimCode}} for more information)}
  \item{sep}{A character separating joined dimension names}
  \item{...}{ Further arguments passed to rowSums internally}  
}
\value{
  \item{value}{A MAgPIE object or an array (depending on the format of x) with values summed over the specified dimensions}
}
\author{Markus Bonsch, Ina Neher, Benjamin Bodirsky, Jan Philipp Dietrich}
\seealso{\code{\link{rowSums}}, \code{\link{dimSums}}, \code{\link{dimCode}}}
\examples{
  test<-as.magpie(array(1:4,dim=c(2,2)))
  dimSums(test,dim=c(1,3))
  dimSums(test[,,1],na.rm=TRUE,dim=c(1,2))
  
}