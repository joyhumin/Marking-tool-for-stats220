##Read student list
student.df <- read.csv("lab04-marks-c-1.csv")
mark.df <-data.frame(matrix(vector(), ncol = 9))
colnames(mark.df) <- names(student.df)

#Get total student number


for (i in 1:std.num){
  student <- student.df[i,]
  student.name <- student[1]
  std.Id <- student[2]
  
  cat("You are now marking", as.character(student.name), "\n")
  
  opencmd <- paste("open ","submissions/*",std.Id,"*", sep = "")
  system(opencmd)
  
  cat("The xmllint validation result as follows \n")
  #using xmllint cmd check xml file validility
  xmllint.cmd <- paste("xmllint --valid ","submissions/*",std.Id,"*"," --noout",sep = "")
  system(xmllint.cmd)
  cat("check is done")
  
  ##Enter marks
  mark05 = as.numeric(readline(prompt = "There is at least one comment. (1 mark)"))
  mark01 =  as.numeric(readline(prompt = "All of the data is in the XML file (1 mark) --> "))
  mark02 = as.numeric(readline(prompt = "The data is structured sensibly (minimum requirement: planets are nested within stars as appropriate) (1 mark) --> "))

  mark03 = as.numeric(readline(prompt = "The XML file passes validation (1 mark)"))
  mark04 = as.numeric(readline(prompt = "The DTD correctly sets star and planet names as ID #REQUIRED, and restricts 'habitable' to (yes|no|maybe), as asked in the question (1 mark)"))

  total = sum(mark01, mark02,mark03, mark04,mark05)
  comments <- readline(prompt = "Any comments for this student? --> ")
  student[3:9] = c(mark01,mark02, mark03, mark04, mark05,total,comments)
  mark.df[i,] <- student
}
mark.df$name <- student.df$name
write.table(mark.df, "/Users/Joy/Documents/UoA/lab04-marks-c-1.csv", row.names = FALSE, sep = ",")
