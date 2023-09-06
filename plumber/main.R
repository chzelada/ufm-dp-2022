library(plumber)
r <- plumb("test1.R")
r$run(port=8001)

