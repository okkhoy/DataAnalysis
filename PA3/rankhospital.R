rankhospital <- function(state, outcome, num = "best") {
  
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
  hospName <- 2
  
  
  ailment <- outcomes[ , c(hospName, causeIndex)]
  ailment[,2] <-suppressWarnings(as.numeric(ailment[,2]))
  
  ailment <- ailment[complete.cases(ailment),]
  minimum <- max(ailment[,2])
  hospName <- character(0)
  
  ordered_ailment <- ailment[order(ailment[,2],rev(ailment[,1]), decreasing =FALSE),]
  
  if(num == "best") {
    return (ordered_ailment[1,1])
  } else if (num == "worst") {
    return (ordered_ailment[nrow(ordered_ailment),1])
  } else {
    return (ordered_ailment[num, 1])
    #ordered_ailment[, "Rank"] <- c(1:nrow(ordered_ailment))
  }
  
  return(NA)
}