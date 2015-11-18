\name{write.reportProject}
\alias{write.reportProject}

\title{Write file in specific project format}
\description{Reads in a reporting.mif or uses a magpie object based on a read in reporting.mif, substitutes names of variables according to the mappping and saves the output in a new *.mif}
\usage{write.reportProject(mif,mapping)}

\arguments{
  \item{mif}{Lists with MAgPIE objects as created by read.report or a path to a report.mif}
  \item{mapping}{mapping of the varialbe names of the read in mif. the header is used for naming.}
}
\author{Christoph Bertram, Lavinia Baumstark}

\seealso{\code{\link{write.report}}}

\examples{
\dontrun{
write.reportProject("REMIND_generic_test.mif","Mapping_generic_ADVANCE.csv")
}
}



