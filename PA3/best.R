best <- function(state, outcome) {
  
  outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  states <- table(outcomes$State)
  names(states)
  causes <- c("heart attack", "heart failure", "pneumonia")
  #cause_Index <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
  
  #11, 17, 23
  if(!(state %in% names(states))) 
    stop('invalid state') 
  
  if(!(outcome %in% causes)) 
    stop('invalid outcome')
  
  if(outcome == "heart attack") {causeIndex <- 11}
  if(outcome == "heart failure") {causeIndex <- 17}
  if(outcome == "pneumonia") {causeIndex <- 23}
  
  x<- outcomes[grepl(state, outcomes$State),]
  y<-x
  outcomes <- x
  #hospName <- which(names(outcomes) == "Hospital.Name")
  hospName <- 2
  ailment <- outcomes[ , c(hospName, causeIndex)]
  ailment[,2] <-suppressWarnings(as.numeric(ailment[,2]))
  
  ailment <- ailment[complete.cases(ailment),]
  minimum <- max(ailment[,1])
  hospName <- character(0)
  
  for(i in 1:nrow(ailment)) {
    
    if(ailment[i,2] <= minimum) {
      minimum <- ailment[i,2] 
      hospName <- ailment[i,1]  
    }
  }
  
  return(hospName)
}