library(data.table)
library(dplyr)

df <- data.table(
  id = c(1, 1, 1, 2, 2, 2, 3, 3, 3),
  value = c(1, 2, 3, 4, 5, 6, 7, 8, 9),
  name = c("a", "b", "c", "d", "e", "f", "g", "h", "i")
)

df <- df |> mutate(name_obj = paste0("name_", name))

create_dataframe <- function(row) {
  data.table(
    xproduct = row$name,
    xcost = row$value
  )
}

my_list <- list()

lapply(seq(nrow(df)), function(i){
  row <- df[i]
  my_list[[row$name_obj]] <<- create_dataframe(row)
})

my_list[["name_a"]]

