
library(dplyr)
library(tidyverse)
library(readr)
library(corrplot)
library(stats)

speed_data_data <- read_csv("C:/Users/Acer/Desktop/speed_data_data.csv")

clean_data <- na.omit(speed_data_data)

view(clean_data)

#chisquare test
df_valid <- clean_data
for (x in 1:length(df_valid$met)){
  if( df_valid$met[x] >= 1 ){
    df_valid$met[x] <- 1
  }
}
print(df_valid$met)

result <- chisq.test(df_valid$dec, df_valid$met)
print(result)


#binomial logistical regression test

print(clean_data$met)

model <- glm(dec ~ attr + sinc + intel + fun + amb + shar + like + prob + met, 
             data = clean_data,, family = binomial(link = "logit"))
summary(model)

coef(model)

ctable <- coef(summary(model))
odds_ratio <- exp(coef(summary(model))[ , c("Estimate")])
(coef_summary <-  cbind(ctable, as.data.frame(odds_ratio, nrow = nrow(ctable), ncol = 1))) %>% 
  knitr::kable()


#avg
avgVector <- c(mean(clean_data$attr),
               mean(clean_data$sinc),
               mean(clean_data$intel),
               mean(clean_data$fun),
               mean(clean_data$amb),
               mean(clean_data$shar)   )

avgVectorDat <- round(avgVector)
charNames <- c("attr","sinc","intel","fun","amb","shar")
barplot(avgVectorDat,names.arg=charNames,xlab="Characteristic",ylab="Avg. Rating",main="Rating")


#avg by no matches

no_matches <- clean_data[clean_data$dec == 0,]
print(no_matches)
avgVector <- c(mean(no_matches$attr),
               mean(no_matches$sinc),
               mean(no_matches$intel),
               mean(no_matches$fun),
               mean(no_matches$amb),
               mean(no_matches$shar)   )

avgVectorDat <- round(avgVector)
print(avgVectorDat)
charNames <- c("attr","sinc","intel","fun","amb","shar")
barplot(avgVectorDat,names.arg=charNames,xlab="Characteristic",ylab="Avg. Rating",main="NM Avg. Rating")

#avg by matches
has_matches <- clean_data[clean_data$dec == 1,]
print(has_matches)
avgVector <- c(mean(has_matches$attr),
               mean(has_matches$sinc),
               mean(has_matches$intel),
               mean(has_matches$fun),
               mean(has_matches$amb),
               mean(has_matches$shar)   )

avgVectorDat <- round(avgVector)
print(avgVectorDat)
charNames <- c("attr","sinc","intel","fun","amb","shar")
barplot(avgVectorDat,names.arg=charNames,xlab="Characteristic",ylab="Avg. Rating",main="Matched Avg. Rating")

#avg by gender (female)
is_female <- clean_data[clean_data$gender == 0,]
print(is_female)
avgVector <- c(mean(is_female$attr),
               mean(is_female$sinc),
               mean(is_female$intel),
               mean(is_female$fun),
               mean(is_female$amb),
               mean(is_female$shar)   )

avgVectorDat <- round(avgVector)
print(avgVectorDat)
charNames <- c("attr","sinc","intel","fun","amb","shar")
barplot(avgVectorDat,names.arg=charNames,xlab="Characteristic",ylab="Avg. Rating",main="Female Avg. Rating")

#avg by gender(male)
is_male <- clean_data[clean_data$gender == 1,]
print(is_male)
avgVector <- c(mean(is_male$attr),
               mean(is_male$sinc),
               mean(is_male$intel),
               mean(is_male$fun),
               mean(is_male$amb),
               mean(is_male$shar)   )

avgVectorDat <- round(avgVector)
print(avgVectorDat)
charNames <- c("attr","sinc","intel","fun","amb","shar")
barplot(avgVectorDat,names.arg=charNames,xlab="Characteristic",ylab="Avg. Rating",main="Male Avg. Rating")


#Checking which gender matched more
match <- with(clean_data,tapply(gender,dec, FUN=sum))
print(match)
genderNames <- c("Female","Male")
barplot(match,names.arg=genderNames,xlab="Gender",ylab="No. of matches",main="Matches")

#Checking which career received more matches
job <- clean_data %>% group_by(career) %>%
  summarise(Matches = sum(dec))

#Getting the index of the max of the matches
indexOfJob <- which.max(job$Matches)


#Output for which career received more matches
print(job[indexOfJob, ])


#Count of people that actually matched
sum(clean_data$dec)
