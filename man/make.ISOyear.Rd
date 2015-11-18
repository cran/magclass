\name{make.ISOyear}
\alias{make.ISOyear}
\title{Create lookup-table for efficient conversion of years to POSIX}
\description{Create lookup-table for efficient conversion of years to POSIX}
\usage{make.ISOyear(start = 1900, end = 2200, by = 5)}
\arguments{
  \item{start}{start year}
  \item{end}{end year}
  \item{by}{by}

}
\value{POSIX format as used in quitte}
\author{Michaja Pehl, Anselm Schultes}
\examples{
#       ISOyear <- make.ISOyear()
#       ISOyear(2016)
}
