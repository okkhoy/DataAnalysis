outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
outcome[, 11] <- as.numeric(outcome[, 11])

outcome_states <- table(outcome$State)
outcome_state_gt20 <- outcome_states[outcome_states > 20]
states <- names(outcome_state_gt20)

outcome2 <- data.frame()

for(i in 1:length(states)) {
  x<- outcome[grepl(states[i], outcome$State),]
  length(x)
  outcome2<- rbind(outcome2, x)
}

death <- outcome2[, 11]
state<- outcome2$State
boxplot(death ~ state)
