library(tidyverse)
library(caret)
library(palmerpenguins)

penguins_clean  = penguins %>% drop_na()
penguins_clean$species = as.factor(penguins_clean$species)
penguins_clean$sex = as.factor(penguins_clean$sex)

penguins_clean$sex = factor(penguins_clean$sex,
                            labels=c(0,1),
                            levels=c('male','female'))

# Plot chart
penguins %>% 
  ggplot(penguins,mapping= aes(bill_length_mm,flipper_length_mm,color=species)) +
  geom_point()


# Spilt data
n = nrow(penguins_clean)
id = sample(1:n,n*0.7)
train_data = penguins_clean[id,]
test_data = penguins_clean[-id,]

# Train model 

ctrl = trainControl(
  method = 'CV',
  number = 10 ,
  verboseIter = F
)

glm_model = train(sex ~ bill_length_mm+bill_depth_mm+flipper_length_mm+body_mass_g,
                  data=train_data,method='glm', family = "binomial")

rf_model = train(species ~ bill_length_mm+bill_depth_mm+flipper_length_mm+body_mass_g,
                 data=train_data,method='rf',
                 ntree=100,
                 preProcess = c('center','scale'),
                 trControl = ctrl )


# Score model

p_test1 = predict(glm_model,newdata = test_data)
p_test2 = predict(rf_model,newdata = test_data)

# Evaluate model

acc1 = mean(test_data$sex==p_test1)
acc2 = mean(test_data$species==p_test2)
