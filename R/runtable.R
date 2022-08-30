##Setters and Getters

#TODO string, automatic paste '' to de option that need css
#TODO pass to prefix instead list(list)
list_opts = list(
  #general options
  general_list = list(language = "EN"),
  #header css
  table_list_css_default = list("'color'"="'black'", "'background-color'"="'yellow'"),
  #header events
  list2= list(),
  #colnames style
  list3 = list()
  
)




#TODO:completer the posssible options
# general_list = list(general_list = list("'language'" = "EN") )

table_list_css_default = list(table_list_css_default=list("'color'"= "'white'", "'background-color'"="'black'","'font-size'"="'50%'"))
data_table_ccs_options_string_header= "function(settings, json) {
  $(this.api().table().header()).css({"
data_table_ccs_options_string_end=   "});
}"
  

set_lenguaje <- function(val=character()){
  #TODO get EN by default without loading
  leng ='//cdn.datatables.net/plug-ins/1.12.1/i18n/en-GB.json'
  if(val=="ES"){
   leng = '//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json'
  }
  leng
}  
 
paste_keyvalue <- function(alist= list()){
  # paste(key,value,sep=":")
  key= names(alist)
  value=sapply(alist, function(x) x[1])
  stringtemp= paste(paste(key,value,sep=":"), collapse=",")  
  stringtemp
}

paste_header_init <- function(parta = character(), partb=character(), partc=character()){
   a=paste(parta, partb, partc)
   a
  }
 
#data and list options

#' @export
#' 
#
runtable <- function(data, opts,...){
  inner_opt = opts
  df = data 
  #HEADER
   ccs_list_header = utils::modifyList(table_list_css_default[1],inner_opt[2])
   string_header= paste_keyvalue(ccs_list_header$table_list_css_default)
   Js_init_string= paste_header_init(data_table_ccs_options_string_header,string_header,data_table_ccs_options_string_end)
   lenguage_s = set_lenguaje(inner_opt[1]$general_list$language)
   
   #RUN data table
   dt= DT::datatable(df, options = list(language =   list(url=lenguage_s),
     initComplete = DT::JS(Js_init_string)
   ))
   
   dt
   
}

runtable(iris,list_opts)
