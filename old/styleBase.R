#FIRTS version 
#Design without inversion of dependency
#devtools::install_github("rappster/R6", ref = "feat_interface", force=TRUE)
#don't use library method
library(R6)

Ibehavior<- R6Class("Ibehavior",
                public = list(options =list() ,
                              callbacks= list() )
)


PartTableClass <- R6Class("PartTableClass",
                     
              public = list(back_color=NULL, set_color = function(color_p) back_color=colorP,
                                   renderDT= function(...) stop("I'm the abstract method"))
)


DTHeader <- R6Class("DTheader", implement = Ibehavior, inherit =  PartTableClass,
               public = list(options=list(
                 initComplete = DT::JS("
                                function(settings, json) {
                                  $(this.api().table().header()).css({
                                    'background-color': '#000',
                                    'color': '#fff'
                                  });
                                }")
               )   )                            
)

#DTHeader$new()
#DTHeader$public_fields$options
#Basic example using inherits, injection dependence and 
#don't use library method
library(DT)
tabm <- R6Class("DTheader", 
                public= list(header=DTHeader$new(), 
                             colnames=NULL,
                             rownames=NULL,
                             lenguaje=NULL,
                      renderDT= function(...)
                      {  DT::datatable(iris, options = DTHeader$public_fields$options)
                      }
                             ))

dttemp=tabm$new()
dttemp$renderDT(iris)
