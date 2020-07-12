setwd('C:\\Users\\qib\\Desktop\\R Programming\\exdata_data_NEI_data')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(filename = 'C:\\Users\\qib\\Desktop\\R Programming\\exdata_data_NEI_data\\plot5.png', width = 480, height = 480, units='px')
library(ggplot2)
cityMotor <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")

CityMotorEmission <- aggregate(Emissions ~ year, cityMotor, sum)

g <- ggplot(CityMotorEmission, aes(year, Emissions)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Motor Vehicle Emissions by Year")) +
  xlab("Year") +
  ylab(expression("Motor Vehicle Emissions"))
g
with(NEI, scc, g)
dev.off()
