\name{getComment}
\alias{getComment}
\alias{getComment<-}
\alias{setComment}
\title{getComment}
\description{Extracts the comment from a MAgPIE-object}
\usage{getComment(x)
       getComment(x) <- value
       setComment(object,nm)
       }
\arguments{
  \item{x,object}{MAgPIE object}
  \item{value,nm}{A vector containing the comment.}
}

\value{getComment returns the comment attached to a MAgPIE-object, NULL if no comment is present. setComment returns the magpie object with the modified comment.}
\author{Markus Bonsch}
\seealso{\code{\link{getRegions}}, \code{\link{getNames}}, \code{\link{getYears}}, \code{\link{getCPR}}, \code{\link{read.magpie}}, \code{\link{write.magpie}}, \code{"\linkS4class{magpie}"}}
\examples{
 a <- as.magpie(1)
 #returns NULL
 getComment(a)
 #set the comment
 getComment(a)<-c("bla","blubb")
 getComment(a)
}
