
# Import dataset
expdata <- read.csv('G:\\Kavya\\Electives\\2nd sem\\Data Analytics\\assignments\\Assignment-2\\ActualRating1.csv')


head(expdata)

#yticks <- seq(5, 12, 1)
#plot(x,y, axes = FALSE) # Fifth plot
#axis(2, at = yticks, labels = yticks, col.axis="red", las=2)
#title("Manipulated Y-axis")

#Plotting the time series data GRP ratings
plot.ts(expdata$GRP)

#Using Holt double exponential smoothing to do a prediction for the training set 
#using the values provided by the function

exp1 <- holt(expdata$GRP, alpha = NULL, h=11)
#exp1_data = as.data.frame(exp1)
str(exp1)

#Predicting for the test set
#exp1.pred <- predict(exp1, n.ahead = 11, prediction.interval = TRUE)
#exp1.pred

#Plotting the data based on the data predicted above
plot.ts(expdata$GRP, xlim = c(0,102), ylim = c(100,500))

lines(exp1$fitted, col = 'green')
lines(exp1$mean, col = 'blue')
lines(exp1$lower[,1], col = 'red')
lines(exp1$upper[,1], col = 'red')

#Making actual and predicted data length the same to predict MAPE
#mydata = expdata$GRP [-c(1,2,82,83,84,85,86,87,88,89,90,91,92)]

#Importing test data
expdata_test <- read.csv('G:\\Kavya\\Electives\\2nd sem\\Data Analytics\\assignments\\Assignment-2\\rating_test.csv')

#MAPE calculation
MAPE = (abs((expdata_test$GRP-exp1$mean)/expdata_test$GRP)*100)
MAPE
summary(MAPE)

