setClassUnion("OptionalKineticLaw", c("KineticLaw", "NULL"))
setClass("Reaction",
         representation(id = "character", name = "character", 
                        reactants = "list", products = "list",
                        modifiers = "list", kineticLaw = "OptionalKineticLaw", 
                        reversible = "logical", fast = "logical"),
         contains = "SBase")

setMethod("describe", "Reaction",
          function(object) {
            r <- paste(describe(reactants(object)), collapse = " + ")
            p <- paste(describe(products(object)), collapse = " + ")
            rev <- reversible(object)
            if (!length(rev))
              rev <- FALSE
            fast <- fast(object)
            if (!length(fast))
              fast <- FALSE
            op <- ifelse(rev, "<->", ifelse(fast, "->>", "->"))
            desc <- paste(r, op, p)
            if (!is.null(kineticLaw(object)))
              desc <- paste(desc, "by", describe(kineticLaw(object)))
            desc
          })

setMethod("id", "Reaction", function(object) object@id)

 
setMethod("name", "Reaction", function(object) object@name)

 setGeneric("reactants", function(object) standardGeneric("reactants"))
setMethod("reactants", "Reaction", function(object) object@reactants)

 setGeneric("products", function(object) standardGeneric("products"))
setMethod("products", "Reaction", function(object) object@products)

 setGeneric("modifiers", function(object) standardGeneric("modifiers"))
setMethod("modifiers", "Reaction", function(object) object@modifiers)

 setGeneric("kineticLaw", function(object) standardGeneric("kineticLaw"))
setMethod("kineticLaw", "Reaction", function(object) object@kineticLaw)

 setGeneric("reversible", function(object) standardGeneric("reversible"))
setMethod("reversible", "Reaction", function(object) object@reversible)

 setGeneric("fast", function(object) standardGeneric("fast"))
setMethod("fast", "Reaction", function(object) object@fast)

 
setReplaceMethod("id", "Reaction", function(object, value) {
  object@id <- value
  object
})

 
setReplaceMethod("name", "Reaction", function(object, value) {
  object@name <- value
  object
})

 setGeneric("reactants<-", function(object, value) standardGeneric("reactants<-"))
setReplaceMethod("reactants", "Reaction", function(object, value) {
  if (!all(sapply(value, inherits, "SpeciesReference")))
    stop("All reactants must be SpeciesReference objects")
  names(value) <- sapply(value, id)
  object@reactants <- value
  object
})

 setGeneric("products<-", function(object, value) standardGeneric("products<-"))
setReplaceMethod("products", "Reaction", function(object, value) {
  if (!all(sapply(value, inherits, "SpeciesReference")))
    stop("All products must be SpeciesReference objects")
  names(value) <- sapply(value, id)
  object@products <- value
  object
})

 setGeneric("modifiers<-", function(object, value) standardGeneric("modifiers<-"))
setReplaceMethod("modifiers", "Reaction", function(object, value) {
  if (!all(sapply(value, inherits, "ModifierSpeciesReference")))
    stop("All modifiers must be ModifierSpeciesReference objects")
  names(value) <- sapply(value, id)
  object@modifiers <- value
  object
})

 setGeneric("kineticLaw<-", function(object, value) standardGeneric("kineticLaw<-"))
setReplaceMethod("kineticLaw", "Reaction", function(object, value) {
  if (is.null(value))
    new("Reaction", notes = notes(object), annotation = annotation(object),
      metaId = metaId(object), modifiers = modifiers(object), products = products(object),
      reactants = reactants(object), id = id(object), name = name(object), 
      fast = fast(object), reversible = reversible(object))
  else {
    object@kineticLaw <- value
    object
  }
})

 setGeneric("reversible<-", function(object, value) standardGeneric("reversible<-"))
setReplaceMethod("reversible", "Reaction", function(object, value) {
  object@reversible <- value
  object
})

 setGeneric("fast<-", function(object, value) standardGeneric("fast<-"))
setReplaceMethod("fast", "Reaction", function(object, value) {
  object@fast <- value
  object
})

