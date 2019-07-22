#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## 2 STATIC VISUALIZATION EXERCISES ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise 1 ####
# =================================================-

#### Question 1 ####

# Read the fast_food_data.csv into a dataset named "fast_food_data". 
# Set both the header and stringsAsFactors as equal to TRUE. 
fast_food_data = read.csv("fast_food_data.csv", header =  T, stringsAsFactors = T)
# Subset the data set to be named "fast_food_subset" and include columns 3, 5, 6, 10, 11. 
column_ids = c(3, 5, 6, 10, 11)
fast_food_subset = fast_food_data[,column_ids]
str(fast_food_subset)
# Then, rename those columns "type", "calories","totfat","carbs", & "sugars".
View(fast_food_subset)

colnames(fast_food_subset) = c("type", "calories","totfat","carbs", "sugars")
colnames(fast_food_subset)
attributes(fast_food_subset)

#----------------------------------------------+
#### Question 2 ####

# Create a dataset named `fast_food_num`, which consists of only the numeric variables from fast_food_subset.
ff_Num = sapply(fast_food_subset, is.numeric) 
fast_food_num = fast_food_subset[ff_Num]
fast_food_num
# Then, retrieve the number of columns from `fast_food_num` and store it in the variable `num_col`.
num_col = ncol(fast_food_num)
# Sample `num_col` number of colors from `colors` and store it in `color_sam`. 
set.seed(2)
col_sam = sample(colors(), num_col)
col_sam
# Make sure to set the seed to 2 before sampling.

# What four colors did sample choose?
col_sam

#----------------------------------------------+
#### Question 3 ####

# Make a boxplot of the variables in `fast_food_num` using the colors stored in `color_sam`. 
# Which variable has the widest range?
boxplot(fast_food_num, col = col_sam)
print("calories") 

#----------------------------------------------+
#### Question 4 ####

# Create a 2x2 grid of histograms of all 4 variables in `fast_food_num`, using colors in  `color_sam`.
# appropriately labeled with xlabel and title for each.
# Hint: use par(mfrow = c(2, 2)) to create the grid for the plots.
par(mfrow = c(2,2))
hist(fast_food_num$calories, col=col_sam[1], xlab = "calories", main = "Dist. of calories")
hist(fast_food_num$totfat, col=col_sam[2], xlab = "total fat", main = "Dist. of fat")
hist(fast_food_num$carbs, col=col_sam[3], xlab = "carbs", main = "Dist. of carbs")
hist(fast_food_num$sugars, col=col_sam[4], xlab = "sugar", main = "Dist. of sugar")
#### Exercise 2 ####
# =================================================-

#### Question 1 ####
# Begin with plotting total fat against carbohydrates. 
# Have total fat be on the x-axis and carbohydrates on the y-axis.
# Please use the column index to specify the variables. 
# Create appropriate labels for x and y axis and title.
# Fill with the triangle symbol and scale 1.
# Make the color "salmon2".
?pch
par(mfrow = c(1,1))
plot(fast_food_num[,2],
     fast_food_num[,3], 
     xlab = "Total Fat", 
     ylab = "Carbohydrates", 
     main = "Fats vs Carb",
     pch = 2, 
     cex = 1, 
     col ="salmon")

#### Exercise 3 ####
# =================================================-

#### Question 1 ####
# Create a scatterplot matrix of all the variables in fast_food_num with the + symbol.
# Choose random color from colors() and set the color of the points each time the plot is generated.
?pch
col_sample_ff = sample(colors(), n_cols_ff)
pairs(fast_food_num[,1:4], pch=3, col=(sample(colors(), 1)))

#----------------------------------------------+
#### Question 2 ####
# Observing the patterns in your scatterplot, which variables appear 
# to have the strongest relationship?
print("Fat to calories")

#----------------------------------------------+
#### Question 3 ####
# To find the correlation coefficient between the variables in fast_food_num, 
# execute the cor function on the fast_food_num data set.
# Assign the output to a variable named "fast_food_cor".
# View the output of fast_food_cor. 
# What is the correlation between calories and total fat content?
# Is there a strong or weak correlation between calories and total fat content?
fast_food_cor = cor(fast_food_num[,1:4])
View(fast_food_cor)
0.9407608

#----------------------------------------------+
#### Question 4 ####
# Visualize the correlation matrix using corrplot in the three ways demoed in class.
# Use the documentation within corrplot to make another corrplot 
# that we did not demo in class.
# Which two variables are the least correlated?
# Hint: use ?corrplot for assistance.
corrplot(fast_food_cor, method = "pie")
corrplot(fast_food_cor, method = "number")
corrplot.mixed(fast_food_cor)
summary(fast_food_cor)
min(fast_food_cor)
filter(fast_food_cor, fast_food_cor(x) < 1)
max_cor = which.max(fast_food_cor, x < 1)
max_cor
#### Exercise 4 ####
# =================================================-
library(ggplot2)
#### Question 1 ####
# Begin to create the foundation of a plot by executing ggplot on fast_food_num, 
# without any specification added yet as to what type of plot it will be.
# Set x equal to calories. 
# Assign ggplot's output to the variable ffplot1.
ffplot1 = ggplot(fast_food_num, aes(x=calories))
ffplot1

#----------------------------------------------+
#### Question 2 ####
# Specify that the plot is going to be a histogram by adding geom_histogram() 
# to ffplot1 to see the plotted histogram.
ffplot1 = ffplot1 + geom_histogram()
ffplot1

#----------------------------------------------+
#### Question 3 ####
# Modify the histogram within its specifications to make it a density plot, 
# and set the binwidth to 50.
# Enhance the histogram further by setting the color to "salmon2" and 
# the fill color to "salmon3".
# Then, save the adjusted ffplot1 by reassigning the output of 
# ffplot + geom_histogram back to ffplot1.
# Make sure to view your plot after you save it.
ffplot1 = ffplot1 + geom_histogram(aes(y= ..density..), binwidth = 50, color="salmon2", fill="salmon3")
ffplot1
#----------------------------------------------+
#### Question 4 ####
# Create a new density plot object and add it to ffplot1. Then, save ffplot1.
# Hint: ?geom_density
# Specify that the density plot should have a 20% opaque gray fill and a steelblue border.
# Make sure to view your final plot. How many layers are there on the plot?
?geom_density
ffplot1 = ffplot1 + geom_density(alpha=.2, color="gray", fill="steelblue")
ffplot1

#----------------------------------------------+
#### Question 5 ####
# Specify what size text you want on the plot labels by adding theme_bw() to ffplot1. 
# Set the axis title text to size 22 and the axis text to size 18.
# Save the theme to ff_theme.
fftheme1 = theme_bw() + theme(axis.title = element_text(size = 22),
                              axis.text = element_text(size = 18))
ffplot1 = ffplot1 + fftheme1
ffplot1

#----------------------------------------------+
#### Question 6 ####
# Begin to create the foundation of a plot by executing ggplot on fast_food_num, 
# without any specification added yet as to what type of plot it will be.
# Set x equal to totfat and y equal to calories. 
# Assign ggplot's output to the variable ffplot2.
ffplot2 = ggplot(fast_food_num, aes(x=totfat, y =calories))
ffplot2

#----------------------------------------------+
#### Question 7 ####
# Specify that the plot is going to be a scatterplot by adding geom_point() 
# to ffplot2 to see the plotted scatterplot.
ffplot2 = ffplot2 + geom_point()
ffplot2

#----------------------------------------------+
#### Question 8 ####
# Enhance the scatterplot, ffplot2, with the ff_theme.
# Then, change the point color to tomato2, and add a trend line to the scatterplot.
# Make sure to view your plot after you save it.
ffplot2 = ffplot2 +
  geom_point(color="tomato2")+
  geom_smooth(method = lm)
ffplot2
ffplot2 = ffplot2 + fftheme1
ffplot2



