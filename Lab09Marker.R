student.df <- read.csv("lab09-marks-c-1.csv")
mark.df <-read.csv("/Users/Joy/Documents/UoA/lab09-marks-c-1.csv")
names(mark.df)<-colnames(student.df)

student.num <- nrow(student.df)
# student.num <- c(20,28)
for (i in 1:student.num){
  print(i)
  student <- student.df[i,]
  student.name <- student[1]
  student.id <- student[2]
  print(student.name)
  
  #1 mark down for no comment
  #1 mark down for poor layout
  mark01 <- as.numeric(readline(prompt = "right proportion ------> 2 marks"))
  
  mark02 <- as.numeric(readline(prompt = "question 2 ----> 4 marks "))
  
  mark03 <- as.numeric(readline(prompt = "marks off for nested loop ----> 4 marks "))
  
  total <- sum(mark01,mark02,mark03)
  
  comment <-  readline(prompt = "Any comments for this student? --> ")
  student[3:7] <- c(mark01,mark02,mark03,total,comment)
  mark.df[i,] <- student
}
# mark.df <- mark.df[,-8]

write.table(mark.df, "/Users/Joy/Documents/UoA/lab09-marks-c-1.csv", row.names = FALSE,sep = ",")
