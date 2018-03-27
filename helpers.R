library(grid)
library(gridExtra)
percent_map <- function(var, color, plot.title = "Title", start.date, end.date) {
  # p <- ggplot()
  # p <- p + geom_polygon(data = var, aes(x=long, y=lat, group = group
  #                                            ,fill=as.numeric(percent)), color="black")
  # p <- p + theme(axis.title = element_blank(), axis.text = element_blank(), axis.ticks = element_blank()) +
  #   labs(subtitle = "question", fill = "Percent")
  # p <- p + ggtitle("HCAHPS Scores By State")
  # p <- p + scale_fill_gradient(low="white", high="red")
  # p 
  # To wrap title text below
  char.space <- gregexpr(pattern = " ", plot.title)[[1]][10]
  this.title <- ifelse(is.na(char.space), plot.title, paste(substr(plot.title, 1, char.space), "\n", substr(plot.title, char.space+1, nchar(plot.title)), sep = ""))

  p <- ggplot(data = var, aes(x=long, y=lat, group = group
                                   ,fill=as.numeric(percent)))
  p <- p + geom_polygon(color = "black")
  p <- p + labs(fill = "Percent" #, title = bquote(atop(.(this.title), atop(italic("HCAHPS Survey Response Results"), "")))) +
    # ,title = this.title, subtitle = "HCAHPS Survey Response Results"
    ) +
    ggtitle(bquote(atop(.(plot.title), atop(italic("HCAHPS Survey Response Results"), "")))) +
    theme(
        axis.title = element_blank(), axis.text = element_blank()
                 , axis.ticks = element_blank(), panel.background = element_blank()
                 , panel.grid = element_blank()
          ,
        plot.title = element_text(hjust=0.5)
        ) 
    # ggtitle(bquote(atop(.(plot.title), atop(italic("HCAHPS Survey Response Results"), "")))) +
  p <- p + scale_fill_gradient(low="white", high=color)
  p
  # Add caption
  survey.dates <- paste("Survey dates: ", start.date, " - ", end.date, sep = "")
  source.data <- "Data source: http://www.healthdata.gov/dataset/patient-survey-hcahps-state"
  caption <- paste(survey.dates, "Maryland: Data suppressed by CMS for one or more quarters.", source.data, sep="\n")
  g <- arrangeGrob(p, bottom = textGrob(caption, x = 0, hjust = 0.0, vjust=0.1, gp = gpar(fontface = "italic", fontsize = 12)))
  grid.draw(g)
}

