student.df <- read.csv("lab05-marks-c-1.csv")
dim(student.df)
mark.df <-data.frame(matrix(vector(), ncol = 8))
colnames(mark.df) <- names(student.df)

student.no <- nrow(student.df)

for(i in 1:student.no){
  student <- student.df[i,]
  student.name <- student[1]
  std.Id <- student[2]
  open.txt.cmd <- paste("open ","submissions/*",std.Id,"*.txt", sep = "")
  system(open.txt.cmd)
  mark01.1<- as.numeric(readline(prompt = "all data being represented 2 marks ---->"))
  mark01.2 <- as.numeric(readline(prompt = "all table has primary key 1 mark------>"))
  mark01.3 <- as.numeric(readline(prompt = "3NF 1mark --->"))
  mark01.4 <- as.numeric(readline(prompt = "sensible column name 1 mark -->"))
  mark01.5 <- as.numeric(readline(prompt = "good labelling of foreign key 1 mark -->"))
  mark01<- sum(mark01.1,mark01.2, mark01.3,mark01.4,mark01.5)
  
  open.sql.cmd <- paste("open ","submissions/*",std.Id,"*.sql", sep = "")
  system(open.sql.cmd)
  mark02 <- as.numeric(readline(prompt = "quesion 2a 2 mark -->"))
  mark03 <- as.numeric(readline(prompt = "quesion 2b 2 mark -->"))
  mark04 <- as.numeric(readline(prompt = "quesion 2c 2 mark -->"))
  total <- sum(mark01,mark02,mark03,mark04)
  comments <- readline(prompt = "Any comments for this student? --> ")
  student[3:8] <- c(mark01,mark02,mark03,mark04,total,comments)
  mark.df[i,] <- student
  print("Student is been marked, details as follows")
  print(mark.df[i,])
}
write.table(mark.df, "/Users/Joy/Documents/UoA/lab05-marks-c-1.csv", row.names = FALSE, sep = ",")
