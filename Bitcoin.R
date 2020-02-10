Mean and Naive Method
#install.packages
library(fpp2)
library(fpp)
#call data
crypto.markets<-crypto.markets[-(1867:785024),]
#rename dataset
tp <- crypto.markets
# Set training data from 2013 to 2018
a <- window(tp,start=2013,end=c(2018,6))
# Plot some forecasts
autoplot(a) +
  autolayer(meanf(a, h=11),
            series="Mean", PI=FALSE) +
  autolayer(naive(a, h=11),
            series="Naïve", PI=FALSE)  +
  ggtitle("Forecast for Bitcoin prices") +
  xlab("Year") + ylab("Price") +
  guides(colour=guide_legend(title="Forecast"))

2) Linear And Multiple Regression Technique
#Linear Regression
linear_regression = lm(bitcoin$market~bitcoin$open,data=bitcoin)
plot(jitter(bitcoin$market) ~ jitter(bitcoin$open),xlab="Opening Prices Of Bitcoin",
     ylab="Market Sales of Bitcoin",data=bitcoin)
abline(linear_regression)
linear_regression
res = residuals(linear_regression)
res
sum(res)
plot(res)
summary(linear_regression)

#Multiple Regression
multiple_regression = lm(bitcoin$market ~ bitcoin$open + bitcoin$close + bitcoin$low + bitcoin$high + bitcoin$close_ratio + bitcoin$spread)
plot(multiple_regression)
summary(multiple_regression)
res1 = residuals(multiple_regression)
plot(res1)
res1
sum(res1)

mean(bitcoin$market)
var(bitcoin$market)
sd(bitcoin$market)
str(bitcoin)




3) Arima Model 
library('ggplot2')
library('forecast')
library('tseries')
library(xts)
library(Metrics)

data <- read.csv("/Users/Laukik/Downloads/crypto-markets.csv", header = TRUE, sep=",", stringsAsFactors = FALSE)
data<-data[-(1867:785024),]

dates <- as.Date(data[,4], format = "%Y-%m-%d" )
data_xts <- as.xts(x = data$close, order.by = dates)
adf.test(data_xts, alternative = "stationary")
index <- c(1:1400,dates)
train <- data_xts[index,]
acf(train, lag.max=34) 
pacf(train, lag.max=34) 
test <- data_xts[-index,]
auto.arima(train)
fit <- Arima(test, order = c(2,1,2))
fit_values <- as.vector(fit$fitted)
fit_dates <- seq(as.Date("2017/02/26"), by = "day", length.out = 466)
fit_xts <- as.xts(x = fit_values, order.by = fit_dates)
fcast <- forecast(fit, h = 50)
df<-data.frame(fcast)
rmse(fit$x,fit$fitted)
plot(data_xts)
plot(diff(log(data_xts)))
plot(fit$x)
plot(fcast)
plot(fit$fitted)
plot(data$close)

4) SES Model 
Bitcoin <- crypto.markets[c(1:1866),]
fit11 <- ts(Bitcoin[,9],start = 2013,frequency = 365)
fit <- ses(fit11 , h = 100 , alpha = 0.2,initial = "simple")
fit
accuracy(fit)
fit11

plot(fit)
fit$mean
fitted(fit)


plot(fit, plot.conf=FALSE, main="Bitcoin-closing prices", ylab="Bitcoin-Closing prices", xlab="Years", fcol="white", type="o")
lines(fitted(fit), col="blue", type="o")
lines(fit$mean, col="blue", type="o")
