\name{complete_magpie}
\alias{complete_magpie}
\title{complete_magpie}
\description{MAgPIE objects can be incomplete to reduce memory. This function blows up a magpie object to its real dimensions, so you can apply unwrap.}
\usage{complete_magpie(x,fill=NA)}
\arguments{
  \item{x}{MAgPIE object which should be completed.}
  \item{fill}{Value that shall be written into the missing entries}
}
\value{
  The completed MAgPIE object}
\author{Benjamin Bodirsky}
\seealso{\code{\link{add_dimension}},\code{\link{clean_magpie}}}
\examples{
 data(population_magpie)
 a <- complete_magpie(population_magpie)
 b <- add_dimension(a)
 c <- add_dimension(a,nm="dummy2")
 incomplete<-mbind(b[,,1],c)
 d<-complete_magpie(incomplete)
}