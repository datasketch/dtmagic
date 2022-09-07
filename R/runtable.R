
#TODO In this version it is necessary to use the lists even if they are empty, 
#because the number (position) of the list within the main list is taken into account

#TODO string, automatic paste '' to de option that need css
#TODO pass to prefix instead list(list) - more friendly interaction
#TODO the order list's is important
#TODO improve nested 
#TODO add try catch

# 
# list_opts = list(
#   #general options
#   general_list = list(language="ES"), #EN and ES
#   #header css
#   table_list_css_header = list("'color'"="'black'", "'background-color'"="'yellow'"), #color,back,
#   #header events
#   list2= list(),
#   #colnames style #single pararameter for all
#   table_list_css_column= list(columns=c(1,2,3,4,5),  currency = "$", fontWeight=10, color = "gray", backgroundColor = "green"),
#   table_list_css_column_single = list(
#                             list(columns=c(1), fontWeight=10, color = "yellow", backgroundColor = "green"),
#                             list(columns=c(2), fontWeight=10, color = "black", backgroundColor = "green"))
#   
# )




##################################################################
##MAIN FUNCTION

#' Load a dataframe  + list options: general_list +  table_list_css_header + list2 not implemented +  table_list_css_column + table_list_css_column_single
#'  
#' This function loads a dataframe and option list
#'
#' @param data  Dataframe
#' @param opts List of list, see the structure examples (nested)
#' @return Datatable 
#' @export
#' @importFrom dplyr %>%
runtable <- function(data, opts=NULL,...){
  inner_opt = mapper(opts)
  df = data  
  # class((inner_opt[1]$general_list$selection))
  #select columns, TODO generate alert
  if(!is.null(inner_opt[1]$general_list$selection)){
    try({
      df = df %>% select(unlist(inner_opt[1]$general_list$selection))
      }, silent=TRUE
    )
  }
  
  
  #GENERAL OPTIONS
  if(!is.null(inner_opt[1]$general_list$language) & length(inner_opt[1]$general_list)){
    lenguage_s = set_lenguaje(inner_opt[1]$general_list$language)
  } else{lenguage_s  = ""}
  
   if(!is.null(inner_opt[1]$general_list) & length(inner_opt[1]$general_list)){
    general_list = utils::modifyList(general_list[1],inner_opt[1])
  } else{general_list = general_list[1]}
  
   #HEADER
   if(!is.null(inner_opt[2]) & length(inner_opt[2]$table_list_css_header)  & class(inner_opt[2]$table_list_css_header)=="list"){
        ccs_list_header = utils::modifyList(table_list_css_header[1],inner_opt[2])
    
   }else{ccs_list_header=table_list_css_header[1]}

   string_header= paste_keyvalue(ccs_list_header$table_list_css_header)
   Js_init_string= paste_header_init(data_table_ccs_options_string_header,string_header,data_table_ccs_options_string_end)
  
   
   #Colstyle - ALL
   if(!is.null(inner_opt[4]) & length(inner_opt[4]$table_list_css_column) & class(inner_opt[4]$table_list_css_column)=="list" ){
     ccs_list_column = utils::modifyList(table_list_css_column[1],inner_opt[4])
   } else{ ccs_list_column = table_list_css_column[1] }
   
     #Colstyle - Single
   if(!is.null(inner_opt[5]) & length(inner_opt[5]$table_list_css_column_single) &  class(inner_opt[5]$table_list_css_column_single)=="list" ){
     # names(inner_opt[5]) = seq(1:length(inner_opt[5]))
     ccs_list_column_single =  modifyListNested(table_list_css_column_single[1],inner_opt[5])#lapply(table_list_css_column_single[1],inner_opt[5],FUN=modifyListNested)
   } else{ ccs_list_column_single = table_list_css_column_single[1] } 
  #library(dplyr) 
   #RUN data table
     dt = DT::datatable(df, filter=general_list$general_list$filter,width = general_list$general_list$width,height= general_list$general_list$height, 
                       options = list(language =   list(url=lenguage_s), ordering=general_list$general_list$ordering, 
                                      searching=general_list$general_list$searching,
     initComplete = DT::JS(Js_init_string)
   )) %>% 
     DT::formatStyle( #CSS style to columns
       columns = as.vector(ccs_list_column$table_list_css_column$columns),
       fontWeight = ccs_list_column$table_list_css_column$fontWeight,
       color = ccs_list_column$table_list_css_column$color,
       backgroundColor = ccs_list_column$table_list_css_column$backgroundColor
     )   %>% DT::formatString(columns =as.vector(ccs_list_column$table_list_css_column$columns),
                          prefix = ccs_list_column$table_list_css_column$prefix,
                          suffix =ccs_list_column$table_list_css_column$suffix)
   
      #dt
     #ADD single stylecolumns - TODO only do if oprs is !=NULL
   if(!is.null(inner_opt[5]) & length(inner_opt[5]$table_list_css_column_single) & class(inner_opt[5]$table_list_css_column_single)=="list"){
       for(i in 1:lengths(inner_opt[5])){
         print(i)
         dt = dt %>%
           DT::formatStyle(#TODO fixed ouble nested
             columns =  as.vector(ccs_list_column_single[[i]]$columns),
             fontWeight =ccs_list_column_single[[i]]$fontWeight,
             color = ccs_list_column_single[[i]]$color,
             backgroundColor = ccs_list_column_single[[i]]$backgroundColor
           )  %>% 
           DT::formatString(columns =as.vector(ccs_list_column_single[[i]]$columns),
                          prefix = ccs_list_column_single[[i]]$prefix,
                          suffix =ccs_list_column_single[[i]]$suffix)
          
       } 
   }
dt   
   
}


# runtable(iris,list_opts)
