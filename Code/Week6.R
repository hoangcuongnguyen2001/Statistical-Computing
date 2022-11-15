#Q1
rm(list=ls())
?matrix
A<-matrix(c(1,-1,5,3), ncol=2)
A
B<-matrix(c(2,1,-5,-3), ncol=2)
B
C1<-matrix(c(5,5,3,4), ncol=2)
C1

A
B
A-B
A[1,2]
A[2,1]
A[2,2]
A+B
A+B+C1
A-B+C1
A
2*A
2*A-3*B
5*A-3*C
A
B
1*2+5*1
1*-5+5*-3
-1*2+3*1
-1*-5+3*-3
A*B
A
B
A%*%B
B%*%A
A%*%A
A%*%A%*%A
#using the mtrix calc package
install.packages("matrixcalc")
library(matrixcalc)
matrix.power(A, 3)

A%*%B%*%C
# solve function is used to find the inverse of a matrix
solve(A)
#Q2

A<-matrix(c(1,-1,5,3), ncol=2)
B<-matrix(c(2,1), ncol=1)

#X=A^(-1)B
solve(A)%*%B

#Q3
A<-matrix(c(2,-1,4,2,5,7), ncol=3)
A
t(A) #transpose
A%*%t(A)
t(A)%*%A
solve(A%*%t(A))

#Q4
x<-c(2,5,6,3,4,5,2,6,3)
y<-c(60,180,210,120,150,160,65,200,90)
plot(x,y)
cor(x,y)
design<-matrix(c(1,1,1,1,1,1,1,1,1,x), ncol=2)
t_design<-t(design)
t_design
m<-t_design%*%design
m
m_inv<-solve(m)
m_inv
m_inv%*%t_design%*%y
reg<-lm(y~x)
reg
?lm
#Exercise Transition matrix


#Q5
trans_BF<-matrix(c(0.8, 0.2,0.3,0.7), ncol=2)
trans_BF
colnames(trans_BF)<-c("B", "F")
row.names(trans_BF)<-c("B", "F")
trans_BF

#Q6
trans_k<-matrix(c(0.75, 0.25,0.20,0.8), ncol=2)
trans_k
colnames(trans_k)<-c("X", "Not X")
row.names(trans_k)<-c("X", "Not X")
trans_k

#initial matrix
s0<-matrix(c(700,300), ncol=1)
row.names(s0)<-c("X", "Not X")
s0
#after one transition (2015)
s1<-trans_k%*%s0
s1
#after two transition (2016)
s2<-trans_k%*%s1
s2
#OR 
trans_k%*%trans_k%*%s0
#after three transition (2017)
s3<-trans_k%*%s2
s3
#OR 
trans_k%*%trans_k%*%trans_k%*%s0
matrix.power(trans_k, 3)%*%s0
#long term
#using R

temp<-trans_k
for(i in 1:29){
  temp<-trans_k%*%temp
}
temp

temp<-trans_k
for(i in 1:30){
  temp<-trans_k%*%temp
}
temp
temp%*%s0
#see whether the same answer for consecutive transition if so #the steady state reached
#then we can calculate how many people buy from each shop in #the long run

#without R

trans_k
#Using Notes matrix (refer to page 10)

#long term probability for X =  b/(a+b)=0.2/0.45, and other store =0.25/0.45

#Number of people buy hats, at long term, from Kmart will be  
0.2/0.45*1000=444.444
#=444 people 

#Number of people buy hats, at long term, from Kmart will be  
0.25/0.45*1000
#=555.556.=556 people


#Q7

trans_m<-matrix(c(0.70, 0.10, 0, 0.20, 0.60, 0.35, 0.10, 0.30, 0.65), ncol=3, byrow = T)
trans_m
colnames(trans_m) <- c("0", "1", "2")
row.names(trans_m) <- c("0", "1", "2")
trans_m
trans_m%*%trans_m

#Using R check for 100 transition and 101 and see whether the steady state reached

temp<-trans_m
for(i in 1:99){
  temp<-trans_m%*%temp
}
round(temp, 3)

temp<-trans_m
for(i in 1:1000){
  temp<-trans_m%*%temp
}
round(temp, 3)


#Suppose the machine work properly at a given day then

s0<-matrix(c(1,0,0), ncol=1)
temp%*%s0

#so 15% of the time machine work without a problem


