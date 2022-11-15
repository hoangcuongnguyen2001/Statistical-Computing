p <- c(2,3,5,7,11,13,17,19)
p
length(p)
mean(p)
sd(p)
var(p)
gas <- c(65311, 65624, 65908, 66219, 66499, 
         66821, 67145, 67447)
mean(gas)
mean(diff(gas))
diff(gas)
text <- scan()
65311 65624 65908 66219 66499 66821 67145 67447
?scan.url
x <- c(2,5,4,16,9)
x^2
x + 10
(x + 3)^3
aa <- paste(1, 1:10, sep="/")
class(aa)
b <- c(2,3,4,5,6)
mean(b)
var(b)
sd(b)
a2 <- seq(from=1, to=100, by=2)
a2
c <- seq(from=1, to=6, by=1)
c^3
e <- seq(from=1964, to=2014)
e
g <- c(14, 18, 23, 28, 34, 42, 50, 59, 66, 72, 79, 86, 96, 103, 110)
g
g <- seq(from=0, to=1000, by=25)
g
pattern1 <- rep('a', times=5)
pattern2 <- rep(1:3, each=3)
pattern3 <- rep((1:3), c(3,2,1))
pattern3
b <- c(1:10)
1/b
dry <- c(77, 93, 92, 68, 88, 75, 100)
sum(dry)
mean(dry)
median(dry)
sd(dry)
length(dry)
summary(dry)
five_d <- (1:8)^4
five_d
paste("Trial", 1:10, sep="_")
new_vector <- scan()
17 16 20 24 22 15 21 15 17 22  
max(new_vector)
mean(new_vector)
min(new_vector)
new_vector[4] <- 23
new_vector
sum(new_vector <= 20)/length(new_vector)*100
which(new_vector < 18)
sum(new_vector[which(new_vector < 18)])
q8 <- c(36, 37, 45, 47, 49, 25)
names(q8) <- c("A", "B", "C", "D", "E", "F")
q8
sort(dry, decreasing = T)
sort(dry)
exec.pay
library("UsingR")
exec.pay
Orange1 <- data.frame(Orange)
str(Orange1)
mean(Orange1$age)
max(Orange1$circumference)
boxplot(g)

##slide 23
matrix(1:9, nrow=3, byrow=TRUE)
m<-matrix(1:9, nrow = 3, dimnames = list(c("first","second","third"), c("A","B","C")))
m
##slide 24                                                                               
colnames(m) 
rownames(m)

##slide 25
colnames(m) <- c("C1","C2","C3")
rownames(m) <- c("R1","R2","R3")
m
str(m)
threeABC <- c(rep("A", 3), rep("B",3), rep("C",3))
threeABC
pnorm(205, mean=185, sd=20, lower.tail = T)- pnorm(165, mean=185, sd=20, lower.tail=T)
dbinom(2, size=3, pnorm(205, mean=185, sd=20, lower.tail = F))
