outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
outcome[, 11] <- as.numeric(outcome[, 11])

outcome_states <- table(outcome$State)
outcome_state_gt20 <- outcome_states[outcome_states > 20]

outcome2 <- outcome[outcome$State == names(outcome_state_gt20)]
states <- names(outcome_state_gt20)

for(entry in outcome){
  for (i in length(states)) {
    if (entry$State == states[i])
      print (entry$State)
  } 
} 
