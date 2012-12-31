#remove all objects and then check
rm(list = ls())
ls()

library(sqldf)
gc(reset = TRUE) # liberar a memória para o SO
# New Lines
f1 <- file("surgery_1_elias.csv")
f2 <- file("surgery_2_elias.csv")

system.time(data1 <- sqldf("select * from f1", dbname = tempfile(), file.format = list(header = T, row.names = F)))
system.time(data2 <- sqldf("select * from f2", dbname = tempfile(), file.format = list(header = T, row.names = F)))
names(data1)
names(data2)

system.time(data3 <- sqldf("select * from data1 join data2 USING(PacienteId)", dbname = tempfile(), file.format = list(header = T, row.names = F)))
            
#below just deleting all duplicates by first finding their location and then subsetting the data set will all three tables
data3 <- data2[!duplicated(data2$PATIENT_KEY),]
View(data3) #need to check this to see whether it is correct
