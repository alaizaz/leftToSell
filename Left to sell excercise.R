library(readxl)
library(ggplot2)

setwd("C:/Users/aizaz/Desktop")

dataset <- read_excel("Left to Sell - Data dummy.xlsx")

head(dataset)

ggplot(dataset)+
  geom_line(aes( x = dataset$Date, y = dataset$'Left to Sell sqm', col = Market), size = 1)+
  geom_line(aes( x = dataset$Date, y = dataset$'Max.Equippable Space'), size = 1)+
  geom_line(aes( x = dataset$Date, y = dataset$'Equipped Space'), size = 1, col = "red")+
  geom_smooth(aes( x = dataset$Date, y = dataset$'Left to Sell sqm'), method = "lm", level = 0.5)+
  geom_smooth(aes( x = dataset$Date, y = dataset$'Left to Sell sqm'), method = "lm")+
  facet_wrap(~COUNTRY)+
  xlab("Date")+
  ylab("Capacity")+
  theme_minimal()

ggplot(dataset)+
  geom_point(aes(x = dataset$`Future sold SQM`, y = dataset$`Future sold kW`, size = c(dataset$`Future sold SQM`+dataset$`Future sold kW`), col = COUNTRY))+
  facet_wrap(~COUNTRY)+
  xlab("Date")+
  ylab("Capacity")+
  theme_minimal()

d<- !is.na(dataset$`Future sold SQM`)
d
cor(dataset$`Future sold SQM`, dataset$`Future sold kW`)
