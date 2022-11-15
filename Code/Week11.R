old <- scan()
42.1 41.3 42.4 43.2 41.8
41.0 41.8 42.8 42.3 42.7


new<- scan()
42.7 43.8 42.5 43.1 44.0
43.6 43.3 43.5 41.7 44.1


t.test(x=old, y=new, alternative = "greater")
sd(old)
sd(new)
data_old <- data.frame(old, 1)
data_new <- data.frame(new, 2)
names(data_new) <- c("old", "X1")
com_data <-rbind(data_old, data_new)
com_data
aut <- scan()
16.8 11.7 15.6 16.7 17.5 18.1 14.1 21.8 13.9 20.8
chain <- scan()
22 15.2 18.7 15.6 20.8 19.5 17 19.5 16.5 24
t.test(x=aut, y=chain, alternative = "two.sided",paired=T )

standard <- scan()
7500 8000 2000 550 1250
1000 2250 6800 6300 9100
new <- scan()
400 250 800 1400 8000
920 1420 2700 4100
shapiro.test(standard)
shapiro.test(new)
wilcox.test(standard,new, alternative = "two.sided")
t.test(x=standard, y=new, alternative="two.sided")
before <- scan()
20 15 17 18 24 17 19

after <- scan()
25 24 18 17 27 17 21
shapiro.test(before)
shapiro.test(after)
t.test(x=before, y=after, alternative="less", paired=T)
