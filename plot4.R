NEI <- readRDS("D:\\Documents\\exdata_data_NEI_data\\summarySCC_PM25.rds")
SCC <- readRDS("D:\\Documents\\exdata_data_NEI_data\\Source_Classification_Code.rds")

head(NEI)
head(SCC)

coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
coal.sources <- SCC[coal,]

coal.combustion <- NEI[(NEI$SCC %in% coal.sources$SCC), ]
library(dplyr)
coal.related <- summarise(group_by(coal.combustion, year), Emissions=sum(Emissions))
library(ggplot2)

png("plot4.png", width=480, height=480)
a <- ggplot(coal.related, aes(x=factor(year), y=(Emissions),fill=year))
a + geom_bar(stat="identity") 
dev.off()

##Answer: decreased
