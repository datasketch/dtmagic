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

#TODO In this version it is necessary to use the lists even if they are empty
#because the number (position) of the list within the main list is taken into account

test_that("null options", {
  runtable(iris)
})

test_that("empty options 1", {
  list_opt= list()
  runtable(iris, list_opt)
})


test_that("empty options 2", {
  list_opt= list( general_list = list(), general_list = list(),
                  table_list_css_header=list(),
                  table_list_css_events=list(),
                  table_list_css_column=list(),
                  table_list_css_column_single=list())
  runtable(iris, list_opt)
})



test_that("empty options 3", {
  list_opt= list( general_list = list(language="ES"),
                  table_list_css_header=list(),
                  table_list_css_events=list(),
                  table_list_css_column=list(),
                  table_list_css_column_single=list())
  runtable(iris,list_opt)
})

test_that("empty options 4", {
  list_opt= list( general_list = list(language="ES"),
                  table_list_css_header = list("'color'"="'gray'", "'background-color'"="'green'", "'font-size'"="'75%'"), #color,back,
                  table_list_css_events=list(),
                  table_list_css_column=list(),
                  table_list_css_column_single=list())
  runtable(iris,list_opt)
})



test_that("empty options 5", {
  list_opt= list( general_list = list(language="EN"),
                  table_list_css_header = list("'color'"="'gray'", "'background-color'"="'green'", "'font-size'"="'75%'"), #color,back,
                  table_list_css_events=list(), #not implemented yet
                  table_list_css_column= list(columns=c(1,2,3,4,5),  fontWeight=3, color = "gray", backgroundColor = "green"),
                  table_list_css_column_single=list())
  runtable(iris,list_opt)
})


test_that("empty options 6 -general cols -select first", {
  list_opt= list( general_list = list(language="EN"),
                  table_list_css_header = list("'color'"="'gray'", "'background-color'"="'green'", "'font-size'"="'75%'"), #color,back,
                  table_list_css_events=list(), #not implemented yet
                  table_list_css_column= list(columns=c(1),  fontWeight=3, color = "yellow", backgroundColor = "green"),
                  table_list_css_column_single=list())
  runtable(iris,list_opt)
})

test_that("empty options 6 -general cols -select first", {
  list_opt= list( general_list = list(language="EN"),
                  table_list_css_header = list("'color'"="'gray'", "'background-color'"="'green'", "'font-size'"="'75%'"), #color,back,
                  table_list_css_events=list(), #not implemented yet
                  table_list_css_column= list(columns=c(1,2),  fontWeight="normal", color = "yellow", backgroundColor = "green"),
                  table_list_css_column_single = list(
                                              list(columns=c(3), fontWeight="bold", color = "orange", backgroundColor = "green"),
                                              list(columns=c(4), fontWeight="normal", color = "black", backgroundColor = "green"))

                  )
                  
  runtable(iris,list_opt)
})


test_that("sufix -prefix cols", {
  list_opt= list( general_list = list(language="EN"),
                  table_list_css_header = list("'color'"="'gray'", "'background-color'"="'green'", "'font-size'"="'75%'"), #color,back,
                  table_list_css_events=list(), #not implemented yet
                  table_list_css_column= list(columns=c(1,2), prefix="a", fontWeight="normal", color = "yellow", backgroundColor = "green"),
                  table_list_css_column_single = list(
                    list(columns=c(3), prefix="not",fontWeight="bold", color = "orange", backgroundColor = "green"),
                    list(columns=c(4), suffix="yes",fontWeight="normal", color = "black", backgroundColor = "green"))
                  
  )
  
  runtable(iris,list_opt)
})
