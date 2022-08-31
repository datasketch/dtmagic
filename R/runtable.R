
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

#############################################################
###############################################################################
#ADD new language
set_lenguaje <- function(val=character()){
  #TODO get EN by default without loading
  #add list
  leng=NULL
  if(!is.null(val)){
      if(val=="EN"){
      leng ='//cdn.datatables.net/plug-ins/1.12.1/i18n/en-GB.json'
      }
      if(val=="ES"){
        leng = '//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json'
      }
  }
  leng
}  



#ADD DEFAULT PARAMETERS  FOR: GENERAL, TABLE CSS COLUMN, TABLE CSS COLUMN SINGLE
#TODO:completer the possible options
# general_list = list(general_list = list("'language'" = "EN") )
table_list_css_header = list(table_list_css_header=
                                list("'color'"= "'white'", 
                                     "'background-color'"="'black'",
                                     "'font-size'"="'100%'"))

table_list_css_column = list(table_list_css_column=
                                list(columns=c(1,2),
                                     color= "black", 
                                     fontWeight=12,
                                       backgroundColor = "white"))

table_list_css_column_single =list(table_list_css_column_single=
                               list(columns=1,
                                    color= "black", 
                                    fontWeight=12,
                                    backgroundColor = "white"))

data_table_ccs_options_string_header= "function(settings, json) {
  $(this.api().table().header()).css({"

data_table_ccs_options_string_end=   "});
}"


###########################################################
#FUNCTIONS
#list to string / format A:A,B:B 
paste_keyvalue <- function(alist= list()){
  key= names(alist)
  value=sapply(alist, function(x) x[1])
  stringtemp= paste(paste(key,value,sep=":"), collapse=",")  
  stringtemp
}

#PASTE STRING
paste_header_init <- function(parta = character(), partb=character(), partc=character()){
   a=paste(parta, partb, partc)
   a
  }


#FUNCTIONS
#TODO worst duplicate name 
modifyListNested <-function(lt1=list(),lt2=list()){
  lsingle= as.list(utils::modifyList(lt1,lt2))
  lsingle
}

# as.vector(ccs_list_column$table_list_css_column$columns)
# as.vector()
#data and list options


##################################################################
##MAIN FUNCTION

#' Load a dataframe  + list options: general_list +  table_list_css_header + list2 not implemented +  table_list_css_column + table_list_css_column_single
#'  
#' This function loads a dataframe and option list
#'
#' @param data  Dataframe
#' @param list List of list, see the structure examples (nested)
#' @return Datatable 
#' @export
#' @importFrom dplyr %>%
runtable <- function(data, opts=NULL,...){
  inner_opt = opts
  df = data  
  
  #GENERAL OPTIONS
  if(!is.null(inner_opt[1]$general_list$language) & length(inner_opt[1]$general_list)){
    lenguage_s = set_lenguaje(inner_opt[1]$general_list$language)
  } else{lenguage_s  = ""}
  
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
     ccs_list_column_single = lapply(table_list_css_column_single[1],inner_opt[5],FUN=modifyListNested)
   } else{ ccs_list_column_single = table_list_css_column_single[1] } 
  #library(dplyr) 
   #RUN data table
   dt= DT::datatable(df, options = list(language =   list(url=lenguage_s),
     initComplete = DT::JS(Js_init_string)
   )) %>% 
     DT::formatStyle( #CSS style to columns
       columns = as.vector(ccs_list_column$table_list_css_column$columns),
       fontWeight = ccs_list_column$table_list_css_column$fontWeight,
       color = ccs_list_column$table_list_css_column$color,
       backgroundColor = ccs_list_column$table_list_css_column$backgroundColor
     )
  dt 
  #ADD single stylecolumns - TODO only do if oprs is !=NULL
   if(!is.null(inner_opt[5]) & length(inner_opt[5]$table_list_css_column_single) & class(inner_opt[5]$table_list_css_column_single)=="list"){
       for(i in 1:lengths(inner_opt[5])){
         dt = dt %>%
           DT::formatStyle(#TODO fix double nested
             columns =  as.vector(ccs_list_column_single$table_list_css_column_single$table_list_css_column_single[[i]]$columns),
             fontWeight =ccs_list_column_single$table_list_css_column_single$table_list_css_column_single[[i]]$fontWeight,
             color = ccs_list_column_single$table_list_css_column_single$table_list_css_column_single[[i]]$color,
             backgroundColor = ccs_list_column_single$table_list_css_column_single$table_list_css_column_single[[i]]$backgroundColor
           )
       }
   }
dt   
   
}


# runtable(iris,list_opts)
