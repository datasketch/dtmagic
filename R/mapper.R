#from https://github.com/datasketch/dsvizopts/blob/master/R/options.R
#Human behavior inputs
tableOpts =list(
  groupBy = NULL, #not implemented
  sortable = TRUE,
  resizable = FALSE,
  filterable = FALSE, #"none", "bottom", "top"
  searchable = TRUE,
  selection = NULL, #list("Sepal.Length", "Species"),  #list input with colnames or NIULL
  showSortIcon = TRUE, #?
  showSortable =  TRUE, #?
  height = "auto",
  font_wheight ="bold", #auto  default, option  bold
  width = "auto",
  fullWidth = TRUE, #??
  wrap = FALSE, 
  outlined = FALSE, #?'
  bordered = FALSE, #??
  borderless = TRUE, #??
  striped = TRUE,
  compact = TRUE,
  highlight = FALSE,
  pagination = FALSE,
  showPagination = NULL,
  showPageInfo = TRUE,
  showPageSizeOptions = FALSE,
  paginationType = "numbers",
  defaultPageSize = 10,
  pageSizeOptions = c(10, 25, 50, 100)
)




# a custom table container
# sketch = htmltools::withTags(table(
#   class = 'display',
#   thead(
#     tr(
#       th(rowspan = 2, 'Species'),
#       th(colspan = 2, 'Sepal'),
#       th(colspan = 2, 'Petal')
#     ),
#     tr(
#       lapply(rep(c('Length', 'Width'), 2), th)
#     )
#   )
# ))
# print(sketch)

tableOpts$height
  mapper <- function(tableOpts){ 
  
  list_opts = list(
    #general options
    general_list = list(), #EN and ES
    #header css
    table_list_css_header = list(),#list("'color'"="'black'", "'background-color'"="'yellow'"), #color,back,
    #header events
    list2= list(),
    #colnames style #single pararameter for all
    table_list_css_column= list(),
    table_list_css_column_single = list(
      list(),
      list())
    
    
  )
  
  list_opts$general_list[["width"]] =tableOpts$width
  list_opts$general_list[["height"]] =tableOpts$height
  list_opts$general_list[["ordering"]] =tableOpts$sortable
  list_opts$general_list[["searching"]] =tableOpts$searchable
  list_opts$general_list[["selection"]]  =tableOpts$selection
  list_opts$general_list[["stripe"]]  =tableOpts$striped
  list_opts$general_list[["compact"]]  =tableOpts$compact
  list_opts$general_list[["hover"]]  =tableOpts$highlight
  list_opts$general_list[["paging"]]  =tableOpts$pagination
  if(tableOpts$font_wheight == "auto"){
    list_opts$table_list_css_column[["fontWeight"]]="normal"
  }else{list_opts$table_list_css_column[["fontWeight"]]=tableOpts$font_wheight }
  
  if(tableOpts$wrap == TRUE){
    list_opts$table_list_css_column[["wrap"]]="wrap"
  }else{list_opts$table_list_css_column[["wrap"]]="nowrap" }
  
  
  # print("seledction")
  # print(tableOpts$selection)
  # print(list_opts$general_list[["selection"]])
  # #update 
  print(tableOpts$filterable )
  if(tableOpts$filterable == FALSE){
    list_opts$general_list[["filter"]] = "none"
  }
  else{list_opts$general_list[["filter"]] = "top"}
  
  list_opts
  print(list_opts)
}
