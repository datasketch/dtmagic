#from https://github.com/datasketch/dsvizopts/blob/master/R/options.R
#Human behavior inputs
tableOpts <- list(
  groupBy = NULL,
  sortable = FALSE,
  resizable = FALSE,
  filterable = FALSE, #"none", "bottom", "top"
  searchable = TRUE,
  selection = NULL,
  showSortIcon = TRUE,
  showSortable =  TRUE,
  height = "auto",
  font_wheight ="auto",
  width = "auto",
  fullWidth = TRUE,
  wrap = TRUE,
  outlined = FALSE,
  bordered = FALSE,
  borderless = TRUE,
  striped = TRUE,
  compact = FALSE,
  highlight = FALSE,
  pagination = TRUE,
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
  
  #update 
  print(tableOpts$filterable )
  if(tableOpts$filterable == FALSE){
    list_opts$general_list[["filter"]] = "none"
  }
  else{list_opts$general_list[["filter"]] = "top"}
  
  list_opts
  print(list_opts)
}
