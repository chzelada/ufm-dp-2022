library(dplyr)
library(rpart)
library(plumber)

#* @apiTitle Survival Prediction
#* @apiDescription Survival prediction for titanic Data

ath_db<-
data_frame(user="chzelada",pass="hola123")

fit <- readRDS("final_model.rds")

#' Log some information about the incoming request
#' @param User
#' @filter logger
function(req,User){
     cat(as.character(Sys.time()), "-", 
         req$REQUEST_METHOD, req$PATH_INFO, "-", 
         req$HTTP_USER_AGENT, "@", req$REMOTE_ADDR,' ',User, "\n")
     plumber::forward()
}


#' Log some information about the incoming request
#' @param User
#' @param Password
#' @filter Auth
function(req,res,User,Password){
     if(sum(User %in% ath_db$user)==1){
          password<-ath_db %>% filter(user == User) %>% pull(pass)
          if(Password==password){
               plumber::forward()
          } else {
               res$status <- 401 # Unauthorized
               return(list(error="incorrect Password"))
          }
     } else {
          res$status <- 401 # Unauthorized
          return(list(error="User doesnt exit"))   
     }
     
}


#' @param Pclass Class that the passenger was on
#' @param Sex Passenger gender 
#' @param Age Passenger age
#' @param SibSp Passenger siblings
#' @param Parch Passenger relatives
#' @param Fare Passenger ticket price
#' @param Embarked Port where the passenger embarked
#' @post /titanic
function(Pclass, Sex, Age, SibSp, Parch, Fare, Embarked){
  features <- data_frame(Pclass=as.integer(Pclass),
                         Sex,
                         Age=as.numeric(Age),
                         SibSp=as.integer(SibSp), 
                         Parch=as.integer(Parch), 
                         Fare=as.numeric(Fare), 
                         Embarked)
  out<-predict(fit, features, type = "class")
  as.character(out)
}


#' @post /echo
function(){
     print('Hola')
}


