\name{copy.magpie}
\alias{copy.magpie}
\alias{copy.magpie}
\title{Copy MAgPIE-files}
\description{This function copies MAgPIE-files from one location to another. During the copying it is also possible to change the file type (e.g. from 'mz' to 'csv')}
\usage{
copy.magpie(input_file, output_file)
}
\arguments{
  \item{input_file}{file, that should be copied}
  \item{output_file}{copy destination}
}
\author{Jan Philipp Dietrich}
\seealso{\code{\link{read.magpie}},\code{\link{write.magpie}}}
\examples{
# copy.magpie("bla.csv","blub.mz")
}