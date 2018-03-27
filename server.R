library(shiny)

source("helpers.R")
source("PatientSurveyState.R")

# Define server logic required to create map
shinyServer(function(input, output, session) {
  # output$text1 <- renderText({ 
  #   paste("You have selected question: ", input$var)
  # })
  output$map <- renderPlot({
    data <- switch(input$var,
                   "Patients who reported that their room and bathroom were 'Always' clean" = select(plotData, percent = 8, long, lat, group, region),
                   "Patients who reported that their room and bathroom were 'Sometimes' or 'Never' clean" = select(plotData, percent = 9, long, lat, group, region),
                   "Patients who reported that their room and bathroom were 'Usually' clean" = select(plotData, percent = 10, long, lat, group, region),
                   "Patients who reported that their nurses 'Always' communicated well" = select(plotData, percent = 11, long, lat, group, region),
                   "Patients who reported that their nurses 'Sometimes' or 'Never' communicated well" = select(plotData, percent = 12, long, lat, group, region),
                   "Patients who reported that their nurses 'Usually' communicated well" = select(plotData, percent = 13, long, lat, group, region),
                   "Patients who reported that their doctors 'Always' communicated well" = select(plotData, percent = 14, long, lat, group, region),
                   "Patients who reported that their doctors 'Sometimes' or 'Never' communicated well" = select(plotData, percent = 15, long, lat, group, region),
                   "Patients who reported that their doctors 'Usually' communicated well" = select(plotData, percent = 16, long, lat, group, region),
                   "Patients who reported that they 'Always' received help as soon as they wanted" = select(plotData, percent = 17, long, lat, group, region),
                   "Patients who reported that they 'Sometimes' or 'Never' received help as soon as they wanted" = select(plotData, percent = 18, long, lat, group, region),
                   "Patients who reported that they 'Usually' received help as soon as they wanted" = select(plotData, percent = 19, long, lat, group, region),
                   "Patients who reported that their pain was 'Always' well controlled" = select(plotData, percent = 20, long, lat, group, region),
                   "Patients who reported that their pain was 'Sometimes' or 'Never' well controlled" = select(plotData, percent = 21, long, lat, group, region),
                   "Patients who reported that their pain was 'Usually' well controlled" = select(plotData, percent = 22, long, lat, group, region),
                   "Patients who reported that staff 'Always' explained about medicines before giving it to them" = select(plotData, percent = 23, long, lat, group, region),
                   "Patients who reported that staff 'Sometimes' or 'Never' explained about medicines before giving it to them" = select(plotData, percent = 24, long, lat, group, region),
                   "Patients who reported that staff 'Usually' explained about medicines before giving it to them" = select(plotData, percent = 25, long, lat, group, region),
                   "Patients who reported that NO, they were not given information about what to do during their recovery at home" = select(plotData, percent = 26, long, lat, group, region),
                   "Patients who reported that YES, they were given information about what to do during their recovery at home" = select(plotData, percent = 27, long, lat, group, region),
                   "Patients who 'Agree' they understood their care when they left the hospital" = select(plotData, percent = 28, long, lat, group, region),
                   "Patients who 'Disagree' or 'Strongly Disagree' they understood their care when they left the hospital" = select(plotData, percent = 29, long, lat, group, region),
                   "Patients who 'Strongly Agree' they understood their care when they left the hospital" = select(plotData, percent = 30, long, lat, group, region),
                   "Patients who gave their hospital a rating of 6 or lower on a scale from 0 (lowest) to 10 (highest)" = select(plotData, percent = 31, long, lat, group, region),
                   "Patients who gave their hospital a rating of 7 or 8 on a scale from 0 (lowest) to 10 (highest)" = select(plotData, percent = 32, long, lat, group, region),
                   "Patients who gave their hospital a rating of 9 or 10 on a scale from 0 (lowest) to 10 (highest)" = select(plotData, percent = 33, long, lat, group, region),
                   "Patients who reported that the area around their room was 'Always' quiet at night" = select(plotData, percent = 34, long, lat, group, region),
                   "Patients who reported that the area around their room was 'Sometimes' or 'Never' quiet at night" = select(plotData, percent = 35, long, lat, group, region),
                   "Patients who reported that the area around their room was 'Usually' quiet at night" = select(plotData, percent = 36, long, lat, group, region),
                   "Patients who reported NO, they would probably not or definitely not recommend the hospital" = select(plotData, percent = 37, long, lat, group, region),
                   "Patients who reported YES, they would definitely recommend the hospital" = select(plotData, percent = 38, long, lat, group, region),
                   "Patients who reported YES, they would probably recommend the hospital" = select(plotData, percent = 39, long, lat, group, region))
    # color <- switch(input$var, 
    #                 "Percent White" = "darkgreen",
    #                 "Percent Black" = "black",
    #                 "Percent Hispanic" = "darkorange",
    #                 "Percent Asian" = "darkviolet")
    # 
    # legend <- switch(input$var, 
    #                  "Percent White" = "% White",
    #                  "Percent Black" = "% Black",
    #                  "Percent Hispanic" = "% Hispanic",
    #                  "Percent Asian" = "% Asian")

    percent_map(var = data, color <- "darkgreen"
                , plot.title = input$var
                , start.date = start.date
                , end.date = end.date
                )
  }, width = function() {
    session$clientData$output_map_width
  })
})
