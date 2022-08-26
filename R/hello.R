#' hello show name 
#'@param name  A string
#'@return  the paste hello and name
#'@examples
#'hello("Xochilt")


hello <- function(name){
  message <- paste0("Hello ", name, "!")
  
  return(message)
}