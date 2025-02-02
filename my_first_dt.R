library(data.table)
library(dplyr)

my_data <- fread("./Facebook_Ads_2.csv",
                 select = c("Country", "Salary"))

glimpse(my_data)

data <- my_data |> 
  summarise(total = sum(Salary, na.rm = TRUE),
            .by="Country")

glimpse(data)

View(data)
