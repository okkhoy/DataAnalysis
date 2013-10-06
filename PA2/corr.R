corr <- function(directory, threshold = 0) {
  nameSep <- "/"
  extension <- ".csv"
  
  correlation <- numeric(0)
  
  filesList <- list.files(directory, pattern = "*.csv", full.names=TRUE)
  
  for(fl in filesList) {
    data <- read.csv(fl, header=TRUE)
    ntrue <- length(which(complete.cases(data)))
    if(ntrue > threshold) {
      data <- data[complete.cases(data),]
      crln <- cor(data$sulfate,data$nitrate)      
      correlation <- append(correlation, crln)
      rm(crln)
    }    
  }
  return(correlation)
}