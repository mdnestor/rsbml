setClass("TextGlyph", representation(graphicalObject = "character", text = "character",
  originOfText = "character"), contains = "GraphicalObject")

setMethod("describe", "TextGlyph",
          function(object) {
            if (length(originOfText(object)))
              desc <- paste("name(", originOfText(object), ")", sep = "")
            else desc <- paste("\"", text(object), "\"", sep = "")
            if (length(graphicalObject(object)))
              desc <- paste(desc, "on", graphicalObject(object))
            paste(desc, callNextMethod(object))
        })
          
 setGeneric("graphicalObject", function(object) standardGeneric("graphicalObject"))
setMethod("graphicalObject", "TextGlyph", function(object) object@graphicalObject)


 setGeneric("text", function(x, ...) standardGeneric("text"))
setMethod("text", "TextGlyph", function(x, ...) x@text)

 setGeneric("originOfText", function(object) standardGeneric("originOfText"))
setMethod("originOfText", "TextGlyph", function(object) object@originOfText)

 setGeneric("graphicalObject<-", function(object, value) standardGeneric("graphicalObject<-"))
setReplaceMethod("graphicalObject", "TextGlyph", function(object, value) {
  object@graphicalObject <- value
  object
})

 setGeneric("text<-", function(object, value) standardGeneric("text<-"))
setReplaceMethod("text", "TextGlyph", function(object, value) {
  object@text <- value
  object
})

 setGeneric("originOfText<-", function(object, value) standardGeneric("originOfText<-"))
setReplaceMethod("originOfText", "TextGlyph", function(object, value) {
  object@originOfText <- value
  object
})

