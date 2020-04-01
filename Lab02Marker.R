# This file is used to mark stats220 assginment (checking html):
# To use this file, you need to install "tidy HTML" first in you system
# Create a project and add this file within same folder as your project
# All students submission I saved it into the subfolder "submission", if you don't use same folder name, please change it accordingly. 



# Read your student list
student.df <- read.csv("lab02-marks-c-1.csv", header = TRUE, stringsAsFactors = FALSE)
# Get total student number
std.num<- nrow(student.df)

# Initialze the output dataframechro
mark.df <- data.frame(matrix(vector(), ncol = 8))
colnames(mark.df) <- names(student.df)


#Running through each student and enter the marks for them
for (i in 1:std.num){
  student<- student.df[i, ]
  studentname <- student[1]
  stdId <- student[2]
  
  cat("You are now marking ", as.character(studentname))
  
  # Use Google Chrome to check appearence
  chromecmd <- paste("open -a 'Google Chrome' submissions/*",stdId,"*", sep = "")
  #chromecmd
  system(chromecmd)
  
  # Enter appearence mark: 3 marks
  mark01 = as.numeric(readline(prompt = "Enter appearance marks (3 marks total) --> "))
  
  # Open student's file checking layout, please CHANGE THE FOLDER NAME, if you save submissions in different folder 
  opencmd <- paste("open ","submissions/*",stdId,"*", sep = "")
  system(opencmd)
  
  
  
  # Enter indention mark: 2 marks, only up to the line about Perl, Lua, Groovy.
  mark02 =  as.numeric(readline(prompt = "Enter Indentation marks (2 marks total)--> ")) 
  
  #Enter comment marks: total 2 marks. Give one mark for a comment about fixing the       </strong> tag which should have been <strong> instead. Give one more mark for a comment about closing the div element near the bottom of the page.
  mark04 = as.numeric(readline(prompt = "Enter comment marks (2 marks total) --> "))
  
  ###Use tidy to check errors,please CHANGE THE FOLDER NAME, if you save submissions in different folder 
  tidycmd <- paste("tidy submissions/*", stdId, "*"," >/dev/null" ,sep = "")
  system(tidycmd)
  
  #Enter validation mark: total 3 marks 
  mark03 = as.numeric(readline(prompt = "Enter Validation marks --(3 marks total)> ")) 
  
  
  #Convert total marks based on 1. 
  total = sum(mark01, mark02, mark03, mark04)
  
  # Add the marks into the csv file
  student[3:7] <- c(mark01, mark02, mark03, mark04, total)
  
  
  # Ask if the marker wants to add comments to the stuent
  comments <- readline(prompt = "Any comments for this student?  --> ")
  student[8] <- comments
  mark.df[i,] <- student
  print("Student is been marked, details as follows")
  print(mark.df[i,])
}


##Export your marks to csv file
write.table(mark.df, "/Users/Joy/Documents/UoA/lab02-marks-c-1.csv", row.names = FALSE, sep = ",")

