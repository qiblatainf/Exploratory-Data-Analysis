setwd('C:\\Users\\qib\\Desktop\\R Programming\\exdata_data_NEI_data')
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(filename = 'C:\\Users\\qib\\Desktop\\R Programming\\exdata_data_NEI_data\\plot1.png', width = 480, height = 480, units='px')
a <- NEI$Emissions
b <- NEI$year
totalNEI <- tapply(a, b, sum)
totalNEI
plot1 <- plot(names(totalNEI), totalNEI, type = "l", xlab = " Year ", ylab = " Total Emissions ", main = "TOTAL PM2.5 EMISSIONS BY YEAR")
with(NEI, plot1)
dev.off()
