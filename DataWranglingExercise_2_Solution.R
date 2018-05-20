library("dplyr")
library("stringr")
library("tidyr")

Datasheet_1 <- read.csv("C:\\Users\\vamoh\\Documents\\SpringBoard-IntroToDataScience\\DataWranglingExercise2\\titanic_original.csv")

#Problem_1 - Replace 'blank' values by "S"

#Checking no. of rows that has blank value in embarked column
Datasheet_1 %>%
  select(embarked) %>%
    filter(embarked == "")

Datasheet_1$embarked <- gsub("^$", "S", Datasheet_1$embarked)

#problem_2 - Age

# viewing the distribution of age. since its symetric and mean appears to match with actual mean(without NAs), thus mean is best option for replacing the "NA" values
hist(Datasheet_1$age)

#calculating mean of 'age' column
mean_age <- mean(Datasheet_1$age,na.rm = TRUE)

#Looking for 'NA' vlaue in age column
missing_age_value <- is.na(Datasheet_1$age)

#assigning mean of 'age' for all the missing values
Datasheet_1$age[missing_age_value] <- mean_age

#PRoblem_3 Lifeboat
#filling blank values with 'NA'
Datasheet_1$boat <- gsub("^$", "NA", Datasheet_1$boat)

#problem_5 - cabin
has_cabin_number <- c()
for (i in 1:length(Datasheet_1$cabin)) {
  if (Datasheet_1$cabin[i] == "") {
    has_cabin_number[i] <- 0
  } else {
    has_cabin_number[i] <- 1
  }
}

Datasheet_1 <- cbind(Datasheet_1, has_cabin_number)

write.csv(Datasheet_1, "titanic_clean.csv")


##############################-Rough-Work_Below#######################################

# b <- which(Datasheet_1$age == NA)
# 
# Datasheet_1 %>%
#   select(age) %>%
#     filter(age == "NA")
# 
# gsub("NA", a , Datasheet_1$age)
# str_replace_all(Datasheet_1$age, "NA" , a)
