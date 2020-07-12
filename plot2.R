setwd('C:\\Users\\qib\\Desktop\\R Programming\\exdata_data_NEI_data')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(filename = 'C:\\Users\\qib\\Desktop\\R Programming\\exdata_data_NEI_data\\plot2.png', width = 480, height = 480, units='px')
city <- subset(NEI, NEI$fips == '24510')
a <- city$Emissions
b <- city$year
totalNEIBaltimore <- tapply(a, b, sum)
plot2 <- plot(names(totalNEIBaltimore), totalNEIBaltimore, type = "l", xlab = " Year ", ylab = " Total Emissions in Baltimore",
     main = 'TOTAL EMISSIONS IN BALTIMORE BY YEAR')
with(NEI, plot2)
dev.off()
