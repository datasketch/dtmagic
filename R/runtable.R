##Setters and Getters

#TODO string, automatic paste '' to de option that need css
#TODO pass to prefix instead list(list) - more friendly interaction
list_opts = list(
  #general options
  general_list = list(language="ES"),
  #header css
  table_list_css_header = list("'color'"="'black'", "'background-color'"="'yellow'"),
  #header events
  list2= list(),
  #colnames style #single pararameter for all
  table_list_css_column = list(columns=c(1,2,3,4,5), fontWeight=10, color = "gray", backgroundColor = "green")
  
)

# list_opts[4]
# ccs_list_column = utils::modifyList(table_list_css_column[1],list_opts[4])

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


#TODO:completer the possible options
# general_list = list(general_list = list("'language'" = "EN") )
table_list_css_header = list(table_list_css_header=
                                list("'color'"= "'white'", 
                                     "'background-color'"="'black'",
                                     "'font-size'"="'50%'"))

table_list_css_column = list(table_list_css_column=
                                list(columns=c(1,2),
                                     color= "black", 
                                     fontWeigh=12,
                                     backgroundColor = "white"))


data_table_ccs_options_string_header= "function(settings, json) {
  $(this.api().table().header()).css({"
data_table_ccs_options_string_end=   "});
}"

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
 
as.vector(ccs_list_column$table_list_css_column$columns)
as.vector()
#data and list options

#' @export
#' 
#
runtable <- function(data, opts,...){
  inner_opt = opts
  df = data 
  #GENERAL OPTIONS
  lenguage_s = set_lenguaje(inner_opt[1]$general_list$language)
  
  
  #HEADER
   ccs_list_header = utils::modifyList(table_list_css_header[1],inner_opt[2])
   string_header= paste_keyvalue(ccs_list_header$table_list_css_header)
   Js_init_string= paste_header_init(data_table_ccs_options_string_header,string_header,data_table_ccs_options_string_end)
  
   
   #Colstyle
   ccs_list_column = utils::modifyList(table_list_css_column[1],inner_opt[4])
   string_column= paste_keyvalue(ccs_list_header$table_list_css_column)
   Js_init_string= paste_header_init(data_table_ccs_options_string_header,string_header,data_table_ccs_options_string_end)
   
   
   #RUN data table
   dt= DT::datatable(df, options = list(language =   list(url=lenguage_s),
     initComplete = DT::JS(Js_init_string)
   )) %>% 
     DT::formatStyle(
       columns = as.vector(ccs_list_column$table_list_css_column$columns),
       fontWeight = ccs_list_column$table_list_css_column$fontWeigh,
       color = ccs_list_column$table_list_css_column$color,
       backgroundColor = ccs_list_column$table_list_css_column$backgroundColor
     )
   
   dt
   
}


runtable(iris,list_opts)
