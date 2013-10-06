getmonitor <- function(id, directory, summarize = FALSE) {
  nameSep <- "/"
  extension <- ".csv"
  if(id < 10) {
    filename <- paste(directory, nameSep,"00", as.character(id), extension, sep="")
  } else if(id < 100) {
    filename <- paste(directory, nameSep,"0", as.character(id), extension, sep="")
  } else {
    filename <- paste(directory, nameSep,as.character(id), extension, sep="")
  }
  
  data <- read.csv(filename, header=TRUE)
  if(summarize == TRUE){  
    print (summary(data))
  } 
  return(data)
  
}