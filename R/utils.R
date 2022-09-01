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
                                    fontWeight="normal",
                                    backgroundColor = "white",
                                    prefix="",
                                    suffix=""))

table_list_css_column_single =list(table_list_css_column_single=
                                     list(columns=1,
                                          color= "black", 
                                          fontWeight="normal",
                                          backgroundColor = "white",
                                          prefix="",
                                          suffix=""))

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
#TODO  fixed nested #only works for col single style
modifyListNested <-function(lt1=list(),lt2=list()){
  #lsingle= as.list(utils::modifyList(lt1,lt2))
  #lsingle
  d=lt2
  b=list()
  
  for(i in 1:lengths(lt2)){
    # print("i")
    # print(i)
    # print("d")
    dd=d[[1]][[i]]
    dd = list(table_list_css_column_single=dd)
    # names(d[[1]][[1]])=c(rep("table_list_css_column_single")
    # d$table_list_css_column_single[1]
    
    new=utils::modifyList(lt1,dd)
    # new=utils::modifyList(list1,d[[1]][i])
    # print("b")
    # print(b)
    # print("new")
    # print(new)
    b=append(b,new)
  }
  b
  
}

# as.vector(ccs_list_column$table_list_css_column$columns)
# as.vector()
#data and list options