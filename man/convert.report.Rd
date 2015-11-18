\name{convert.report}
\alias{convert.report}

\title{Converts a report from one model to another}
\description{This function converts the content of a reporting file from one model to another}
\usage{convert.report(rep,inmodel=NULL,outmodel="MAgPIE",full=FALSE,as.list=TRUE)}

\arguments{
  \item{rep}{Report. Either the file name of a mif file or a report already read in in R.}
  \item{inmodel}{Model the input comes from. If NULL the script tries to detect the inmodel automatically.}
  \item{outmodel}{Model format the data should be converted to. Currently, only "MAgPIE" is available}
  \item{full}{Boolean deciding whether only the converted output should be returned (FALSE) or the new output together with the input (TRUE)}
  \item{as.list}{if TRUE a list is returned (default), if FALSE it is tried to merge all information in one MAgPIE object (still under development and works currently only if the entries for the different models and scenarios have exactly the same regions and years).}
}
\details{ The function converts data based on a region mapping and transformation rules which are stored in the variable magclassdata which comes with this library.}
\author{Jan Philipp Dietrich}

\seealso{\code{\link{read.report}},\code{\link{write.report}},\code{\link{magclassdata}}}

\examples{
\dontrun{convert.report("report.mif")}
}


