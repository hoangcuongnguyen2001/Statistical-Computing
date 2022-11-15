#Q1:
#a)
T <- matrix(
  c(0.92, 0.03, 1-0.92-0.03, 0.08, 0.88, 1-0.08-0.88, 0.02, 1-0.02-0.94, 0.94), ncol=3) #Create matrix
colnames(T)<-c("P", "Q", "R")
row.names(T)<-c("P", "Q", "R") #Setup for columns and rows.
T

#b)
S0 <- matrix (c(7,11,8), ncol = 1) #Setup of the initial number of cars
row.names(S0) <- c("P", "Q", "R")
S0

#c)
S1<-T%*%S0 # The cars' position after the first day
round(S1, digits = 2)

#d)
temp<-S0 
for(i in 1:5){
  temp<-T%*%temp
}
round(temp, digits = 0) #The cars' position after 5 days.

#e)
temp1<-S0 # Finding steady state
for(i in 1:1000){
  temp1<-T%*%temp1
}
for(i in 1:1001){
  temp1<-T%*%temp1
}
temp1
round(temp1, 0)

#Q2
#a)
prob1 <- dbinom(5, size=15, p=0.3, log=F) # Probability of stop in the first 5 lights
prob2 <- dbinom(10, size=15, p=0.7, log=F) # Probability of go in the remaining 10 lights
prob1*prob2
#b)
stop<- pbinom(1, size=15, p=0.3, lower.tail=F) #Probability of stopping on one or more lights
stop
#c)
a <- pbinom(10, size=15, p=0.3, lower.tail = T) # Probability of stopping on at most 10 lights
b <- pbinom(5, size=15, p=0.3, lower.tail = F) # Probability of stopping on at least 5 lights
prob <- b*a/a # Conditional probability.
prob
#d)
prob1 <- dbinom(3, size=5, p=0.3, log=F) # Probability of stopping on 3 in the first 5 lights
prob2 <- dbinom(5, size=10, p=0.3, log=F)# Probability of stopping on 5 in the first 10 lights
prob1 * prob2



#Q3
#a)
datasetQ3 <- read.csv("C:\\Data Science Projects\\R files Statistical Computing\\no_vehicles.csv")# Import the data
dataframeQ3 <- data.frame(datasetQ3)
table(dataframeQ3)
#b)
meanValue <- mean(dataframeQ3$no_of.vec)# Finding mean
meanValue
#c)
for(i in 0:7){ # Finding probability in Poisson distribution
  print(as.character(i))
  print(dpois(i, lambda=meanValue))
}
#d)
for(i in 0:7){ # FInding the expected values.
  print(as.character(i))
   print(length(dataframeQ3$no_of.vec) * dpois(i, lambda = meanValue))
}
#Q4
#a)
pnorm(4100, mean=3100, sd=600) - pnorm(2800, mean=3100, sd=600) # Probability of baby between 2800 and 4100 g.
#b)
the75th <- qnorm(0.75, mean=3100, sd=600) # 75th percentile
the25th <- qnorm(0.25, mean=3100, sd=600) # 25th percentile
the25th;the75th
#c)
baby_weight_prob <- pnorm(3100, mean = 3100, sd = 600, lower.tail=FALSE) - pnorm(4200, mean = 3100, sd = 600, lower.tail=FALSE)
# Finding probability of picking babies between 3100 and 4200 g.
round(pbinom(2, size= 10, p= baby_weight_prob), 4) # Finding probability of picking 2 out of 10 babies with the probability calculated.
#Q5
correlation<-function(x,y) # correlation function
{
  mean_x<-mean(x)
  mean_y<-mean(y)
  n1<-length(x) - 1
  n2<-length(y) - 1
  SX_Y <- sum((x-mean_x)*(y-mean_y))/(n1)
  SX <- sqrt(sum((x-mean_x)^2)/n1)
  SY <- sqrt(sum((y-mean_y)^2)/n2)
  temp <- SX_Y/(SX * SY)
  return(temp)
}

#testing correlation
set.seed(100)
x<-rnorm(10, mean=10, sd=5)
y<-rnorm(10, mean=15, sd=5)
correlation(x,y)
cor(x,y)


#Q6
#a)
datasetQ6 <- read.csv("C:\\Data Science Projects\\R files Statistical Computing\\Assignment2_Q6.csv")# Entering data
dataframeQ6 <- data.frame(datasetQ6)
#Setup columns for males and females.
dataframeQ6_Male <- dataframeQ6[(dataframeQ6$X == "Male"),] 
dataframeQ6_Female <- dataframeQ6[(dataframeQ6$X == "Female"),]
#Testing the quality of life to check the normality of distributions.
shapiro.test(dataframeQ6_Male$Q22)
shapiro.test(dataframeQ6_Female$Q22)
# Wilcoxon test for checking.
t.test(x = dataframeQ6_Female$Q22, y = dataframeQ6_Male$Q22, alternative = "greater")
#b)
# Testing the odd behaviours to check the normality of distributions,
shapiro.test(dataframeQ6_Male$Q10)
shapiro.test(dataframeQ6_Female$Q10)
# Wilcoxon test for checking.
wilcox.test(x = dataframeQ6_Female$Q10, y = dataframeQ6_Male$Q10, alternative = "greater")
rm(list=ls())
