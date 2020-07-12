setwd('C:\\Users\\qib\\Desktop\\R Programming\\exdata_data_NEI_data')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(filename = 'C:\\Users\\qib\\Desktop\\R Programming\\exdata_data_NEI_data\\plot4.png', width = 480, height = 480, units='px')
library(ggplot2)
shortname <- SCC$Short.Name
SCCCoal <- SCC[grepl("coal", shortname, ignore.case = T),]
NEICoal <- NEI[NEI$SCC %in% SCCCoal$SCC,]
Coal <- aggregate(Emissions ~ year + type, NEICoal, sum)

g <- ggplot(Coal, aes(year, Emissions, col = type)) +
  geom_line() +
  geom_point() + 
  ggtitle(expression("Total Coal Emission by Type and Year")) +
  xlab("Year") +
  ylab(expression("Coal Emission")) +
  scale_colour_discrete(name = "Sources") +
  theme(legend.title = element_text(face = "bold"))

with(SCC, NEI, g)
dev.off()
