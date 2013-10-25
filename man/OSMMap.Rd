\name{OSMMap}
\alias{OSMMap}
\title{OSMMap}
\usage{
  OSMMap(df, ...)
}
\arguments{
  \item{df}{is a dataFrame containing (at the least) two
  features called "lat" and "long"}

  \item{...}{other parameters which can be passed into the
  mapping function see details.}

  \item{size}{indicates which column in the df gives the
  size of the marker, automatically scaled.}

  \item{indicates}{which column of the df gives the color,
  must be valid hex colors.}
}
\description{
  The base level function for creating an interactive map
  with Open Street Maps
}
\details{
  OpenStreetMap Mapping utility
}
\author{
  Theo Van Rooy theo
}

