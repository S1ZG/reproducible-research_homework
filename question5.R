
#install.packages("ggplot2")
#install.packages("dplyr")

library(ggplot2)
library(dplyr)

ds_data <- read.csv("question-5-data/Cui_etal2014.csv")


#Question 5a
str(ds_data)    #There are 33 rows and 13 columns


#Question 5b
#log transformation
log_ds_data <- ds_data %>%
  mutate(log_VironVol = log(ds_data$Virion.volume..nm.nm.nm.)) %>%
  mutate(log_GenomeLength = log(ds_data$Genome.length..kb.))

#Plot the log transformation
ggplot(data = log_ds_data, aes(x = log_GenomeLength, y = log_VironVol)) +
  geom_point() +
  labs(x = "Log Genome Length (kb)", y = "Log Viron Volume (nm³)")


#Question 5c
#Linear model
linmodel <- lm(log_VironVol ~ log_GenomeLength, log_ds_data)

summary(linmodel)


#Question 5d
#Replicating the graph
ggplot(data = log_ds_data, aes(x = log_GenomeLength, y = log_VironVol)) +
  geom_point() +
  geom_smooth(method = "lm") + 
  labs(x = "Log [Genome Length (kb)]", y = "Log [Viron Volume(nm³)]")


#Question 5e

Xlog_V <- 7.0748 + 1.5152*log(300)

exp(Xlog_V)

