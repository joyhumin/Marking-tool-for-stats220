student.df <- read.csv("lab10-marks-c-1.csv")
mark.df <- data.frame(matrix(0,ncol = ncol(student.df)))
names(mark.df) <- colnames(student.df)

student.num <- nrow(student.df)
# student.num <- c(3,12)

for (i in 1:student.num){
  student <- student.df[i,]
  student.name <- student[1]
  print(student.name)
  student.id <- student[2]
  
  mark01 <- as.numeric(readline(prompt = "1 marks off for using loop  ------> 4 marks"))
  
  mark02 <- as.numeric(readline(prompt = "1 marks off for using nested loop----> 4 marks "))
  
  mark03 <- as.numeric(readline(prompt = "1 marks off for nested loop ----> 4 marks "))
  
  layout.decution <-as.numeric(readline(prompt = "comment or layout decution (-1 or -2)"))
  total <- sum(mark01,mark02,mark03,layout.decution)
  comment <- readline(prompt = "Any comments for this student? --> ")
  student[3:8] <- c(mark01,mark02,mark03,layout.decution,total, comment)
  mark.df[i,]<-student 
}

write.table(mark.df, "/Users/Joy/Documents/UoA/lab10-marks-c-1.csv", row.names = FALSE,sep = ",")
