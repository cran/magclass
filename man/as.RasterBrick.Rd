% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/as.RasterBrick.R
\name{as.RasterBrick}
\alias{as.RasterBrick}
\title{as.RasterBrick}
\usage{
as.RasterBrick(x, res = NULL)
}
\arguments{
\item{x}{MAgPIE object}

\item{res}{spatial data resolution. If not provided it will be guessed.}
}
\value{
A RasterBrick object
}
\description{
Convert magclass object to a RasterBrick object
}
\examples{
\dontrun{
if (requireNamespace("raster", quietly = TRUE)) {
   r <- raster::brick(ncols = 36, nrows = 18, nl = 4)
   r[14:18, 25:28] <- (1:20 \%*\% t(1:4))
   names(r) <- c("y2000..bla", "y2001..bla", "y2000..blub", "y2001..blub")
   m <- as.magpie(r)
   r2 <- as.RasterBrick(m)
}
}
}
\seealso{
\code{\link{getCoords}}
}
\author{
Jan Philipp Dietrich
}
