##Read student list
student.df <- read.csv("lab03-marks-c-1.csv")
mark.df <-data.frame(matrix(vector(), ncol = 10))
colnames(mark.df) <- names(student.df)

#Get total student number
std.num <- nrow(student.df)


for (i in std.num){
  student <- student.df[i,]
  student.name <- student[1]
  std.Id <- student[2]
  
  
  #Open student's file checking layout
  opencmd <- paste("open ","submissions/*",std.Id,"*", sep = "")
  system(opencmd)
  
  #Enter marks
  mark01 =  as.numeric(readline(prompt = "Enter Q2 a) 1 mark --> "))
  mark02 = as.numeric(readline(prompt = "Enter Q2 b) 1 mark --> "))
  mark03 = as.numeric(readline(prompt = "Enter Q2 c) 1 mark --> "))
  mark04 = as.numeric(readline(prompt = "Enter Q2 d) 1 mark --> "))
  mark05 = as.numeric(readline(prompt = "Enter Q2 e) 1 mark --> "))
  mark06 = as.numeric(readline(prompt = "Enter Q2 f) 2 mark --> "))
  student[1:2] <- c(student.name,std.Id)
  student[3:8] <- c(mark01,mark02,mark03,mark04,mark05,mark06)
  total = sum(mark01, mark02, mark03, mark04, mark05,mark06)
  student[9]<-total
  comments <- readline(prompt = "Any comments for this student? --> ")
  student[10] <- comments
  mark.df[i,] <- student
  print("Student is been marked, details as follows")
  print(mark.df[i,])
}


write.table(mark.df, "/Users/Joy/Documents/UoA/lab03-marks-c-1.csv", row.names = FALSE, sep = ",")
