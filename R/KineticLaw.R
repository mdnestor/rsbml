setClass("KineticLaw", representation(math = "expression", parameters = "list", 
  timeUnits = "character", substanceUnits = "character"), 
  contains = "SBase")

setMethod("describe", "KineticLaw",
          function(object) {
            desc <- as.character(math(object))
            paramDescs <- paste(sapply(parameters(object), describe),
                                collapse = ", ")
            if (nchar(paramDescs))
              desc <- paste(desc, "where", paramDescs)
            desc
          })

setMethod("math", "KineticLaw", function(object) object@math)

 setGeneric("parameters", function(object) standardGeneric("parameters"))
setMethod("parameters", "KineticLaw", function(object) object@parameters)

setMethod("timeUnits", "KineticLaw", function(object) object@timeUnits)

 setGeneric("substanceUnits", function(object) standardGeneric("substanceUnits"))
setMethod("substanceUnits", "KineticLaw", function(object) object@substanceUnits)

setReplaceMethod("math", "KineticLaw", function(object, value) {
  object@math <- asMath(value)
  object
})

 setGeneric("parameters<-", function(object, value) standardGeneric("parameters<-"))
setReplaceMethod("parameters", "KineticLaw", function(object, value) {
  if (!all(sapply(value, inherits, "Parameter")))
    stop("All parameters must be Parameter objects")
  names(value) <- sapply(value, id)
  object@parameters <- value
  object
})

setReplaceMethod("timeUnits", "KineticLaw", function(object, value) {
  object@timeUnits <- value
  object
})

 setGeneric("substanceUnits<-", function(object, value) standardGeneric("substanceUnits<-"))
setReplaceMethod("substanceUnits", "KineticLaw", function(object, value) {
  object@substanceUnits <- value
  object
})

