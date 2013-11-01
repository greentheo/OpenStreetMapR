\name{OSMMap}
\alias{OSMMap}
\title{OSMMap}
\usage{
  OSMMap(df, ..., lat="lat", long="long", size=8,
    color="#00FFFF",popup='', line=NULL, layer="layer1")
}
\arguments{
  \item{df}{is a dataFrame containing (at the least) two
  features called "lat" and "long"}

  \item{...}{other parameters which can be passed into the
  mapping function see details.}

  \item{lat}{indicates the column name of the df that gives
  the latitude of points or lines.}

  \item{long}{indicates the column name of the df that
  gives the latitude of the points lines.}

  \item{size}{indicates which column in the df gives the
  size of the marker, automatically scaled.}

  \item{color}{indicates which column of the df gives the
  color, must be valid hex colors.}

  \item{popup}{indicates which column of the df provides
  text to place in the onClick popup for each map marker.}

  \item{line}{indicates the column of the df that gives the
  line label for interpreting sequential points as a line
  rather than many markers.}

  \item{layer}{name for the layer to appear on the OSMMap
  Plot.}
}
\description{
  The base level function for creating an interactive map
  with Open Street Maps
}
\details{
  OpenStreetMap Mapping utility
}
\examples{
\dontrun{
#generate rand lats and longs near Denver,CO
df = data.frame(lat=runif(10, 38,40), long=-runif(10, 104,106),
               size=runif(10)*20, color=sample(rainbow(3), 10, replace=TRUE),
               line=sample(1:3, 10,replace=TRUE))
#base plot
plot(OSMMap(df))

#plot with specified size and color for markers
plot(OSMMap(df, size='size', color='color'))

#plot out a set of lines
linePlot = OSMMap(df, line='line')
plot(linePlot)
}
}
\author{
  Theo Van Rooy <theo
}

