# A list of the state averages for the HCAHPS survey responses. 
# HCAHPS is a national, standardized survey of hospital patients about their experiences 
# during a recent inpatient hospital stay.

# Date: 7/26/2016
# Provide a geographical representation of HCAHPS scores by state

# Read in data
df <- read.csv("https://data.medicare.gov/api/views/84jm-wiui/rows.csv?accessType=DOWNLOAD", header = TRUE)
head(df)

# Get start and end dates of survey
start.date <- as.character(unique(df$Measure.Start.Date))
end.date <- as.character(unique(df$Measure.End.Date))

# Create dictionary for state abbreviations and names
state.abbrev <- c("AK", "AL", "AR", "AS", "AZ"
                  , "CA", "CO", "CT"
                  , "DC", "DE"
                  , "FL"
                  , "GA", "GU"
                  , "HI"
                  , "ID", "IA", "IL", "IN"
                  , "KS", "KY"
                  , "LA"
                  , "MO", "MA", "MD", "ME", "MI", "MN", "MP", "MS", "MT"
                  , "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY"
                  , "OH", "OK", "OR"
                  , "TN"
                  , "PA", "PR"
                  , "SC" 
                  , "RI"
                  , "SD"
                  , "TX"
                  , "UT"
                  , "VA", "VI", "VT"
                  , "WA", "WI", "WV", "WY")
State.names <- c("alaska", "alabama", "arkansas", "american samoa", "arizona"
                 , "california", "colorado", "connecticut"
                 , "district of columbia", "delaware"
                 , "florida"
                 , "georgia", "guam"
                 , "hawaii"
                 , "idaho", "iowa", "illinois", "indiana"
                 , "kansas", "kentucky"
                 , "louisiana"
                 , "missouri", "massachusetts", "maryland", "maine", "michigan", "minnesota", "northern mariana islands", "mississippi", "montana"
                 , "north carolina", "north dakota", "nebraska", "new hampshire", "new jersey", "new mexico", "nevada", "new york"
                 , "ohio", "oklahoma", "oregon"
                 , "tennessee"
                 , "pennsylvania", "puerto rico"
                 , "south carolina"
                 , "rhode island"
                 , "south dakota"
                 , "texas"
                 , "utah"
                 , "virginia", "virgin islands", "vermont"
                 , "washington", "wisconsin", "west virginia", "wyoming")

states.mapping <- data.frame(State.names, state.abbrev)
# Add state names to df
df <- merge(df, states.mapping, by.x = "State", by.y = "state.abbrev")

# Add percent column without '%' sign
df$percent <- sub("%", "", df$HCAHPS.Answer.Percent)

# Filter to only the variables we need
library(dplyr)
subdf <- select(df, State, State.names, HCAHPS.Question, percent)

# Reshape the dataset to a wide format
widedf <- reshape(subdf, v.names = c("percent"), timevar = "HCAHPS.Question", idvar = c("State.names"), direction = "wide")

# Get US state map data
library(ggplot2)
library(maps)
all_states <- map_data("state")

# To test, filter to just one question: Patients who reported YES, they would definitely recommend the hospital
# subwidedf <- select(widedf, State.names, percent = 33)

# Join all_states and df on state name
plotData <- merge(all_states, widedf, by.y = "State.names", by.x = "region")

# Plot the data
# plot.subtitle <- "Subtitle"
# p <- ggplot(data = plotData, aes(x=long, y=lat, group = group
#                                  ,fill=as.numeric(percent)))
# p <- p + geom_polygon(color = "black")
# p <- p + theme(axis.title = element_blank(), axis.text = element_blank()
#                , axis.ticks = element_blank(), panel.background = element_blank()
#                , panel.grid = element_blank()) +
#   ggtitle(bquote(atop("HCAHPS", atop(italic(.(plot.subtitle)), "")))) +
#   labs(fill = "Percent")
# p <- p + scale_fill_gradient(low="white", high="red")
# p


