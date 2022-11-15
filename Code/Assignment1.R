# Question 1
data("ChickWeight", package = "datasets") #Loading the dataset
View(ChickWeight)
str(ChickWeight) # Finding dataset's structure
 #Finding missing values
table(ChickWeight$Chick)
attach(ChickWeight)
ChickWeight[(ChickWeight$Chick == 18) |
                      (ChickWeight$Chick == 16) |
                      (ChickWeight$Chick == 15)|
                      (ChickWeight$Chick == 8)|
                      (ChickWeight$Chick == 44)]
detach(ChickWeight)

# Summary of dataset
summary(ChickWeight)
# Create plots
boxplot(ChickWeight$weight)
barplot(table(ChickWeight$Time),  main="The number of chicks recorded through time period", 
        xlab= "Time(days)", ylab= "Number of chicks")
barplot(table(ChickWeight$Chick), main = "The number of days recorded for each chicks", 
        xlab= "Chick's ID", ylab= "Number of days")
barplot(table(ChickWeight$Diet), main = "The number of records for each diet",
        xlab= "Diet", ylab= "Number of records")

#Depicting relationship between time and chick's weight, according to diet.
plot(ChickWeight$Time[ChickWeight$Diet==1], ChickWeight$weight[ChickWeight$Diet==1], 
     main="Relationship between time and chick's weight (Diet 1)",
     xlab="Time(days) ", ylab="Chicks' weight(gm) ", pch=19)
plot(ChickWeight$Time[ChickWeight$Diet==2], ChickWeight$weight[ChickWeight$Diet==2], 
     main="Relationship between time and chick's weight (Diet 2)",
     xlab="Time(days) ", ylab="Chicks' weight(gm) ", pch=19)
plot(ChickWeight$Time[ChickWeight$Diet==3], ChickWeight$weight[ChickWeight$Diet==3], 
     main="Relationship between time and chick's weight (Diet 3)",
     xlab="Time(days) ", ylab="Chicks' weight(gm) ", pch=19)
plot(ChickWeight$Time[ChickWeight$Diet==4], ChickWeight$weight[ChickWeight$Diet==4], 
     main="Relationship between time and chick's weight (Diet 4)",
     xlab="Time(days) ", ylab="Chicks' weight(gm) ", pch=19)

# Question 2.
datasetQ2 <- read.csv("C:\\Data Science Projects\\Cleaning.csv")  # Loading the dataset.     
datasetQ2_1 <- data.frame(datasetQ2) 
str(datasetQ2_1) # Finding structure,
# Making character data integer.
datasetQ2_1$Q4 <- as.integer(as.character(datasetQ2_1$Q4))
datasetQ2_1$Q5 <- as.integer(as.character(datasetQ2_1$Q5))
summary(datasetQ2_1)
apply(is.na(datasetQ2_1), 2, which)

# Recode outliers as NA
outlier_1 <- datasetQ2_1$Q5 > 40
datasetQ2_1$Q5[outlier_1] <- NA
outlier_2 <- datasetQ2_1$Q7 > 40
datasetQ2_1$Q7[outlier_2] <- NA
outlier_3 <- datasetQ2_1$Q11 > 40
datasetQ2_1$Q11[outlier_3] <- NA
summary(datasetQ2_1)

# Replace values
datasetQ2_1$Q2[is.na(datasetQ2_1$Q2)] <- median(datasetQ2_1$Q2, na.rm = T)
datasetQ2_1$Q4[is.na(datasetQ2_1$Q4)] <- median(datasetQ2_1$Q4, na.rm = T)
datasetQ2_1$Q5[is.na(datasetQ2_1$Q5)] <- median(datasetQ2_1$Q5, na.rm = T)
datasetQ2_1$Q7[is.na(datasetQ2_1$Q7)] <- median(datasetQ2_1$Q7, na.rm = T)
datasetQ2_1$Q10[is.na(datasetQ2_1$Q10)] <- median(datasetQ2_1$Q10, na.rm = T)
datasetQ2_1$Q11[is.na(datasetQ2_1$Q11)] <- median(datasetQ2_1$Q11, na.rm = T)
datasetQ2_1$Q12[is.na(datasetQ2_1$Q12)] <- median(datasetQ2_1$Q12, na.rm = T)

#Checking result
summary(datasetQ2_1)


#Question 3:
#Import the dataset
datasetQ3 <- read.csv("C:\\Data Science Projects\\Fuel_Cons_2022.csv")
dataframeQ3 <- data.frame(datasetQ3)
str(dataframeQ3)

# Frequency table of Fuel_type
table(dataframeQ3$Fuel_type)

# Barplot for Fuel type
barplot(table(dataframeQ3$Fuel_type), xlab= "Fuel type", ylab = "Number of cars",
        main= "Number of cars by fuel type")

#Mean and standard deviation of city fuel by cylinders.
tapply(dataframeQ3$City_Fuel,                
    dataframeQ3$Cylinders,mean)  #Find mean

tapply(dataframeQ3$City_Fuel,                
       dataframeQ3$Cylinders,sd)    #Find standard deviation

# Finding records.
data1 <- dataframeQ3[(dataframeQ3$Smog_Rating == 7)& (dataframeQ3$Transmission == "A6") 
                     & (dataframeQ3$Fuel_type == "X"),]
data1

#Parallel boxplot.
boxplot(dataframeQ3$Emission_co2 ~ dataframeQ3$Fuel_type, xlab="Fuel type", ylab="CO2 emissions (g/km)")


#Histogram creation.
hist(dataframeQ3$Comb_Fuel[dataframeQ3$Transmission == "A8"], xlim = c(6,18), 
     main = "Histogram of combined fuel consumption", 
     xlab = "Combined fuel consumption (L/km)")

#Create new variables.
dataframeQ3$Compare <- dataframeQ3$Emission_co2/dataframeQ3$Cylinders * 100
# Finding the best model to reduce emission.
model_order <- dataframeQ3[order(dataframeQ3$Compare),]
head(model_order, 5)

#Finding the best brand in reducing CO2 emission.
data1 <- aggregate(dataframeQ3$Compare, list(dataframeQ3$Make), FUN=mean) 
data1 <- data.frame(data1)
make_order <- data1[order(data1$x),]
head(make_order)
