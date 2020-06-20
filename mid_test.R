student.df <- read.csv("test-marks.csv")
rows <- as.numeric(row.names(student.df[is.na(student.df$id),]))

#Get the full list of student ready to mark
mark.df <- student.df[-rows,]
rownames(mark.df) <- 1:nrow(mark.df)

#students need to mark for question 01
Q1.tomark <- mark.df$id[1:123]


#student need to mark for question 04
Q4.tomark<- mark.df$id[124:164]
length()


#Mark Q1
for(i in Q1.tomark){
  print(mark.df$name[mark.df$id ==i])
  student.name <- mark.df$name[mark.df$id ==i]
  cat("You are now marking ", as.character(student.name),"\n")
  
  #Preivew the file
  previewcmd <- paste("qlmanage -p submissions/*",i,"*", sep = "")
  system(previewcmd)
  mark01.1 = as.numeric(readline(prompt = " the layout is correct(3 marks)-->  "))
  
  
  ###Use tidy to check errors
  tidycmd <- paste("tidy submissions/*",i, "*.html"," >/dev/null" ,sep = "")
  system(tidycmd)
   
  mark01.2 = as.numeric(readline(prompt = " could pass the validation (4 marks)-->  "))

  ###Open student's file checking layout
  opencmd <- paste("open ","submissions/*",i,"*.html", sep = "")
  system(opencmd)
  mark01.3 = as.numeric(readline(prompt = " good indentation (3 marks)-->  "))
  
  mark01 <- sum(mark01.1,mark01.2, mark01.3)
  mark.df$Q1.10.marks.[mark.df$id ==i] = mark01
  
  comments <- readline(prompt = "Any comments for this student? --> ")
  mark.df[mark.df$id == i,][,13]<- comments
}

for (i in Q4.tomark){
  print(i)
  mark04.1 = as.numeric(readline(prompt = "question 01 2 marks-->  "))
  mark04.2 = as.numeric(readline(prompt = "question 01 3 marks-->  "))
  mark04.3 = as.numeric(readline(prompt = "question 01 5 marks-->  "))
  comments.04 <- readline(prompt = "Any comments for this student? --> ")
  mark.df[mark.df$id == i,][,9:11] <- c(mark04.1, mark04.2, mark04.3)
  mark.df[mark.df$id == i,][,16]<- comments.04
  
}

write.table(mark.df, "/Users/Joy/Documents/UoA/test-marks.csv", row.names = FALSE, sep = ",")

