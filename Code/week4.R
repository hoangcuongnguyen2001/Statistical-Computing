test_data <-cbind(obsA = 16:8, obsB = c(20:19, 6:12))
head(test_data)
dim(test_data)
?apply

apply(test_data, 2, print)
apply(test_data, 2, range)
apply(test_data, 2, summary)

install.packages("mosaic")
library("mosaic")
library("mosaicData")
data("SaratogaHouses", package = "mosaicData")
View(SaratogaHouses)
str(SaratogaHouses)
names(SaratogaHouses)
rm(list = ls()) #clear memory
rm(Setosa)
attach(SaratogaHouses)

?SaratogaHouses
sum(complete.cases(SaratogaHouses))
Saratoga_complete <- SaratogaHouses[complete.cases(SaratogaHouses),]
missing <- nrow(SaratogaHouses)- nrow(Saratoga_complete)
missing

alloutliers <-which((price<landValue) |(lotSize == 0) |(bathrooms == 0)|(bedrooms==0)|(rooms==0))
alloutliers

houses <- Saratoga_complete[-alloutliers,]
fstr(houses)
rm(SaratogaHouses, Saratoga_complete)
attach(houses)

table(houses$fireplace)
hist(houses$price, col="navy", xlab="House price, in $", main="Histogram of house prices")
barplot(table(fireplaces))
summary(price)
library(pastecs)
stat.desc(price)

houses$fireplaces<-ifelse(houses$fireplace>0,1,0)

houses750<-houses[houses$price>=750000,]
houses750
library(psych)
describeBy(houses750$price, houses750$fireplace)
summary(houses)

describeBy(price, houses$fireplace)
?boxplot
options(scipen=0) #Add/remove scientific notation
options(scipen=9)
boxplot(price~fireplaces, ylim=c(20000,775000))
