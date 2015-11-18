\name{read.report}
\alias{read.report}

\title{Read file in report format}
\description{This function reads the content of a reporting file (a file in the model intercomparison file format *.mif) into a list of MAgPIE objects or a single MAgPIE object}
\usage{read.report(file,as.list=TRUE)}

\arguments{
  \item{file}{file name the object should be read from.}
  \item{as.list}{if TRUE a list is returned (default), if FALSE it is tried to merge all information in one MAgPIE object (still under development and works currently only if the entries for the different models and scenarios have exactly the same regions and years).}
}
\author{Jan Philipp Dietrich}

\seealso{\code{\link{write.report}}}

\examples{
\dontrun{
  read.report("report.csv")
}
}


