##Read your student list
student.df <- read.csv("lab01-marks-c-1.csv", header = TRUE, stringsAsFactors = FALSE)
mark.df <- data.frame(matrix(vector(), ncol = 7))
colnames(mark.df) <- names(student.df)

#Get total student number
#std.num<- nrow(student.df)
std.num = 3

#filenames <- paste("immunisation", "ethnicity", i, 6, "months.csv", sep = "-")
##make changes for some student

#Running through each student and enter the marks for them
for (i in 1:std.num){
  student<- student.df[i, ]
  studentname <- student[1]
  stdId <- student[2]
  
  cat("You are now marking ", as.character(studentname))
  
  ###Open student's file checking layout
  opencmd <- paste("open ","submissions/*",stdId,"*", sep = "")
  system(opencmd)
  
  #Enter indention mark: 3 marks, only up to the line about Perl, Lua, Groovy.
  mark01 =  as.numeric(readline(prompt = "Enter Indentation marks --> ")) 
  
  #Enter comment marks: total 2 marks. Give one mark for a comment about fixing the       </strong> tag which should have been <strong> instead. Give one more mark for a comment about closing the div element near the bottom of the page.
  mark03 = as.numeric(readline(prompt = "Enter comment marks --> "))
  
  ###Use tidy to check errors
  tidycmd <- paste("tidy submissions/*", stdId, "*"," >/dev/null" ,sep = "")
  system(tidycmd)
  
  #Enter validation mark: total 3 marks 
  mark02 = as.numeric(readline(prompt = "Enter Validation marks --> ")) 
  
  
  
  #Convert total marks based on 1. 
  total = round(sum(mark01, mark02, mark03) / 8, digits = 2)
  
  #Add the marks into the csv file
  student[3:6] <- c(mark01, mark02, mark03, total)
  #print(student)
  
  ##Ask if the marker wants to add comments to the stuent
  comments <- readline(prompt = "Any comments for this student? --> ")
  student[7] <- comments
  mark.df[i,] <- student
  print("Student is been marked, details as follows")
  print(mark.df[i,])
}

# #############Uncomment this part to edit specific students which you wanna make changes
# changes <- c(22,25,30)
# for (i in changes){
#   student<- student.df[i, ]
#   studentname <- student[1]
#   cat("You are now marking ", as.character(studentname))
#   #Enter indention mark: 3 marks, only up to the line about Perl, Lua, Groovy.
#   mark01 =  as.numeric(readline(prompt = "Enter Indentation marks --> ")) 
#   
#   #Enter validation mark: total 3 marks 
#   mark02 = as.numeric(readline(prompt = "Enter Validation marks --> ")) 
#   
#   #Enter comment marks: total 2 marks. Give one mark for a comment about fixing the       </strong> tag which should have been <strong> instead. Give one more mark for a comment about closing the div element near the bottom of the page.
#   mark03 = as.numeric(readline(prompt = "Enter comment marks --> "))
#   
#   #Convert total marks based on 1. 
#   total = round(sum(mark01, mark02, mark03) / 8, digits = 2)
#   
#   #Add the marks into the csv file
#   student[3:6] <- c(mark01, mark02, mark03, total)
#   #print(student)
#   
#   ##Ask if the marker wants to add comments to the stuent
#   comments <- readline(prompt = "Any comments for this student? --> ")
#   student[7] <- comments
#   mark.df[i,] <- student
#   print("Student is been marked, details as follows")
#   print(mark.df[i,])
# }

##Export your marks to csv file
write.table(mark.df, "/Users/Joy/Documents/UoA/Lab01-marks-c-1.csv", row.names = FALSE, sep = ",")

