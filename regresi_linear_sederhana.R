# Simple Linear Regression

# Importing the dataset
dataset = read.csv('data_gaji.csv')

# Membagi Dataset Data Uji dan Data Latih 
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Membangun Model Regresi Linear Sederhana
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

# Memprediksi Data Uji
y_pred = predict(regressor, newdata = test_set)

# Memvisualisasikan Hasil Data Latih
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Gaji vs Pengalaman (Data Latih)') +
  xlab('Lama Pengalaman Bekerja') +
  ylab('Gaji')

# Memvisualisasikan Hasil Data Uji
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Gaji vs Pengalaman (Data Uji)') +
  xlab('Lama Pengalaman Bekerja') +
  ylab('Gaji')
