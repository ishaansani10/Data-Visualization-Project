# THE ECONOMIST
install.packages('ggplot2')
install.packages('data.table')
library(ggplot2)
library(data.table)
install.packages('ggthemes')
library(ggthemes)

# Reading economist file

df <- fread('Economist_Assignment_Data.csv', drop = 1)
print(head(df))

# plotting the scatter plot. 

a <- ggplot(df, aes(x = CPI, y = HDI, color = factor(Region)))
b <- a + geom_point(size = 4, shape = 1)

# Plotting a line on the previously plotted scatter plot

c <- b + geom_smooth(method='lm', aes(group = 1), formula = y ~ log(x), se = F, color = 'red')

#Creating a vector so as the label does not overlap
PointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan","Congo", "Greece", "Argentina", "Brazil",
                   "Inida", "Italy", "China", "South Africa", "Spain",
                   "Botswana", "cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zeland", "Singapore")

# Plotting text on the graph

d <- c + geom_text(aes(label = Country), color = 'gray20',
                   data = subset(df, Country %in% PointsToLabel), check_overlap = TRUE)
# Assigning the limits of the graph on x-axis

print(d + scale_x_continuous(limits = c(0.9,10.5), breaks = 1:10) + theme_economist_white())
