?pnorm
?curve
curve(dnorm(x, mean=90, sd=10), from = 60, to= 120)

pnorm(100, mean=90, sd=10, lower.tail = F)
pnorm(80, mean=90, sd=10)
pnorm(95, mean=90, sd=10)-pnorm(80, mean=90, sd=10)

pnorm(18.5, mean=17, sd=1)-pnorm(16.5, mean=17, sd=1)

?qnorm
qnorm(0.025, mean=17, sd=1, lower.tail = F)

pnorm(21, mean=30, sd=4, lower.tail = F)
qnorm(0.08, mean=195, sd=25, lower.tail = F)
pnorm(35, mean=30, sd=4) - pnorm(30, mean=30, sd=4)

pnorm(5, mean=6.5, sd=2.3)
qnorm(0.35, mean=6.5, sd =2.3)

?dexp
pexp(6000, rate=1/10000, lower.tail = F)
pexp(1.5, rate=0.5)

pexp(4, rate = 0.5, lower.tail=F)/pexp(3, rate = 0.5, lower.tail=F)
pexp(0.25, rate=1/0.25, lower.tail = F)
pexp(1, rate=1/0.25, lower.tail = T)
pexp(.75, rate=1/0.25, lower.tail= F)/pexp(0.5, rate=1/0.25,lower.tail= F)

pexp(1/15, rate=1/15, lower.tail=F)

x<-rnorm(10000, mean=0, sd=1)
y<-rnorm(10000, mean=0, sd=1)
w<-x^2+y^2
hist(w)
mean(w)
var(w)
hist(x)

ppois(q=1, lambda=2, lower.tail = F)
pbinom(7, size=10, p=0.75, lower.tail=T)- pbinom(6, size=10, p=0.75, lower.tail=T)
dbinom(7, size=10, p=0.75)
pbinom(7, size=10, p=0.75, lower.tail=T) - pbinom(4, size=10, p=0.75, lower.tail = T)
pbinom(2, size=10, p=0.75, lower.tail=T)
