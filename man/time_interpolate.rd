\name{time_interpolate}
\alias{time_interpolate}
\title{time_interpolate}
\description{Function to extrapolate missing years in MAgPIE objects.}
\usage{
time_interpolate(dataset, interpolated_year, 
                 integrate_interpolated_years=FALSE,
                 extrapolation_type="linear")}
\arguments{
  \item{dataset}{An MAgPIE object}
  \item{interpolated_year}{Vector of years, of which values are required. Can be in the formats 1999 or y1999.}
  \item{integrate_interpolated_years}{FALSE returns only the dataset of the interpolated year, TRUE returns the whole dataset, including all years of data and the itnerpolated year}
  \item{extrapolation_type}{Determines what happens if extrapolation is required, i.e. if a requested year lies outside the range of years in \code{dataset}. Specify "linear" for a linear extrapolation. "constant" uses the value from dataset closest in time to the requested year.}
}
\value{ Uses linear extrapolation to estimate the values of the interpolated year, using the values of the two surrounding years. If the value is before or after the years in data, the two closest neighbours are used for extrapolation. }
\author{Benjamin Bodirsky, Jan Philipp Dietrich}
\seealso{\code{\link{lin.convergence}}}
\examples{
data(population_magpie)
time_interpolate(population_magpie,"y2000",integrate=TRUE)
time_interpolate(population_magpie,c("y1980","y2000"),integrate=TRUE,extrapolation_type="constant")
}

  
