#remove all objects and then check
rm(list = ls())
ls()

library(sqldf)
gc(reset = TRUE) # liberar a memória para o SO
# New Lines
f <- file("surgery_1_eliasN.csv")

system.time(bigdf <- sqldf("select * from f", dbname = tempfile(), file.format = list(header = T, row.names = F)))

# user system elapsed
# 246.994 16.165 281.253 


data2 <- sqldf("SELECT * FROM data JOIN death USING(?????)")


#below just deleting all duplicates by first finding their location and then subsetting the data set will all three tables
data3 <- data2[!duplicated(data2$PATIENT_KEY),]
View(data3) #need to check this to see whether it is correct

