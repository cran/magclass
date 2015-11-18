\name{old_dim_convention}
\alias{old_dim_convention}
\title{old_dim_convention}
\description{Transforms new dim convention (e.g. 3.2) into old dim convention(e.g. 4)}
\usage{old_dim_convention(dim)}
\arguments{
  \item{dim}{The dim number in the new convention}
}
\value{
  The dim number according to the old convention}
\author{Benjamin Bodirsky}
\seealso{\code{\link{add_columns}},\code{\link{add_dimension}}}
\examples{
  dim=old_dim_convention(3.2)
  dim=old_dim_convention(1.1)
}