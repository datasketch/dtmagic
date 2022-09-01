#from https://github.com/datasketch/dsvizopts/blob/master/R/options.R
#Human behavior inputs
tableOpts <- list(
  groupBy = NULL,
  sortable = TRUE,
  resizable = FALSE,
  filterable = FALSE,
  searchable = FALSE,
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

tableOpts$height
mapper <- function(tableOpts){ 
  list_opts = list(
    #general options
    table_general_list = list(tableOpts$height), #EN and ES
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
  
  list_opts$table_general_list[["width"]] =tableOpts$width
  list_opts$table_general_list[["height"]] =tableOpts$height
  list_opts
  print(list_opts)
}
