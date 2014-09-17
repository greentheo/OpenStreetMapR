library(shiny)
library(OpenStreetMapR)
library(ggplot2)

shinyUI(basicPage(
  mainPanel(
    tags$head(tags$script(src="leaflet.js"),
              tags$link(rel = "stylesheet", type = "text/css", href = "leaflet.css"),
              tags$script(src="jquery-1.10.1.min.js"),
              tags$script(src="jquery-migrate-1.2.1.min.js")
    ),
    h3('SomeText'),
    htmlOutput('liveView'),
    htmlOutput('anotherView')
    )
  )
)