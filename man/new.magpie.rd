\name{new.magpie}
\alias{new.magpie}
\title{new.magpie}
\description{Creates a new MAgPIE object}
\usage{new.magpie(cells_and_regions="GLO",years=NULL,names=NULL,fill=NA,sort=FALSE,sets=NULL)}
\arguments{
  \item{cells_and_regions}{Either the region names (e.g. "AFR"), or the cells (e.g. 1:10), or both in combination (e.g. "AFR.1"). NULL means no spatial element.}
  \item{years}{dimnames for years in the format "yXXXX" or as integers. NULL means one year which is not further specified}
  \item{names}{dimnames for names. NULL means one data element which is not further specified}
  \item{fill}{Default value for the MAgPIE object}    
  \item{sort}{Bolean. Decides, wheher output should be sorted or not.}
  \item{sets}{A vector of dimension names. See \code{\link{getSets}} for more information.}
}
\value{an empty magpie object filled with fill, with the given dimnames}
\author{Benjamin Bodirsky, Jan Philipp Dietrich}
\seealso{\code{\link{as.magpie}}}
\examples{
 a <- new.magpie(1:10,1995:2000)
 b <- new.magpie(c("AFR","CPA"),"y1995",c("bla","blub"),sets=c("i","t","value"))
 c <- new.magpie()
}

  
