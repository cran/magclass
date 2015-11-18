\name{add_dimension}
\alias{add_dimension}
\title{add_dimension}
\description{Function adds a name dimension as dimension number "dim" with the name "add" with an empty data column with the name "nm".}
\usage{add_dimension(x,dim=3.1,add="new", nm="dummy")}
\arguments{
  \item{x}{MAgPIE object which should be extended.}
  \item{dim}{The dimension number of the new dimension. 4 stands for the second name dimension.}
  \item{add}{The name of the new dimension}
  \item{nm}{The name of the first entry in dimension "add".}
}
\value{
  The extended MAgPIE object}
\author{Benjamin Bodirsky}
\seealso{\code{\link{add_columns}},\code{\link{mbind}}}
\examples{
 data(population_magpie)
 a <- add_dimension(population_magpie)
 str(a)
 fulldim(a)
}