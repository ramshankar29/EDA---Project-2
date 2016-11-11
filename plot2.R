# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.

subBaltiNEI <- NEI[NEI$fips=="24510",]

# Aggregate the Baltimore emissions data by year using sum

aggTotalsBaltimore <- aggregate(Emissions ~ year, subBaltiNEI, sum)

png("plot2.png")

barplot(
        aggTotalsBaltimore$Emissions,
        names.arg=aggTotalsBaltimore$year,
        xlab="Year",
        ylab="PM2.5 Emissions in Tons",
        main="Total PM2.5 Emissions From all Baltimore City Sources"
)

dev.off()