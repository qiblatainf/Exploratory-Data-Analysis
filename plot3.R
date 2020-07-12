setwd('C:\\Users\\qib\\Desktop\\R Programming\\exdata_data_NEI_data')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)
png(filename = 'C:\\Users\\qib\\Desktop\\R Programming\\exdata_data_NEI_data\\plot3.png', width = 480, height = 480, units='px')
city <- subset(NEI, NEI$fips == '24510')
cityType <- aggregate(Emissions ~ year + type, city, sum)
g <- ggplot(cityType, aes(year, Emissions, col = type)) + geom_line() + geom_point() + 
  ggtitle(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions by Type and Year")) +
  ylab(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions")) +
  xlab("Year") + scale_colour_discrete(name = "Sources") + theme(legend.title = element_text(face = "bold"))
with(NEI, g)
dev.off()

