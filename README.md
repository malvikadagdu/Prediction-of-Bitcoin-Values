# Prediction-of-Bitcoin-Values

INTRODUCTION & BACKGROUND
Cryptocurrency is a digital currency designed to work as a medium of exchange. It uses cryptography to secure and verify transactions as well as to control how and when new units of cryptocurrency are created. Attempts to create digital currency were made during the 90s tech boom (Flooz, Beenz, DigiCash) but all ultimately failed. Reasons for the many failures ranged from fraud, financial issues, or even mere disagreements between company employees and higher ups. 
In 2009, an anonymous programmer or group of programmers, under the name Satoshi Nakamoto, introduced Bitcoin. It was a decentralized electronic cash system, meaning, it had no central controlling authority. The decentralized system meant every participant was responsible themselves for keeping record of balances and transactions. Ultimately, it was Blockchain technology which helped with all of this. Blockchain is a public ledger of all transactions that happen within the crypto network and is available to everyone. It is global network, which has revolutionized the way humans partake in modern transactions.
With all the rich history that comes with Blockchain technology, cryptocurrency, and Bitcoin in particular, it is interesting to see how those currencies perform in the current day. This past November was a major lowpoint for Bitcoin investors, as the results from the month showed that cryptocurrencies collectively shed $70 billion in market value. Of the lot, Bitcoin dropped 37%. Hence, this leads to the objectives of our study on Bitcoin and cryptocurrencies for the future.


DATA DESCRIPTION
We focused on the price history data of Bitcoins which is available from 2013 from Dataset ‘Crypto Currency’ from Kaggle. The columns include: opening and closing prices, names and date. The data which is from year 2013 to 2018, gives us the information we need to predict Bitcoin prices after 2018 based on the 5 year price history.

MODELING
SIMPLE FORECASTING METHODS:
 Some forecasting methods are extremely simple and surprisingly effective. We will use the following forecasting methods as benchmarks:
AVERAGE METHOD:
In this method, the predictions of all future values are equal to the mean of the past data. This approach can be used with any sort of data where past data is available.
 If we let the historical data be denoted by y1,…,yTy1,…,yT , then we can write the forecasts as 
^yT+h|T=¯y=(y1+⋯+yT)/T.y^T+h|T=y¯=(y1+⋯+yT)/T. The notation ^yT+h|Ty^T+h|T is a short-hand for the estimate of yT+hyT+h based on the data y1,…,yTy1,…,yT .
meanf(y, h)
# y contains the time series
# h is the forecast horizon

In our case, the forecasts of all future values of Bitcoin prices are equal to the average (or “mean”) of the historical data of our data set “Crypto Currencies”. Which is approximately $116 after year 2018.
NAIVE METHOD:
Naïve forecasts are the most cost-effective forecasting model, and provide a benchmark against which more sophisticated models can be compared. This forecasting method is only suitable for time series data. Using the naïve approach, forecasts are produced that are equal to the last observed value. This method works quite well for economic and financial time series, which often have patterns that are difficult to reliably and accurately predict.
That is, ^yT+h|T=yT.y^T+h|T=yT.
naive(y, h)
rwf(y, h) # Equivalent alternative


For the Naïve approach,, we set all future forecasts of Bitcoin prices  to be the value of the last observation of our data set “Crypto Currencies” which is approximately $101 after year 2018.


 



Figure above shows the two methods we applied to the crypto currencies data.  In the graph, the forecasts of bitcoin prices are shown after 2018 based on past 5 years of data. Mean Avg price is forecasted to be ~ $116 based on avg of past 5 yrs. Naive price is expected to be  ~ $101 based of previous value.

LINEAR REGRESSION & MULTIPLE REGRESSION
LINEAR REGRESSION: 
Linear regression attempts to model the relationship between two variables by fitting a linear equation to observed data. One variable is considered to be an explanatory variable, and the other is considered to be a dependent variable.
In our case, the dependent variable is the Market Prices of the bitcoin, whereas we have any independent variables. Out of all the independent variable available, we chose the opening prices of the bitcoin to be our predictor variable. 
Our main goal was to implement a Linear Regression line and to fit the best model. 
From the figure, we can observe that, the abline i.e., the regression line appears to be linear. This is because, the Adjusted R-Square that has been acquired is 0.9997, which can be observed from the summary of the linear regression model. Because of the Adjusted R-Square being nearly perfect, the data has been scattered linearly on the graph. 
The residual error has also been plotted for this model. A graph that shows the residuals on the Y-axis and the independent variables on the X-axis is called as the residual plot. Only if the residual plot are randomly dispersed around the Y-axis, the model is appropriate for the data, otherwise a non-linear model is more appropriate.
For the model to be a good fit, the sum of the residuals should be approximately 0.









MULTIPLE REGRESSION:
Multiple Regression is an extension of the linear regression model. In this type of the model, the regression involves a single type of dependent variable and two or more independent variables. It is a statistical technique which allows to summarize the relationship between continuous variables. 
In this model, the market price is considered to be the dependent variable or the response variable, whereas the opening prices, closing prices,low, high, etc., are considered as the independent or the predictor variables. 
The general form given for the multiple regression model is:
Y= ß0 + ß1X1 + ß2X2 + …….. + ßkXk + e.
This multiple regression model is estimated using the following equation:
= a + b1X1 + b2X2 + …….. + bkXk.

Also, the residual plots have been plotted in the graph for the Multiple Regression Model. 
Out of all the cases that has been taken, it was observed that the Adjusted R-Square for the case where all the attributes was considered was 0.9997, which is assumed to be the best fit for the model. 


For this model as well, the residual plot was plotted and the sum of residuals for this case was also observed to be approximately 0, as the observed sum is -0.00, hence the plot is as shown in the figure below.





ARIMA MODEL:
ARIMA stands for AutoRegressive Integrated Moving Average. This acronym describes the key features bound in it. Briefly, they are:
AR: Autoregression. It uses the dependent relationship between an observation and some number of lagged observations.
I: Integrated. Differencing raw observations (e.g. subtracting an observation from an observation at the previous time step) in order to make the time series stationary.
MA: Moving Average. A model that uses the dependency between an observation and a residual error from a moving average model applied to lagged observations.
Basic Concepts:
The first step in applying ARIMA methodology is to check for stationarity. When a series remains at a constant level of time, the series is said to be known as a “Stationary series”.A series is said to be non-stationary if there is a trend observed in the data. Without these stationarity conditions being met, many of the calculations associated with the process cannot be computed.
Differencing:
In the case of non-stationarity, the data should be “differenced”. Differencing is a great way of transforming a nonstationary series to a stationary one. This is done by subtracting the observation in the current period from the previous one. This process is used to remove the trend, if any is present. In order to obtain better results the data can be differenced for the second time as well.
Autocorrelations:
Autocorrelation is the internal correlation present in a time series. It is done by checking the internal association of the values by their observations. It denotes +1 as  a strong internal association, -1 as a strong negative association and 0 as no association. It shows the lag present between the current values and the previous values. The autocorrelation at lag 0 is always 1, as the series will always be perfectly correlated with itself.
Autoregressive Models:
In a multiple regression model, we forecast the variable of interest using a linear combination of predictors. In an autoregression model, we forecast the variable of interest using a linear combination of past values of the variable. The term autoregression indicates that it is a regression of the variable against itself. Ex:
yt=β0+β1yt−1+β2yt−2+ϵt.
Forecasting using an Arima model:
First we’ll plot the original data to check for any sort of trend or seasonality present in the data. Here it must be mentioned that we plan to forecast the values for the closing prices of the bitcoins, hence we will be dealing with the ‘close’ column.


Here we observe that the data follows a certain trend, wherein the bitcoin prices gradually increase till the year 2017, where they reach a sky high position and then there onwards there is a decline. When we use Arima, we must make sure that the data is stationary and therefore in order to ensure this we conduct a stationarity test.
Therefore, here we conduct the Dickey-Fuller test prior to proceeding further.

After performing the test and accepting the the alternative hypothesis, the data is claimed to be stationary and we can further process the same. 

Differenced data:


The data is then divided into training and testing data. Training data in a dataset is used to to build a model while the testing data is used to validate a model. In this case we take the first 1400 rows of the ‘close’ column as the training data and the rest of the 466 rows as the testing data. We evaluate the Autocorrelation function and the partial autocorrelation function for the data to observe that:

It is observed that there is significant acf  in the observed data that slightly decreases with time and the graph for pacf shows one significant spike at lag 1, after which there is no significant spike observed. 
We use the auto.arima function to generate the best model.


It is observed that the AIC for the given model is 12754.88 and the best model chosen is ARIMA(2,1,2).
We now proceed to find out the forecast of the testing data to predict what the future bitcoins closing prices will look like using the current values.

CONCLUSION
From analyzing the first several rows of our bitcoin dataset, we can observe the steady rise from low $100s to $7000-8000 in market value of Bitcoin. As we know from the last several rows of our dataset (showing bitcoin prices in as recent as early 2018), the value had risen to approximately $7625. Due to volatile economic conditions, Bitcoin market value experienced a drop this Fall to present day, with the most significant drop appearing last month. With this information, we proceeded to predict what Bitcoin market value price will look like going forward.

