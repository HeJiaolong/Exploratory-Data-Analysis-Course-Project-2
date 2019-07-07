NEI <- readRDS("D:\\Documents\\exdata_data_NEI_data\\summarySCC_PM25.rds")
SCC <- readRDS("D:\\Documents\\exdata_data_NEI_data\\Source_Classification_Code.rds")

mydata <- merge(NEI,SCC,by = "SCC")

balti<-summarise(group_by(filter(mydata, fips == "24510"), year), Emissions=sum(Emissions),County = "Baltimore")
los<-summarise(group_by(filter(mydata, fips == "06037"), year), Emissions=sum(Emissions),County = "LOS")
use <- rbind(balti,los)

library(ggplot2)
png("plot6.png", width=480, height=480)
plot6 <- ggplot(use, aes(x=factor(year), y=Emissions,fill=year)) 
plot6 + geom_bar(stat="identity") 
plot6 + geom_bar(stat="identity") + facet_grid(County~.,)
dev.off()

#Answer: LOS