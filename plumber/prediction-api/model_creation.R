library(dplyr)
library(readr)
library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)


train <- read_csv("train.csv")
test <- read_csv("test.csv")

fit <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked,
             data=train,
             method="class")


fancyRpartPlot(fit)

Prediction <- predict(fit, test, type = "class")

saveRDS(fit, "final_model.rds")
