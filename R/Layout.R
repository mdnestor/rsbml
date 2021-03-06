setClass("Layout", representation(id = "character", dimensions = "Dimensions", 
  compartmentGlyphs = "list", speciesGlyphs = "list", reactionGlyphs = "list", 
  textGlyphs = "list", additionalGraphicalObjects = "list"), contains = "SBase")

setMethod("describe", "Layout",
          function(object) {
            max <- 4
            descs <- paste("Layout", id(object), "in",
                           describe(dimensions(object)))
            if (length(compartmentGlyphs(object)))
              descs <- c(descs, "", "Compartment glyphs:",
                         describe(compartmentGlyphs(object), max))
            if (length(speciesGlyphs(object)))
              descs <- c(descs, "", "Species glyphs:",
                         describe(speciesGlyphs(object), max))
            if (length(reactionGlyphs(object)))
              descs <- c(descs, "", "Reaction glyphs:",
                         describe(reactionGlyphs(object), max))
            if (length(textGlyphs(object)))
              descs <- c(descs, "", "Text glyphs:",
                         describe(textGlyphs(object), max))
            if (length(additionalGraphicalObjects(object)))
              descs <- c(descs, "", "Other:",
                         describe(additionalGraphicalObjects(object), max))
            descs
          })

setMethod("id", "Layout", function(object) object@id)

setMethod("dimensions", "Layout", function(object) object@dimensions)

 setGeneric("compartmentGlyphs", function(object) standardGeneric("compartmentGlyphs"))
setMethod("compartmentGlyphs", "Layout", function(object) object@compartmentGlyphs)

 setGeneric("speciesGlyphs", function(object) standardGeneric("speciesGlyphs"))
setMethod("speciesGlyphs", "Layout", function(object) object@speciesGlyphs)

 setGeneric("reactionGlyphs", function(object) standardGeneric("reactionGlyphs"))
setMethod("reactionGlyphs", "Layout", function(object) object@reactionGlyphs)

 setGeneric("textGlyphs", function(object) standardGeneric("textGlyphs"))
setMethod("textGlyphs", "Layout", function(object) object@textGlyphs)

 setGeneric("additionalGraphicalObjects", function(object) standardGeneric("additionalGraphicalObjects"))
setMethod("additionalGraphicalObjects", "Layout", function(object) object@additionalGraphicalObjects)

setReplaceMethod("id", "Layout", function(object, value) {
  object@id <- value
  object
})

setReplaceMethod("dimensions", "Layout", function(object, value) {
  object@dimensions <- value
  object
})

 setGeneric("compartmentGlyphs<-", function(object, value) standardGeneric("compartmentGlyphs<-"))
setReplaceMethod("compartmentGlyphs", "Layout", function(object, value) {
  if (!all(sapply(value, inherits, "CompartmentGlyph")))
    stop("All compartment glyphs must be CompartmentGlyph objects")
  names(value) <- sapply(value, id)
  object@compartmentGlyphs <- value
  object
})

 setGeneric("speciesGlyphs<-", function(object, value) standardGeneric("speciesGlyphs<-"))
setReplaceMethod("speciesGlyphs", "Layout", function(object, value) {
  if (!all(sapply(value, inherits, "SpeciesGlyph")))
    stop("All species glyphs must be SpeciesGlyph objects")
  names(value) <- sapply(value, id)
  object@speciesGlyphs <- value
  object
})

 setGeneric("reactionGlyphs<-", function(object, value) standardGeneric("reactionGlyphs<-"))
setReplaceMethod("reactionGlyphs", "Layout", function(object, value) {
  if (!all(sapply(value, inherits, "ReactionGlyph")))
    stop("All reaction glyphs must be ReactionGlyph objects")
  names(value) <- sapply(value, id)
  object@reactionGlyphs <- value
  object
})

 setGeneric("textGlyphs<-", function(object, value) standardGeneric("textGlyphs<-"))
setReplaceMethod("textGlyphs", "Layout", function(object, value) {
  if (!all(sapply(value, inherits, "TextGlyph")))
    stop("All text glyphs must be TextGlyph objects")
  names(value) <- sapply(value, id)
  object@textGlyphs <- value
  object
})

 setGeneric("additionalGraphicalObjects<-", function(object, value) standardGeneric("additionalGraphicalObjects<-"))
setReplaceMethod("additionalGraphicalObjects", "Layout", function(object, value) {
  if (!all(sapply(value, inherits, "GraphicalObject")))
    stop("All additional graphical objects must be GraphicalObject objects")
  names(value) <- sapply(value, id)
  object@additionalGraphicalObjects <- value
  object
})

