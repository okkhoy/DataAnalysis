rankall <- function(outcome, num = "best") {
  
  outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  states <- table(outcomes$State)
  states <- names(states)
  causes <- c("heart attack", "heart failure", "pneumonia")
  #cause_Index <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
  
  #11, 17, 23
  #if(!(state %in% names(states))) 
  #  stop('invalid state') 
  
  if(!(outcome %in% causes)) 
    stop('invalid outcome')
  
  if(outcome == "heart attack") {causeIndex <- 11}
  if(outcome == "heart failure") {causeIndex <- 17}
  if(outcome == "pneumonia") {causeIndex <- 23}
  
  hospName <- 2
  stateIdx <- 7
  returnHospital <- data.frame(hospital = character(0), state= character(0))
  
  for(i in 1:length(states)) {
    x<- outcomes[grepl(states[i], outcomes$State),]  
    
    ailment <- x[ , c(hospName, causeIndex, stateIdx)]
    ailment[,2] <-suppressWarnings(as.numeric(ailment[,2]))
    ailment <- ailment[complete.cases(ailment),]
    ailment <- ailment[order(ailment[,2],rev(ailment[,1])),]
    
    if(num == "best") {
      tempdf <- data.frame(hospital=ailment[1,1], state = states[i])
    } else if (num == "worst") {
      tempdf <- data.frame(hospital=ailment[nrow(ailment),1], state = states[i])
    } else {
      tempdf <- data.frame(hospital=ailment[num,1], state = states[i])
    }
    returnHospital <- rbind(returnHospital, tempdf)
  }
  
  return(returnHospital)
}