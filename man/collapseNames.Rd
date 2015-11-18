\name{collapseNames}
\alias{collapseNames}
\title{Collapse dataset names}
\description{This function will remove names in the data dimension which are the same for each element (meaning that this data dimension contains exactly one element)}
\usage{collapseNames(x,collapsedim=NULL)}
\arguments{
  \item{x}{MAgPIE object}
  \item{collapsedim}{If you want to remove the names of particular dimensions provide the dimensions here. Default: NULL}
  }
\value{The provided MAgPIE object with collapsed names}
\author{Jan Philipp Dietrich, David Klein}
\seealso{\code{\link{getNames}}, \code{\link{setNames}}, \code{"\linkS4class{magpie}"}}
\examples{
 x <- new.magpie("GLO",2000,c("bla.a","bla.b"))  
 print(x)
 # An object of class "magpie"
 # , , bla.a
 #      y2000
 # GLO.1    NA
 # , , bla.b
 #      y2000
 # GLO.1    NA

 print(collapseNames(x))
 # An object of class "magpie"
 # , , a
 #      y2000
 # GLO.1    NA
 # , , b
 #      y2000
 # GLO.1    NA

}
