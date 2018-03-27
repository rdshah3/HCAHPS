# ui.R

shinyUI(fluidPage(
  tags$img(src = "download.png", height=59, width=233),
  
  sidebarLayout( 
    sidebarPanel(
      helpText("Select the survey question you would like to view"),
      selectInput("var", label = "Choose a question to display", 
                  choices = list(
                    "Patients who reported that their room and bathroom were 'Always' clean" 
                    ,"Patients who reported that their room and bathroom were 'Sometimes' or 'Never' clean" 
                    ,"Patients who reported that their room and bathroom were 'Usually' clean" 
                    ,"Patients who reported that their nurses 'Always' communicated well" 
                    ,"Patients who reported that their nurses 'Sometimes' or 'Never' communicated well" 
                    ,"Patients who reported that their nurses 'Usually' communicated well" 
                    ,"Patients who reported that their doctors 'Always' communicated well"
                    ,"Patients who reported that their doctors 'Sometimes' or 'Never' communicated well" 
                    ,"Patients who reported that their doctors 'Usually' communicated well"
                    ,"Patients who reported that they 'Always' received help as soon as they wanted" 
                    ,"Patients who reported that they 'Sometimes' or 'Never' received help as soon as they wanted" 
                    ,"Patients who reported that they 'Usually' received help as soon as they wanted" 
                    ,"Patients who reported that their pain was 'Always' well controlled"
                    ,"Patients who reported that their pain was 'Sometimes' or 'Never' well controlled" 
                    ,"Patients who reported that their pain was 'Usually' well controlled" 
                    ,"Patients who reported that staff 'Always' explained about medicines before giving it to them" 
                    ,"Patients who reported that staff 'Sometimes' or 'Never' explained about medicines before giving it to them" 
                    ,"Patients who reported that staff 'Usually' explained about medicines before giving it to them" 
                    ,"Patients who reported that NO, they were not given information about what to do during their recovery at home" 
                    ,"Patients who reported that YES, they were given information about what to do during their recovery at home" 
                    ,"Patients who 'Agree' they understood their care when they left the hospital" 
                    ,"Patients who 'Disagree' or 'Strongly Disagree' they understood their care when they left the hospital" 
                    ,"Patients who 'Strongly Agree' they understood their care when they left the hospital" 
                    ,"Patients who gave their hospital a rating of 6 or lower on a scale from 0 (lowest) to 10 (highest)" 
                    ,"Patients who gave their hospital a rating of 7 or 8 on a scale from 0 (lowest) to 10 (highest)" 
                    ,"Patients who gave their hospital a rating of 9 or 10 on a scale from 0 (lowest) to 10 (highest)"
                    ,"Patients who reported that the area around their room was 'Always' quiet at night" 
                    ,"Patients who reported that the area around their room was 'Sometimes' or 'Never' quiet at night" 
                    ,"Patients who reported that the area around their room was 'Usually' quiet at night" 
                    ,"Patients who reported NO, they would probably not or definitely not recommend the hospital" 
                    ,"Patients who reported YES, they would definitely recommend the hospital" 
                    ,"Patients who reported YES, they would probably recommend the hospital" 
                  ), selected = "Patients who reported YES, they would definitely recommend the hospital")

      ),
    mainPanel(
      h1("Hospital Patient Perspective (HCAHPS) Scores By State"),
      p("The HCAHPS (Hospital Consumer Assessment of Healthcare Providers and Systems) survey is a national, 
        standardized, publicly reported survey of patients' perspectives of hospital care. The survey provides a way to
        measure patients' perceptions of their hospital experience at a national level in order to make valid comparisons 
        between states and hospitals. In addition to making comparisons, results provide hospitals the incentive to improve
        quality of care and increase transparency of hospital quality."),
      p("The survey contains 32 questions, spanning aspects of the patients' hospital experience, including
        communication with nurses and doctors, staff responsiveness, hospital environment conditions,
        pain management, communication about medicines, discharge information, hospital rating, and 
        hospital recommendations."),

      h2("Survey Response Results"),
      p("Select a question on the left to view the results below."),
      
      plotOutput("map", width = 800, height = 400*8/6)
      )
  )
))
