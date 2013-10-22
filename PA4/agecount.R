agecount <- function(age = NULL) {
  homicides <- readLines("homicides.txt")
  
  causes <- c("asphyxiation", "blunt force", "other", "shooting", "stabbing", "unknown")
  
  
  if(is.null(age) || nchar(age) == 0) 
    stop('cause cannot be NULL') 
  
  if(as.numeric(age) < 0)
    stop('invalid age')
  
  count <- grep( (paste("", age, "year")), homicides, value=FALSE, ignore.case = TRUE)
  
  return(length(count))
}
