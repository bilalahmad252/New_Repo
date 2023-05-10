library(dplyr)
library (readr)
#For reading a file from github always use the raw url
urlfile="https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"

mydata<-read_csv(url(urlfile))
View(mydata)

control <- filter(mydata,Diet=="chow") %>% select(Bodyweight) %>% unlist	#unlist is used to convert the data frame into a vector
treatment <- filter(mydata,Diet=="hf") %>% select(Bodyweight) %>% unlist
View(control)
print( mean(treatment) )
print( mean(control) )
obsdiff <- mean(treatment) - mean(control)
print(nulls)

#Null distribution and P-value calculation

url1="https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
population = read_csv(url(url1)) %>% unlist #unlist is used to convert the data frame into a vector
View(population)
#Set random seed
set.seed(123)
mean(sample(population, 12))
n=10000
nulls= vector("numeric",n)

for (i in 1:n) {
  control <- sample(population, 12)
  treatment <- sample(population, 12)
  nulls[i] <- mean(treatment) - mean(control)
}
control <- sample(population, 12)
treatment <- sample(population, 12)
mean(treatment) - mean(control)
max(nulls)
mean(nulls)
hist(nulls)



#THis is assignmnet part
library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )
View(x)
set.seed(1)
n=1000
random_vector=vector("numeric",n)
for (i in n) {
  weight <- sample(x, 5)
    random_vector[i] <- mean(weight)
  
}
hist(random_vector)
