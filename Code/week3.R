?matrix
a<-1:12
a
matrix_a <- matrix(a, ncol=4)
matrix_a
matrix_a[2,4]
matrix_b <- matrix(a, ncol=4, byrow = T)
matrix_b
matrix_c <- rbind(matrix_b, c(6,9,12,15))
matrix_c
colnames(matrix_c) <- c("C1", "C2", "C3", "C4")
matrix_c
rownames(matrix_c) <- c("R1", "R2", "R3", "R4")
matrix_c
dim(matrix_c)
str(matrix_c)
e <- c(12,14,15,14)
matrix_e<-cbind(matrix_c, e)
colnames(matrix_e)[colnames(matrix_e) == "e"] <- "C5"
matrix_e

library(MASS)
datasets(package="MASS")
?Pima.te
View(Pima.te)
head(Pima.te)
dim(Pima.te)
attach(Pima.te)
str(Pima.te)
Pima.te$npreg[3] <- NA
sum(complete.cases(Pima.te))
summary(Pima.te)
table(npreg)
sum(Pima.te$npreg > 6, na.rm = T)
dim(Pima.te)[1]

sum(Pima.te$npreg > 6, na.rm = T)/ dim(Pima.te)[1]

Diabetic_No <- Pima.te[Pima.te$type == "No",]
head(Diabetic_No)

detach(Pima.te)
dat1 <- Pima.te[(Pima.te$bmi>26)& (Pima.te$age<30),]
dim(dat1)
dat2<-Pima.te[Pima.te$bmi>26& Pima.te$age<30,]
dim(dat2)
dat3<-Pima.te[Pima.te$npreg <=5 & Pima.te$age<30,]
dim(dat3)

install.packages("psych")
describe(Pima.te$age)
library(psych)


?hist
hist(Pima.te$age)
boxplot(Pima.te$age)
boxplot(Pima.te$age ~ Pima.te$type)
barplot(table(Pima.te$type))

table(Pima.te$type)


Pima.te$bmi_cat[Pima.te$bmi>18.5 & Pima.te$bmi< 25]<-"Normal"
Pima.te$bmi_cat[Pima.te$bmi>=25 & Pima.te$bmi< 30]<-"Owerweight"
Pima.te$bmi_cat[Pima.te$bmi>=30 & Pima.te$bmi< 35]<-"Obese"
Pima.te$bmi_cat[Pima.te$bmi >=35 & Pima.te$bmi< 40]<-"Severe Obese"
Pima.te$bmi_cat[Pima.te$bmi>40]<-"Morbid Obese"

head(Pima.te)
table(Pima.te$bmi_cat)
barplot(table(Pima.te$bmi_cat))
?order
barplot(sort(table(Pima.te$bmi_cat)))

install.packages("readx1")
iris <- read.csv("C:/Users/hoang/Downloads/iris.csv")
View(iris)
save(iris, file = "data.RData")
getwd()
library(haven)
iris_1 <- read_sav("C:/Users/hoang/Downloads/iris.sav")
View(iris_1)
load("data.RData")
dataset_1 <- iris_1[iris_1$species == "Setosa", ]
View(dataset_1)
save(dataset_1, file = "data1.RData")
load("data1.RData")
write.csv(iris_1, file = "mycsv.csv")
