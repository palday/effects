# 2014-12-11 Effects plots for ordinal and ordinal mixed models from the 'ordinal' package
# 2014-12-11 effect.clm built from effect.mer as modified 2014-12-07,  by S. Weisberg

clm2.to.polr <- function(mod) {
  if(!require(MASS)) stop("The MASS package is needed for this function")
  cl <- mod$call 
  present <- match(c("scale", "nominal", "link", "threshold"), names(cl), 0L)
  if(any(present != 0)) {
    if(present[3] != 0){if(cl$link != "logistic") stop("'link' must be 'logisitic' for use with effects")}
    if(present[4] != 0){if(cl$threshold != "flexible") stop("'threshold' must be 'flexible' for use with effects")}
    if(present[1] != 0){if(!is.null(cl$scale)) stop("'scale' must be NULL for use with effects")}
    if(present[2] != 0){if(!is.null(cl$nominal)) stop("'nominal' must be NULL for use with effects")}
  }
  if(is.null(mod$Hessian)){
    message("\nRe-fitting to get Hessian\n")
    mod <- update(mod, Hess=TRUE)
  }
  cl$formula <- cl$location
  cl$method <- cl$link
  m <- match(c("formula", "data", "subset","weights", 
               "na.action",  "contrasts", "method"), names(cl), 0L)
  cl <- cl[c(1L, m)]
  cl$start <- c(mod$beta, mod$Theta)
  cl[[1L]] <- as.name("polr")
  mod2 <- eval(cl)
  mod2$coefficients <- mod$beta
# get vcov
  numTheta <- length(mod$Theta)
  numBeta <- length(mod$beta)
  or <- c( (numTheta+1):(numTheta + numBeta), 1:(numTheta))
  mod2$vcov <- as.matrix(vcov(mod)[or, or])
  class(mod2) <- c("fakeclm2", class(mod2))
  mod2
}
                                              
#method for 'fakeglm' objects. Do not export   
vcov.fakeclm2 <- function(object, ...) object$vcov

#The next thre functions should be exported

effect.clm2 <- function(term, mod, ...) {
    effect(term, clm2.to.polr(mod))
    }
    
allEffects.clm2 <- function(mod, ...){ 
    allEffects(clm2.to.polr(mod), ...)
}

Effect.clm2 <- function(focal.predictors, mod, ...){
  Effect(focal.predictors, clm2.to.polr(mod))
}



   
