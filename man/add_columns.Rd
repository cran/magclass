\name{add_columns}
\alias{add_columns}
\title{add_columns}
\description{Function adds new columns to the existing magpie object. The new columns are filled with NAs.}
\usage{add_columns(x,addnm=c("new"),dim=3.1)}
\arguments{
  \item{x}{MAgPIE object which should be extended.}
  \item{dim}{The number of the dimension that should be extended}
  \item{addnm}{The new columns within dimension "dim"}
}
\value{
  The extended MAgPIE object}
\author{Benjamin Bodirsky}
\seealso{\code{\link{add_dimension}},\code{\link{mbind}}}
\examples{
 data(population_magpie)
 a <- add_columns(population_magpie)
 str(a)
 fulldim(a)
}