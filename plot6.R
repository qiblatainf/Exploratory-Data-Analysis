setwd('C:\\Users\\qib\\Desktop\\R Programming\\exdata_data_NEI_data')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(filename = 'C:\\Users\\qib\\Desktop\\R Programming\\exdata_data_NEI_data\\plot6.png', width = 480, height = 480, units='px')
cityMotor <- subset(NEI, NEI$fips %in% c("24510","06037") & NEI$type == "ON-ROAD")
CityMotorEmission <- aggregate(Emissions ~ year + fips, cityMotor, sum)
g <- ggplot(CityMotorEmission, aes(year, Emissions, col = fips)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Baltimore and Los Angeles Motor Vehicle Emissions by Year")) +
  labs(x = "Year", y = expression("Motor Vehicle Emissions") ) +
  scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore")) +
  theme(legend.title = element_text(face = "bold"))
g
with(NEI, g)
dev.off()
        