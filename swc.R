#SWC intermediate R exercises

#using assignment operators

x<-5
x

surveys<-read.csv(file="surveys.csv")

help.search("kruskal")


inflam02<-read.csv(file="inflammation-02.csv",header=FALSE)

class(inflam02)
dim(inflam02)

#columns=days
#rows=patients

inflam02[30,2]
inflam02[31,2]
inflam02[,2]
inflam02[1:4,1:5]

#get the mean inflammation for all patients on day 7
mean(inflam02[,7])

min(inflam02[,7])
median(inflam02[,7])

#standard deviation:
sd(inflam02[,7])

#this is the average inflammation on each day across all patients
apply(inflam02,MARGIN=2, mean)
#this means that it is calculating a mean for each column
#to do this for each row, would do MARGIN=1

avg_day_inflam<-apply(inflam02, MARGIN=2, mean)
plot(avg_day_inflam)
max_day_inflam<-apply(inflam02, MARGIN=2, max)
plot(max_day_inflam)
min_day_inflam<-apply(inflam02, MARGIN=2, min)
plot(min_day_inflam)
sd_day_inflam<-apply(inflam02, MARGIN=2, sd)
plot(sd_day_inflam)

#creating a function that will convert from fahrenheit to kelvin
fahr_to_kelvin<-function(temp){
  kelvin<-((temp-32)*(5/9))+273.15
  return(kelvin)
}

fahr_to_kelvin(7)

#creating a function that will convert from kelvin to celsius
kelvin_to_celsius<-function(temp){
  celsius<-temp-273.15
  return(celsius)
}

#it's okay to have "temp" within different functions; when create a variable inside a 
#function, it stays within that function, doesn't pollute the environment

fahr_to_celsius<-function(temp){
  tempk<-fahr_to_kelvin(temp)
  kelvin_to_celsius(tempk)
}

vec<-c(1,2,3)
vec<-c("1","2","3")

best_practice<-c("write","programs","for","people","not","computers")
asterisk<-"***"

fence<-function(original,wrapper){
  result<-c(wrapper,original,wrapper)
  return(result)
}
fence(best_practice, asterisk)
star<-"*"



##Write a function that will do all of the following:
inflam02<-read.csv(file="inflammation-02.csv",header=FALSE)
avg_day_inflam<-apply(inflam02, MARGIN=2, mean)
plot(avg_day_inflam)
max_day_inflam<-apply(inflam02, MARGIN=2, max)
plot(max_day_inflam)
min_day_inflam<-apply(inflam02, MARGIN=2, min)
plot(min_day_inflam)

#first attempt at writing the function:
analyze<-function(filename){
  thedata<-read.csv(file=filename,header=FALSE)
  avg_day_inflam<-apply(thedata, MARGIN=2, mean)
  plot(avg_day_inflam)
  max_day_inflam<-apply(thedata, MARGIN=2, max)
  plot(max_day_inflam)
  min_day_inflam<-apply(thedata, MARGIN=2, min)
  plot(min_day_inflam)
}
analyze("inflammation-03.csv")
analyze("inflammation-04.csv")

length(best_practice)

len<-0
for(v in best_practice){
  len<-len+1
}
len

values<-c(1,2,3)

total<-function(vec){
  tot<-0
  for(v in vec)
    tot=tot+v
  return(tot)
}
total(values)

#creating a loop to batch analyze inflammation data

list.files(pattern="csv")
list.files(pattern="inflammation")

filenames<-list.files(pattern="^inflammation.+\\.csv$")
# the code above says to pull the file names that start with "inflammation" and end with ".csv"
# the ^ in the previous tells you that inflammation has to occur right at the beginning

for (f in filenames){
  print(f)
  analyze(f)
}

analyzeall<-function(datapattern){
  filenames<-list.files(pattern=datapattern)
  for (f in filenames){
    print(f)
    analyze(f)
  
}
}

analyzeall("inflam")

