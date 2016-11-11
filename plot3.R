# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.
subBaltiNEI <- NEI[NEI$fips=="24510",]

# Aggregate using sum the Baltimore emissions data by year
aggTotalsBaltimore <- aggregate(Emissions ~ year, subBaltiNEI, sum)

png("plot3.png")

library(ggplot2)

ggpGraph <- ggplot(subBaltiNEI, aes(factor(year),Emissions,fill=type)) +
        geom_bar(stat="identity") +
        theme_bw() + guides(fill=FALSE)+
        facet_grid(.~type,scales = "free",space="free") + 
        labs(x="year", y=expression("Total PM"[2.5]*" Emission in Tons")) + 
        labs(title=expression("PM"[2.5]*" Emissions in Baltimore City 1999-2008"))

print(ggpGraph)

dev.off()