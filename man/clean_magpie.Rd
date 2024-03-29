% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clean_magpie.R
\name{clean_magpie}
\alias{clean_magpie}
\title{MAgPIE-Clean}
\usage{
clean_magpie(x, what = "all", maindim = 1:3)
}
\arguments{
\item{x}{MAgPIE object which should be cleaned.}

\item{what}{term defining what type of cleaning should be performed. Current
modes are "cells" (removes cell numbers if the data seems to be regional -
this should be used carefully as it might remove cell numbers in some cases
in which they should not be removed), "sets" (making sure that all
dimensions have names), "items" (replace empty elements with single spaces " ")
and "all" (performing all available cleaning methods)}

\item{maindim}{main dimension(s)  the cleaning should get applied to.}
}
\value{
The eventually corrected MAgPIE object
}
\description{
Function cleans MAgPIE objects so that they follow some extended magpie
object rules (currently it makes sure that the dimnames have names and
removes cell numbers if it is purely regional data)
}
\examples{

pop <- maxample("pop")
a <- clean_magpie(pop)
}
\seealso{
\code{"\linkS4class{magpie}"}
}
\author{
Jan Philipp Dietrich
}
