#investigating linear relationship between waiting time and eruption of the "Old Faithful" geyser modified from
#https://www.udemy.com/machine-learning-in-r/learn/v4/t/lecture/3583674?start=0 and
#https://www.udemy.com/machine-learning-in-r/learn/v4/t/lecture/9537688?start=0

#eruption: duration of geyser eruption in minutes
#waiting: length of time between eruptions in minutes
#explore first six lines in data set
head(faithful)

#for more info ?faithful
?faithful

#plot dataset (scatterplot)
plot(faithful$waiting, faithful$eruptions, main = "Linear Regression: Old Faithful Geyser", xlab = "Waiting (mins)", ylab = "Eruptions (mins)")

#there appears to be a positive linear relationship

#descriptive statistics for eruption_durations
eruption_durations <- faithful$eruptions
#find mean
mean(eruption_durations)
#find variance
var(eruption_durations)
#find standard deviation (square root of variance)
sd(eruption_durations)
#find range: min and max values
range(eruption_durations)

#plot dataset (histogram)
hist(eruption_durations, main = "Histogram: Old Faithful Geyser", xlab = "Eruptions [min]", ylab = "Frequency")

#descriptive statistics for waiting_times
waiting_times <- faithful$waiting
#find range: min and max values
range(waiting_times)
#find covariance between eruption_durations and waiting_times; there is a positive covariance
#covariance is a dimensional measure; it is not normalized; difficult to compare datasets with large differences in spread
cov(eruption_durations, waiting_times)
#find correlation instead of covariance: large correlation means strong positive relationship b/n variables
cor(eruption_durations, waiting_times)

#strong positive linear relationship supports use of linear model; let's train the model
model <- lm(eruption_durations ~ waiting_times)
#plot linear line
abline(model, col="red")
#look at descriptive stats
summary(model)
#in looking at the coefficients: (y-Intercept = -1.87) and (waiting_times slope = 0.076)
#low SE is good...high t value is good
#waiting_times p < 0.05 is good; there is a 95% probability that waiting_times (IV) has some effect on eruption_duracation (DV)
#however, a low p-value says nothing about the effect size that the IV has on the DV
#we have a good linear regression model!
#the R-squared value explains 81% of the data...the strength of the positive linear relationship; the closer the value is to 1, the better the model

#let's make predictions using the model
predict(model, data.frame(waiting_times=100))
#the model seems to be working fine!
