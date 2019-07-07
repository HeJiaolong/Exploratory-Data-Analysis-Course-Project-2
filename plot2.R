NEI <- readRDS("D:\\Documents\\exdata_data_NEI_data\\summarySCC_PM25.rds")
SCC <- readRDS("D:\\Documents\\exdata_data_NEI_data\\Source_Classification_Code.rds")

#Merge data
head(NEI)
head(SCC)
mydata <- merge(NEI,SCC,by = "SCC")
subdata <- subset(mydata, fips=="24510")
negtive <- subdata$Emissions < 1

png("plot2.png", width=480, height=480)
boxplot(log10(Emissions + 1) ~ year, data = subdata[negtive,], col ="green")
dev.off()

##Answer: total emissions from PM2.5 decreased in the Baltimore City
