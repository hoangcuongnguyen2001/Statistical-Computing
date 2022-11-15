Time <- c(6.3, 6.6, 6.7, 5.9, 6.3, 6, 6.5, 6.1, 6.2, 6.4)
xbar <- mean(Time)
stddev <- sd(Time)
n<- length(Time)
tval <- qt(0.975, df = n-1)

t.test(Time)
ll95 <- xbar + -tval*stddev/sqrt(n)
ul95 <- xbar + tval*stddev/sqrt(n)
ll95

hist(Time)
qqnorm(Time)
qqline(Time)
shapiro.test(Time)

Services <- scan()
6.3 6.6 6.7 5.9 6.3 6 6.5 6.1 6.2 6.4
xbarl <- mean(Services)
sigma <- 0.25
zval <- qnorm(0.95, mean=0, sd=1)
n1 <- length(Services)
ll90 <- xbarl + -zval*sigma/sqrt(n1)
ul90 <- xbarl + zval*sigma/sqrt(n1)
ll90

Compensation <- scan()
825 850 1210 1370 1415
1560 1625 2155 1500 2220
mean(Compensation)

phat <- 21/44
zval <- qnorm(0.975, mean=0, sd=1)
ll95 <- phat + -zval*sqrt(phat*(1-phat)/44)
ul95 <- phat + zval*sqrt(phat*(1-phat)/44)
ll95;ul95
?prop.test
prop.test(x=21, n=44, conf.level = 0.99)
prop.test(x=800, n=1150, conf.level = 0.99)
prop.test(x=479, n=800, conf.level = 0.95)
