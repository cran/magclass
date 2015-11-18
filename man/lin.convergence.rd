\name{lin.convergence}
\alias{lin.convergence}
\title{lin.convergence}
\description{Cross-Fades the values of one MAGPIE object into the values of another over a certain time}
\usage{
lin.convergence(origin, aim, convergence_time_steps=NULL,start_year=NULL, 
                end_year=NULL, before="stable", after="stable")}
\arguments{
  \item{origin}{an object with one name-column}
  \item{aim}{Can be twofold: An object with one name-column and the same timesteps as origin. Then the model fades over from timestep 1, in which the value of origin is valid, to the last timestep, n which the value of aim is valid. In the second case, the aim object has to have only one timestep, which is also in origin. Then, the data will be faded from the value of origin in the first timestep to the value of aim in the timestep passed on by aim.}
  \item{convergence_time_steps}{In the case of timesteps(origin)==timesteps(aim), convergence_time_steps delivers the number of time_steps in which the convergence process shall be completed (e.g. 6 for y2055). }
  \item{start_year}{year in which the convergence from origin to aim starts. Value can also be a year not contained in the dataset.}
  \item{end_year}{year in which the convergence from origin to aim shall be reached. Value can also be a year not contained in the dataset. Can be used only alternatively to convergence_time_steps.}  
  \item{before}{"stable" leaves the value at origin. If a year is entered, convergence begins at aim, reaches origin at start_year, and goes back to aim until end_year.} 
  \item{after}{"stable" leaves the value at aim. All other values let the convergence continue in the same speed even beyond the end_year, such that the values of aim are left.}     
}
\value{ returns a time-series with the same timesteps as origin, which lineary fades into the values of the aim object }
\author{Benjamin Bodirsky}
\seealso{\code{\link{lin.convergence}}}
\examples{
data(population_magpie)
population <- add_columns(population_magpie,"MIX")
population[,,"MIX"] <- lin.convergence(population[,,"A2"],population[,,"B1"],
                                       convergence_time_steps=10)
}

  
