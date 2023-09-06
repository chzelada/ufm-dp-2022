
library(plumber)

#* @apiTitle Tutorial Plumber
#* @apiDescription En este enpoint tenemos los tres ejemplos de como utilizar Plumber para crear Apis

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg=""){
  list(msg = paste0("The message is: '", msg, "'"))
}

#curl "http://127.0.0.1:8001/echo
#curl "http://127.0.0.1:8001/echo?msg=hola_mundo"

#* Plot a histogram
#* @png
#* @get /plot
function(){
  rand <- rnorm(100)
  hist(rand)
}

# http://127.0.0.1:8001/__swagger__/

#' Return the sum of two numbers
#' @param a The first number to add
#' @param b The second number to add
#' @post /sum
function(a, b){
  as.numeric(a) + as.numeric(b)
}

#curl --data "a=4&b=3" "http://127.0.0.1:8001/sum"
#curl --data '{"a":4, "b":5}' "http://127.0.0.1:8001/sum
