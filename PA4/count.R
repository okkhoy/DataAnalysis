count <- function(cause = NULL) {
  homicides <- readLines("homicides.txt")
  
  causes <- c("asphyxiation", "blunt force", "other", "shooting", "stabbing", "unknown")
  
  
  if(is.null(cause) || nchar(cause) == 0) 
    stop('cause cannot be NULL') 
  
  if(!(cause %in% causes))
    stop('invalid cause')
  
  count <- grep( (paste("cause:", cause, sep=" ")), homicides, value=FALSE, ignore.case = TRUE)
                 
  return(length(count))
}

