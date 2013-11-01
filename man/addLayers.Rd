\name{addLayers}
\alias{addLayers}
\title{addLayers}
\usage{
  addLayers(OSMMap1, OSMMap2)
}
\arguments{
  \item{OSMMap1}{a map object resulting from the call to
  OSMMap}

  \item{OSMMap2}{another map object resulting from a call
  to OSMMap}
}
\description{
  Take two maps and mesh them so that the markers are on
  different layers
}
\details{
  OpenStreetMap Layer adding function
}
\examples{
\dontrun{
dualMap = (addLayers(OSMMap(df, size='size', color='color'),
linePlot))
}
}
\author{
  Theo Van Rooy <theo
}

