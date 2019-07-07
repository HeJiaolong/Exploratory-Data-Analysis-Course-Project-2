NEI <- readRDS("D:\\Documents\\exdata_data_NEI_data\\summarySCC_PM25.rds")
SCC <- readRDS("D:\\Documents\\exdata_data_NEI_data\\Source_Classification_Code.rds")

mydata <- merge(NEI,SCC,by = "SCC")
subdata <- subset(mydata, fips == "24510")

subdata.byyear <- summarise(group_by(subdata, year), Emissions=sum(Emissions))
library(ggplot2)

png("plot5.png", width=480, height=480)
plot5 <- ggplot(subdata.byyear, aes(x=factor(year), y=Emissions,fill=year)) 
plot5 + geom_bar(stat="identity") 
dev.off()

##Answer: Fluctuating downward

