#Load data
NEI <- readRDS("D:\\Documents\\exdata_data_NEI_data\\summarySCC_PM25.rds")
SCC <- readRDS("D:\\Documents\\exdata_data_NEI_data\\Source_Classification_Code.rds")

#Merge data
head(NEI)
head(SCC)

mydata <- NEI
head(mydata)
##there are so many outliers! 
summary(mydata$Emissions)
summary(subset(mydata,year == 1999)$Emissions)
summary(subset(mydata,year == 2002)$Emissions)
summary(subset(mydata,year == 2005)$Emissions)
summary(subset(mydata,year == 2008)$Emissions)
##it seems that the pollution was decreasing from 1999 to 2008
## but there are so many outliers, it is hard to recognize difference if we plot with outliers
## and we shold use log10
negtive <- mydata$Emissions < 1
png("plot1.png", width=480, height=480)
boxplot(log10(Emissions + 1) ~ year, data = mydata[negtive,], col ="green")
dev.off()

##Answer: total emissions from PM2.5 decreased in the United States from 1999 to 2008