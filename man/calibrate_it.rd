\name{calibrate_it}
\alias{calibrate_it}
\title{calibrate_it}
\description{Standardized functions to calibrate values to a certain baseyear.}
\usage{calibrate_it(origin, cal_to, cal_type="convergence", cal_year=NULL, 
                    end_year=NULL, report_calibration_factors=FALSE)}
\arguments{        
  \item{origin}{Original Values (MAgPIE object)}
  \item{cal_to}{Values to calibrate to (MAgPIE object). }
  \item{cal_type}{"none" leaves the values as they are, "convergence" starts from the aim values and then linearily converges towards the values of origin, "growth_rate" uses the growth-rates of origin and applies them on aim.}
  \item{cal_year}{year on which the dataset should be calibrated.}  
  \item{end_year}{only for cal_type="convergence". Year in which the calibration shall be faded out.}   
  \item{report_calibration_factors}{prints out the multipliers which are used for calibration.}  
}
\value{ Calibrated dataset.}
\author{Benjamin Bodirsky}
\seealso{\code{\link{convergence}},\code{\link{lin.convergence}}}
\examples{
  data(population_magpie)
  test<-as.magpie(array(1000,dim(population_magpie[,,"A2"]),dimnames(population_magpie[,,"A2"])))
  calibrate_it(origin=population_magpie,cal_to=test[,"y1995",],cal_type="growth_rate")
  calibrate_it(origin=population_magpie,cal_to=test[,"y1995",],cal_type="convergence", 
               cal_year="y1995", end_year="y2055")
  calibrate_it(origin=population_magpie,cal_to=test[,"y1995",],cal_type="none")
}
