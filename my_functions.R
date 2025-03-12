# Basic functions

load_data <- function(nrows = 4){
  my_data <- fread("./Facebook_Ads_2.csv",
                   select = c("Country", "Salary"))
  
  data <- my_data |> 
    summarise(total = sum(Salary, na.rm = TRUE),
              .by="Country") |> 
    arrange(desc(total)) |> 
    head(nrows)
  
  return(data)
}

draw_plot <- function(my_df, max_color = "red",
                      others = "green"){
  
  # logic for color
  max_value <- max(my_df$total)
  
  colors <- ifelse(my_df$total == max_value, 
                   max_color, others)
  
  fig <- plot_ly(my_df, x = ~Country, y = ~total, 
                 type = 'bar', name = 'Total Salary by Country',
                 marker = list(color = colors)) |> 
    layout(title = 'Total Salary by Country',
           xaxis = list(title = 'Country'),
           yaxis = list(title = 'Total Salary'),
           plot_bgcolor = 'black',
           paper_bgcolor = 'black',
           font = list(color = "white"))
  
  return(fig)
}
