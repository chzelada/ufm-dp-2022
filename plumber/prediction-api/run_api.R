library(plumber)

mydrop <- plumber::do_provision(region='lon1')
analogsea::droplets()

r <- plumb("prediction_api.R")
r$run(port=8001)
