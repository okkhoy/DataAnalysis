complete <- function(directory, id = 1:332) {
  
  nameSep <- "/"
  extension <- ".csv"
  
  df <- data.frame(id=numeric(0), nobs=numeric(0))
  
  for(i in id) {
    
    if(i < 10) {
      filename <- paste(directory, nameSep,"00", as.character(i), extension, sep="")
    } else if(i < 100) {
      filename <- paste(directory, nameSep,"0", as.character(i), extension, sep="")
    } else {
      filename <- paste(directory, nameSep,as.character(i), extension, sep="")
    }
    
    data <- read.csv(filename, header=TRUE)
    ntrue <- length(which(complete.cases(data)))
    tempDf<- data.frame(id=i, nobs=ntrue)
    df<- rbind(df,tempDf)
    rm(tempDf)
  }
  
  return(df)
}