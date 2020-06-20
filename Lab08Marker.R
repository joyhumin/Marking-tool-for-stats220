# read student file
student.df <- read.csv("lab08-marks-c-1.csv")
student.num <- nrow(student.df)
# mark.df <- data.frame(matrix(NA, nrow = student.num, ncol = ncol(student.df)))
# colnames(mark.df) <- colnames(student.df)
mark.df <- read.csv("/Users/Joy/Documents/UoA/lab08-marks-c-1.csv")

# student.num = 2
# redo = c(10,30)
# require("diffobj")

for (i in 1:student.num){
  student <- student.df[i,]
  student.name <- student[1]
  student.id <- student[2]
  open.r.cmd <- paste("open ","submissions/*",student.id,"*", sep = "")
  system(open.r.cmd)
  
  # open.r.cmd <- paste("find submissions/*", student.id, "*.R", sep = "")
  # filename <- system(open.r.cmd, intern = TRUE)
  # diffr("lab08-solution.R",filename)
  # dif <- diffFile(filename,"lab08-solution.R")
  # mark01 <- as.numeric(readline(prompt = "Question 01  generate file names(2 marks) -->"))
  # mark02 <- as.numeric(readline(prompt = "Question 02  print the max values(4 marks) -->"))
  # mark03 <- as.numeric(readline(prompt = "Question 03  calculate proportion(6 marks) -->"))
  # total <- sum(mark01,mark02,mark03)
  comment <- readline(prompt = "Any comments for this student? --> ")
  # student[3:7] <- c(mark01,mark02,mark03,total,comment)
  # mark.df[i,] <- student
}
# write.table(mark.df,file = "/Users/Joy/Documents/UoA/lab08-marks-c-1.csv", row.names = FALSE, sep = ",")