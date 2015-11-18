\name{magpie_expand}
\alias{magpie_expand}
\title{magpie_expand}
\description{Expands a MAgPIE object based on a reference}
\usage{magpie_expand(x,ref)}
\arguments{
  \item{x}{MAgPIE object that should be expanded}
  \item{ref}{MAgPIE object that serves as a reference}
}
\value{An expanded version of x.}
\details{Expansion means here that the dimensions of x are expanded acordingly to ref. Please note that
this is really only about expansion. In the case that one dimension of ref is smaller than of x nothing
happens with this dimension. At the moment magpie_expand is only internally available in the magclass 
library

You can influence the verbosity of this function by setting the option "magclass.verbosity". By default 
verbosity is set to 2 which means that warnings as well as notes are returned. Setting verbosity to 1 means
that only warnings are returned but no notes. This is done by options(verbosity.level=1)}
\author{Jan Philipp Dietrich}
\seealso{\code{\link{as.magpie}}, \code{\link[base]{options}}}
\examples{
 a <- new.magpie(c("AFR","CPA"),"y1995",c("m","n"))
 b <- new.magpie("GLO","y1995",c("bla","blub"))
 magpie_expand(b,a)
 options(magclass.verbosity=1)
 magpie_expand(b,a)
}

  
