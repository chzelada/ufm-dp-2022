#https://github.com/trestletech/plumber
#install.packages("plumber")
library(plumber)

#' @apiTitle Tutorial Plumber
#' @apiDescription En este endpoint tenemos los 
#' tres ejemplos de como utilizar Plumber para 
#' crear Apis


#' Echo back the input
#' @param msg The message to echo
#' @get /echo
function(msg=""){
  list(msg = paste0("The message is: '", msg, "'"))
}

#curl "http://127.0.0.1:8001/echo
