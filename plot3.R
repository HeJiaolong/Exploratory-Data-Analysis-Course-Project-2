NEI <- readRDS("D:\\Documents\\exdata_data_NEI_data\\summarySCC_PM25.rds")

#Merge data
subNEI <- subset(NEI,fips=="24510")
negtive <- subdata$Emissions < 1
head(subNEI)
library("ggplot2")

png("plot3.png", width=480, height=480)
plot3 <- ggplot(data=subNEI,aes(y=log10(Emissions + 1),group=year))
plot3 + geom_boxplot(aes(color = year))
plot3 + geom_boxplot() + facet_grid(.~type)
plot3 + geom_boxplot() + facet_grid(.~type) + scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))
dev.off()

#Answer: Non-Road, On-Road, Point decreased, Non-Point fluctuate