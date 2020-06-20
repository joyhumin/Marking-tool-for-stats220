student.df <- read.csv("lab07-marks-c-1.csv")
student.df <- student.df[-1,]
std.num <- nrow(student.df)
mark.df <-data.frame(matrix(vector(), ncol = ncol(student.df)))
colnames(mark.df) <- names(student.df)

for(i in 1:std.num){
  student <- student.df[i, ]
  student.name <- student[1]
  student.id <- student[2]
  open.r.cmd <- paste("open ","lab07-marking/submissions/*",student.id,"*", sep = "")
  system(open.r.cmd)
  
  mark01 <- as.numeric(readline(prompt = "Question 01  'row.names' is required (2 marks) -->"))
  # 'skip', 'sep', and 'header' all important
  ## 'row.names' required again
  mark02 <- as.numeric(readline(prompt = "Question 02 (4 marks) -->"))
  ## Explicit read.csv() for each file is all that is expected at this stage
  ## 'row.names' still required
  ## 'na.rm' required in max() call
  ## maxCount = 3719
  mark03 <- as.numeric(readline(prompt = "Question 03 (4 marks) -->"))
  # 0.7638963
  mark04 <- as.numeric(readline(prompt = "Question 04 (2 marks) -->"))
  total <- sum(mark01,mark02,mark02,mark04)
  comment <- readline(prompt = "Any comments for this student? --> ")
  student[3:8] <- c(mark01,mark02,mark03,mark04,total,comment)
  mark.df[i,] <-student
}
for(i in 1:std.num){
  marks<- mark.df[i,]
  marks
  total <- sum(as.numeric(marks[3]), as.numeric(marks[4]), as.numeric(marks[5]), as.numeric(marks[6]))
  mark.df[i,][7] <- total
}


write.table(mark.df, "/Users/Joy/Documents/UoA/lab07-marks-c-1.csv", row.names = FALSE, sep = ",")
