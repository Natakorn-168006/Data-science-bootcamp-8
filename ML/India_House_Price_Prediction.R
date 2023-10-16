library(tidyverse)
library(caret)
library(readxl)


df = read_xlsx('House Price India.xlsx')
df = df %>%
  rename(Postal_Code = 'Postal Code')


# Split data

set.seed(69)
n = nrow(df)
id = sample(1:n,n*0.8)
train_data = df[id,]
test_data = df[-id,]

# Train model

ctrl = trainControl(
  method = 'CV',
  number = 10 ,
  verboseIter = F
)

rf_model = train(Price ~ . - Postal_Code ,
                 data = train_data,
                 method='rf',
                 ntree=100,
                 preProcess = c('center','scale'),
                 trControl = ctrl )

# Score model 

p_test = predict(rf_model,newdata = test_data)

# Evaluate model

test_data$predicted_price = p_test

mae_test = mean(abs(test_data$Price-p_test))
rmse_test = sqrt(mean((test_data$Price-p_test)**2))
corr = cor(test_data$Price,test_data$predicted_price,method = "spearman")
