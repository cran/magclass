\name{getSets}
\alias{getSets}
\alias{getSets<-}
\title{Get sets}
\description{Extracts sets of a MAgPIE-object if available}
\usage{getSets(x, fulldim=TRUE, sep=".")
       getSets(x, fulldim=TRUE, sep=".") <- value}
\arguments{
  \item{x}{MAgPIE object}
  \item{sep}{A character separating joined dimension names}
  \item{fulldim}{bool: Consider dimension 3 as a possible aggregate of more dimensions (TRUE) or stick to it as one dimension (FALSE)}
  \item{value}{A vector with set names you want to replace the current set names of the object with.}
}
\value{Sets of the MAgPIE-object. If no information about contained sets is available NULL}
\author{Markus Bonsch}
\seealso{\code{\link{getRegions}}, \code{\link{getNames}},\code{\link{getYears}}, \code{\link{getCPR}}, \code{\link{read.magpie}}, \code{\link{write.magpie}}, \code{"\linkS4class{magpie}"}}
\examples{
 a <- new.magpie("GLO.1",2000,c("a.o1","b.o1","a.o2"))
 getSets(a) <- c("reg","cell","t","bla","blub")
 getSets(a)
 
 getSets(a)[4] <- "BLA"
 getSets(a,fulldim=FALSE)
 getSets(a)
}