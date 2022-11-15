install.packages("nycflights13")
data(package="nycflights13")
rm(list=ls())
data(flights,package="nycflights13")
attach(flights)
head(flights)
str(flights)
?is.na
sum(is.na(flights$year))
sum(is.na(flights$month))
sum(is.na(flights$day))
sum(is.na(flights$dep_time))
sum(is.na(flights$sched_dep_time))
sum(is.na(flights$dep_delay))
sum(is.na(flights$arr_time))
sum(is.na(flights$sched_dep_time))
sum(is.na(flights$arr_delay))

?apply
apply(is.na(flights), 1, sum)

head(flights[is.na(flights$dep_time),])
?which
which(is.na(flights$dep_time))
flight1 <- flights[-which(is.na(flights$dep_time)),]
dim(flight1)

data1<-flights[!is.na(flights$dep_time),]
dim(data1)

hist(flight1$dep_delay)
flight1$delay_type[flight1$dep_delay < 60]<- "short"
flight1$delay_type[flight1$dep_delay >= 60 & flight1$dep_delay < 120]<- "medium"
flight1$delay_type[flight1$dep_delay >= 120 & flight1$dep_delay < 240]<- "long"
flight1$delay_type[flight1$dep_delay >= 240]<- "significant"

table(flight1$delay_type)

dim(flight1)[1]
percentages<-100*table(flight1$delay_type)/dim(flight1)[1]
percentages
hist(flight1$dep_delay/60, main="Histogram for Dept_Delay in hours")

flight2<-flight1[flight1$delay_type!="short",]

table(flight2$delay_type)

carriers_delay<- 100* table(flight2$carrier)/nrow(flight2)
barplot(carriers_delay)
carrier_poor_perf <- carriers_delay[carriers_delay >5]
barplot(carrier_poor_perf, col="steelblue",  ylab="Percentage of delayed flights", xlab="Carrier")
barplot(carriers_delay,col="steelblue", ylim=c(0,30), ylab="Percentage of delayed flights", xlab="Carrier")
barplot(100* table(flight2$month)/nrow(flight2),col="steelblue" , ylab="Percentage of delayed flights", xlab="Month")
barplot(100* table(flight2$hour)/nrow(flight2),col="steelblue" , ylab="Percentage of delayed flights", xlab="hour")

getwd()
setwd("C:/Data Science Projects/R files Statistical Computing")

library(haven)
tea_3 <- read_sav("C:/Data Science Projects/R files Statistical Computing/Tea_Makes_You_Brainy.sav")
head(tea_3)
dim(tea_3)


data2 <- read.csv(file.choose(), header = T)
head(data2)
write.csv(data2, file="iris2.csv")
getwd()

iris_1 <- read_excel("C:/Users/PrahaSarmi/Downloads/iris.xls")
head(iris_1)

iris_3 <- read_sav("C:/Users/PrahaSarmi/Downloads/Iris.sav")
head(iris_3)
