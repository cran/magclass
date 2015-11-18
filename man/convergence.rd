\name{convergence}
\alias{convergence}
\title{convergence}
\description{Cross-Fades the values of one MAGPIE object into the values of another over a certain time}
\usage{
convergence(origin, aim, start_year=NULL, end_year=NULL, 
            direction=NULL, type="smooth", par=1.5)}
\arguments{
  \item{origin}{an object with one name-column}
  \item{aim}{Can be twofold: An magpie object or a numeric value.}
  \item{start_year}{year in which the convergence from origin to aim starts. If set to NULL the the first year of aim is used as start_year}
  \item{end_year}{year in which the convergence from origin to aim shall be (nearly) reached. If set to NULL the the last year of aim is used as end_year. }  
  \item{direction}{NULL, "up" or "down". NULL means normal convergence in both directions, "up" is only a convergence if origin<aim, "down" means only a convergence if origin>aim} 
  \item{type}{"smooth", "s", "linear" or "decay". Describes the type of convergence: 
  linear means a linear conversion , 
  s is an s-curve which starts from origin in start_year and reaches aim precisely in end_year. After 50 percent of the convergence time, it reaches about the middle of the two values. Its based on the function min(1, pos^4/(0.07+pos^4)*1.07)
  smooth is a conversion based on the function x^3/(0.1+x^3). 
  In the latter case only 90\% of convergence will be reached in the end year, because full convergence is reached in infinity.
  decay is a conversion based on the function x/(1.5 + x)*2.5. 
}     
  \item{par}{parameter value for convergence function; currently only used for type="decay"}
}
\value{ returns a time-series with the same timesteps as origin, which lineary fades into the values of the aim object }
\author{Benjamin Bodirsky, Jan Philipp Dietrich}
\seealso{\code{\link{lin.convergence}}}
\examples{
data(population_magpie)
population <- add_columns(population_magpie,"MIX")
population[,,"MIX"]<-convergence(population[,,"A2"],population[,,"B1"])

}

  