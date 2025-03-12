library(data.table)
library(dplyr)
library(plotly)

source("./my_functions.R")

data <- load_data(5)

fig <- draw_plot(data)
fig