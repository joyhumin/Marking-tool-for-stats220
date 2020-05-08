##Read student list
student.df <- read.csv("A2-marks-c-1.csv")
#dim(student.df)
mark.df <-data.frame(matrix(vector(), ncol = 11))
colnames(mark.df) <- names(student.df)
mark.names <- names(student.df)[3:11]


##Get total student number
student.no <- nrow(student.df)


#Go through each student's file and mark their solutions
for(i in 1:student.no){
  student <- student.df[i,]
  student.name <- student[1]
  std.Id <- student[2]
  
  ##Mark question 01
  open.xml.cmd <- paste("open ","submissions/*",std.Id,"*.xml", sep = "")
  system(open.xml.cmd)
  
  cat("Now we are marking", mark.names[1], "\n")
  mark01 = as.numeric(readline(prompt = "Enter marking (2 marks total) -->"))
  cat("Now we are marking", mark.names[2], "\n")
  mark02 = as.numeric(readline(prompt = "Enter marking (2 marks total) -->"))
  cat("Now we are marking", mark.names[3], "\n")
  mark03 = as.numeric(readline(prompt = "Enter marking (2 marks total) -->"))
  cat("Now we are marking", mark.names[4], "\n")
  mark04 = as.numeric(readline(prompt = "Enter marking (4 marks total) -->"))
  cat("Now we are marking", mark.names[5], "\n")
  mark05 = as.numeric(readline(prompt = "Enter marking (3 marks total) -->"))
  cat("Now we are marking", mark.names[6], "\n")
  cat("The xmllint validation result as follows \n")
  #using xmllint cmd check xml file validility
  xmllint.cmd <- paste("xmllint --valid ","submissions/*",std.Id,"*.xml"," --noout",sep = "")
  system(xmllint.cmd)
  cat("check is done")
  mark06 = as.numeric(readline(prompt = "Enter marking (2 marks total) -->"))
  
  ##Mark question 02
  #open the file
  open.txt.cmd <- paste("open ","submissions/*",std.Id,"*.txt", sep = "")
  system(open.txt.cmd)
  
  #For assignment 2:
  #- 5 marks for all the data being represented somewhere in the table(s)
  #- 3 marks for each table having a primary key which is labelled and which uniquely identifies each row. The primary key does NOT have to be a numerical ID like in my solutions. For example it could be a text name.
  #- 4 marks for the design being in third normal form. In some cases, the tables might be a bit different from mine but still constitute a valid answer. If in doubt, check with Jason. If Jason is in doubt too, check with me.
  #- 1 mark for sensible column names
  #- 2 marks for good labelling of foreign keys
  markq2.1 <- as.numeric(readline(prompt = "all data has being represented somwhere in the table?  (5 marks total) -->"))
  markq2.2 <- as.numeric(readline(prompt = "Each table having a primary key which is labelled and uniquely identified each row?  (3 marks total) -->"))
  markq2.3 <- as.numeric(readline(prompt = "Is this design in 3NF? (4 marks total) -->"))
  markq2.4 <- as.numeric(readline(prompt = "Having sensible column names? (1 marks total) -->"))
  markq2.5 <- as.numeric(readline(prompt = "Good labelling of foreign keys (2 marks total) -->"))
  
  mark07 <- sum(markq2.1,markq2.2, markq2.3, markq2.4,markq2.5)
  totalMarks <- sum(mark01,mark02, mark03,mark04,mark05,mark06,mark07)
  comments <- readline(prompt = "Any comments for this student? --> ")
  student[1:11] <- c(student.name,std.Id,mark01,mark02,mark03,mark04,mark05,mark06,mark07,totalMarks,comments)
  mark.df[i,] <- student
  print("Student is been marked, details as follows")
  print(mark.df[i,])
}

write.table(mark.df, "/Users/Joy/Documents/UoA/A2-marks-c-1.csv", row.names = FALSE, sep = ",")