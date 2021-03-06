setClass("Unit", representation(kind = "character", exponent = "integer", 
  unitScale = "integer", multiplier = "numeric", offset = "numeric"), 
  contains = "SBase")

setMethod("describe", "Unit",
          function(object) {
            desc <- ""
            if (length(multiplier(object)) && multiplier(object) != 1)
              desc <- paste(desc, multiplier(object), "*", sep = "")
            if (length(unitScale(object)) && unitScale(object) != 0)
              desc <- paste(desc, "10^", unitScale(object), "*", sep = "")
            desc <- paste(desc, kind(object), sep = "")
            if (length(exponent(object)) && exponent(object) != 1)
              desc <- paste("(", desc, ")^", exponent(object), sep = "")
            desc
          })

 setGeneric("kind", function(object) standardGeneric("kind"))
setMethod("kind", "Unit", function(object) object@kind)

 setGeneric("exponent", function(object) standardGeneric("exponent"))
setMethod("exponent", "Unit", function(object) object@exponent)

 setGeneric("unitScale", function(object) standardGeneric("unitScale"))
setMethod("unitScale", "Unit", function(object) object@unitScale)

 setGeneric("multiplier", function(object) standardGeneric("multiplier"))
setMethod("multiplier", "Unit", function(object) object@multiplier)

 setGeneric("offset", function(object) standardGeneric("offset"))
setMethod("offset", "Unit", function(object) object@offset)

.unitKinds <- c("ampere", "farad", "joule", "lux",	"radian", "volt", "becquerel",
  "gram",	"katal", "metre", "second", "watt", "candela", "gray", "	kelvin", "mole",
  "siemens", "weber", "Celsius", "henry", "kilogram", "newton", "sievert", 	
  "coulomb", 	"hertz", "litre", "ohm", "steradian", "dimensionless", "item", 
  "lumen", "pascal", "tesla")
 	
 setGeneric("kind<-", function(object, value) standardGeneric("kind<-"))
setReplaceMethod("kind", "Unit", function(object, value) {
  if (!(value %in% .unitKinds))
    stop("Invalid unit kind ", value, ". Unit kind must be one of ", .unitKinds)
  object@kind <- value
  object
})

 setGeneric("exponent<-", function(object, value) standardGeneric("exponent<-"))
setReplaceMethod("exponent", "Unit", function(object, value) {
  object@exponent <- as.integer(value)
  object
})

 setGeneric("unitScale<-", function(object, value) standardGeneric("unitScale<-"))
setReplaceMethod("unitScale", "Unit", function(object, value) {
  object@unitScale <- as.integer(value)
  object
})

 setGeneric("multiplier<-", function(object, value) standardGeneric("multiplier<-"))
setReplaceMethod("multiplier", "Unit", function(object, value) {
  object@multiplier <- value
  object
})

 setGeneric("offset<-", function(object, value) standardGeneric("offset<-"))
setReplaceMethod("offset", "Unit", function(object, value) {
  object@offset <- value
  object
})

