NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#1.Have total emissions from PM2.5 decreased in the United States
#from 1999 to 2008? Using the base plotting system,
#make a plot showing the total PM2.5 emission from 
#all sources for each of the years 1999, 2002, 2005, and 2008
xnames<-names(tapply(NEI$Emissions,NEI$year,sum))
plot(tapply(NEI$Emissions,NEI$year,sum),xaxt="n",xlab="years",ylab="Emissions")
axis(1, at=1:length(xnames), labels=xnames)

#2.Have total emissions from PM2.5 decreased in the
#Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
#Use the base plotting system to make a plot answering this question.
data2<- subset(NEI,fips=="24510")
plot(tapply(data2$Emissions,data2$year,sum),xaxt="n",xlab="years",ylab="Emissions Baltimore City, Maryland ")
axis(1, at=1:length(xnames), labels=xnames)

#3.Of the four types of sources indicated by the type
#(point, nonpoint, onroad, nonroad) variable,
#which of these four sources have seen decreases 
#in emissions from 1999-2008 for Baltimore City? 
#Which have seen increases in emissions from 1999-2008?
# Use the ggplot2 plotting system to make a plot answer this question.
tapply(data2$Emissions,list(data2$type,data2$year),sum)
qplot(data2$year,data2$Emissions,data=data2,facets=.~type)

#4 Across the United States, how have emissions from coal combustion-related
#sources changed from 1999-2008?
SCC$EI.Sector <- as.character(SCC$EI.Sector)
SCC$SCC <-as.character(SCC$SCC)

Codes <- SCC$SCC[grep("coal", SCC$EI.Sector, ignore.case=TRUE)]
i <- !is.na(match(NEI$SCC, Codes))
NEI2 <- NEI[i, ]
plot(tapply(NEI2$Emissions,NEI2$year,sum),xaxt="n",xlab="years",ylab="Emissions from coal combustion-related")
axis(1, at=1:length(xnames), labels=xnames)

#5.How have emissions from motor vehicle sources
#changed from 1999-2008 in Baltimore City? 

data3<- subset(NEI,fips=="24510" & type=="ON-ROAD")
plot(tapply(data3$Emissions,data3$year,sum),xaxt="n",xlab="years",ylab="Emissions from motor vehicle sources in Baltimore")
axis(1, at=1:length(xnames), labels=xnames)

#6.Compare emissions from motor vehicle sources in Baltimore City
#with emissions from motor vehicle sources in Los Angeles County,
#California (fips == "06037"). Which city has seen greater changes
#over time in motor vehicle emissions?




