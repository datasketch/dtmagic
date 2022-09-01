#Testing DT examples
library(dplyr)
DT::datatable(iris) 


#library(DT)
DT::datatable(iris, options = list(
  searching = FALSE,
  pageLength = 5,
  lengthMenu = c(5, 10, 15, 20)
))

#COLOR BACK


DT::datatable(iris, options = list( language = list(url = "//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json"),
  initComplete = DT::JS("
    function(settings, json) {
      $(this.api().table().header()).css({
        'background-color': '#000',
        'color': '#fff'
      });
    }")
))


datatable(iris) %>%
  formatStyle('Sepal.Length', fontWeight = styleInterval(5, c('bold', 'weight'))) %>%
  formatStyle('Sepal.Width',
              color = styleInterval(3.4, c('red', 'white')),
              backgroundColor = styleInterval(3.4, c('yellow', 'gray'))
  )


#COL TYPES
df <- data.frame(
  A = rpois(100, 1e4),
  B = runif(100),
  C = rpois(100, 1e3),
  D = rnorm(100),
  E = Sys.Date() + 1:100
)
DT::datatable(df) %>%
  DT::formatCurrency(c('A', 'C'), '€') %>%
  DT::formatPercentage('B', 2) %>%
  DT::formatRound('D', 3) %>%
  DT::formatDate('E', 'toDateString')



#INTERVAL
DT::datatable(iris) %>% DT::formatStyle(
  'Sepal.Width',
  backgroundColor = DT::styleInterval(3.4, c('gray', 'yellow'))
)




#DT header

 DT::datatable(
  data=iris,
  options = list(
    initComplete = DT::JS(
      "function(settings, json) {",
      "$(this.api().table().header()).css({'color': '#AAA'});",
      "}")))


 
 #Dt OPTIONS
 # library(DT)
 opt=options(DT.options = list(pageLength = 5))
 df = as.data.frame(cbind(matrix(round(rnorm(50), 3), 10), sample(0:1, 10, TRUE)))
 # style V6 based on values of V6
 DT::datatable(df) %>% DT:: formatStyle(
   'V6',
   backgroundColor = DT::styleEqual(c(0, 1), c('gray', 'yellow'))
 )
 
 
DT:: datatable(df) %>% DT::formatStyle(
   'V1', 'V6',
   backgroundColor = DT::styleEqual(c(0, 1), c('gray', 'yellow'))
 )
 
 DT::datatable(df) %>% DT::formatStyle(
   'V6',
   target = 'row',
   backgroundColor = DT::styleEqual(c(0, 1), c('gray', 'yellow'))
 )
 
 
 library(DT)
 options(DT.options = list(pageLength = 5))
 df = as.data.frame(cbind(matrix(round(rnorm(50), 3), 10), sample(0:1, 10, TRUE)))
 # style V6 based on values of V6
 a =datatable(df) %>% formatStyle(
   'V6',
   backgroundColor = styleEqual(c(0, 1), c('gray', 'yellow'))
 )

 a %>% formatStyle(
   'V6',
   backgroundColor = styleEqual(c(0, 1), c('red', 'yellow'))
 )
 
 
 DT::datatable(head(iris), 
           options = list(
             headerCallback = JS(
               "function(thead, data, start, end, display){",
               "  $(thead).remove();",
               "}")
           )
 )
 
 
 es-Es
 
 options_DT <- list(
   pageLength = 10,
   lengthMenu = c(10, 25, 40),
   language = list(
     emptyTable = "Cliente no tiene registros en esta sección",
     zeroRecords = "Cliente no existe. Buscar con otros datos o Agregar cliente",
     infoEmpty = "Datos no coinciden con ningún registro.",
     infoFiltered = "(filtrado de un total de _MAX_ registros)",
     lengthMenu = "Mostrar _MENU_ registros",
     info = "Mostrando _START_ al _END_ de _TOTAL_ registros",
     search = "Buscar:",
     paginate = list(previous = "Anterior",
                     'next' = "Siguiente")
   )
 )
 
 
  DT::datatable(
   data=iris,
   options = list(options_DT,
     initComplete = DT::JS(
       "function(settings, json) {",
       "$(this.api().table().header()).css({'color': '#AAA'});",
       "}")))
 
 
 ##style
    library(dplyr)
    library(DT) 
     dlt =datatable(iris) %>% 
    
       DT::formatCurrency(
       columns =  colnames(iris),
       currency = "",
       interval = 5
       
     )   %>%
       DT::formatStyle(
         columns = colnames(iris),
         fontWeight =10,
         color = "gray",
         backgroundColor = "green"
       )  %>%
       DT::formatString(columns = c(1,2,5), prefix = "a_", suffix = "e")
     dlt
 for(i in 1:2){
    dlt = dlt %>%
      DT::formatStyle(
        columns = i,
        fontWeight =10,
        color = "yellow",
        backgroundColor = "green"
      )
 }
 
 dlt

 
 # class(list_opts[5])
 # bb=lapply(table_list_css_column_single[1],list_opts[5],FUN=modifyListNested)
 # bb$table_list_css_column_single$table_list_css_column_single[[2]]$columns
 # # list_opts[5]$table_list_css_column_single[2]
 # lengths(list_opts[5])
 # List <- list()
 # for(i in 1:lengths(list_opts[5])) {
 #   
 #   print(list_opts[5]$table_list_css_column_single[[i]]$columns)
 # }
 # 
 #   List <- list()
 # #Compute
 # for (colname in colnames(df)) {
 #   
 #   List[[colname]]<- df %>%
 #     group_by(df[,colname]) %>%
 #     count() %>%
 #     arrange(desc(n))
 #   
 # }
 # #Print
 # List  
 #   
 
 # count(lapply(list_opts[5], unique))
 # table(unlist(lapply(list_opts[5], unique)))
 # ccs_list_column = utils::modifyList(table_list_css_column[1],list_opts[4])
 
 list1=list(table_list_css_column_single = list(a=1,b=2,c=3))
 list1a=list(table_list_css_column_single =  list(a=5,c=3))
 list2=list(lab=list(),table_list_css_column_single = list(list(a=1,c=6),  list(a=1,b=2,c=4)))
 ll = list2[[2]][2]
 utils::modifyList
 utils::modifyList(list1,list1a)
 class(ll)
 class(list1)
 list2[[1]]$a
 lapply( list1,ll,FUN=modifyListNested )
 b=list()
 d=(list2[2])
 list1
 for(i in 1:lengths(d)){
   # print("i")
   # print(i)
   # print("d")
   dd=d[[1]][[i]]
   dd = list(table_list_css_column_single=dd)
   # names(d[[1]][[1]])=c(rep("table_list_css_column_single")
   # d$table_list_css_column_single[1]
   
   new=utils::modifyList(list1,dd)
   # new=utils::modifyList(list1,d[[1]][i])
    print("b")
    print(b)
    print("new")
    print(new)
   b=append(b,new)
 }
 b
 modifyListNested <-function(lt1=list(),lt2=list()){
   lsingle= as.list(utils::modifyList(lt1,lt2))
   lsingle
 }
 
 
 DT::datatable(iris,width='50%') %>%  DT::formatStyle(colnames(iris),fontWeight='auto')
 