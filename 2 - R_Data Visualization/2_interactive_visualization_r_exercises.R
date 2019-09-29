#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## 2 INTERACTIVE VISUALIZATION R EXERCISES ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise 1 ####
# =================================================-

#### Question 1 ####
# Read in "fast_food_data.csv" to a dataframe `fast_food`.
# We are going to transform `fast_food` to a long dataset `fast_food_long`.
# Select Carbs..g., Protein..g., Saturated.Fat..g., Sugars..g., Total.Fat..g., Trans.Fat..g.
# and rename them 'carbs', 'protein', 'saturated_fat', 'sodium', 'sugars', 
# 'total_fat', and 'trans_fat', respectively.
# Gather all of these columns using the arguments key = "variable" and value = "grams".
# Make sure to check the data afterwards.


#----------------------------------------------+
#### Question 2 ####
# Set up & connect:
# Create a base boxplot of of `fast_food_long` and save it as `ffboxplot`.


#----------------------------------------------+
#### Question 3 ####
# Polish:
# Update the aesthetics of the boxplot by filling the boxplot with color by variable, 
# but make sure a legend for color is not included in the plot.
# Add my_ggtheme to the plot.


#----------------------------------------------+
#### Question 4 ####
# Update `ffboxplot` by highlighting the outliers. Make them red and size 3.
# Add a title "Fast Food Data" and subtitle "Boxplot" to the plot.


#----------------------------------------------+
#### BONUS ####
# Use the fast food data to recreate the normalized density plots from the class exercise,
# except use the MEAN rather than the MAX to normalize the data.
# Set up & mutate data. Create, adjust, and polish plot.
# Create the base plot `base_food_norm`.
# Then, add a density plot to `base_food_norm` save it to `food_density`.
# Separate the overlapping plots into facets.
# Add a `vline` to show the mean of each normalized food element.
# Make sure the final plot does not have a legend.
# Add title "Fast food data" and subtitle "Faceted density plot".


#### Exercise 2 ####
# =================================================-

#### Question 1 ####
# Similar to question 1 in exercise 1, execute the following commands:
#
# In a new dataframe, 'fast_food_long2', select Carbs..g., Protein..g., 
# Saturated.Fat..g., Sugars..g., Total.Fat..g., Trans.Fat..g., Calories and rename them # as 'carbs', 'protein', 'saturated_fat', 'sodium', 
# 'sugars','total_fat','trans_fat', and 'calories', respectively.
# Gather all of these columns EXCEPT calories,
# using the arguments key = "variable" and value = "grams".


#----------------------------------------------+
#### Question 2 ####
# Utilizing the mutate function, create a new variable 'norm_grams' in the
# 'fast_food_long2' dataframe that is the normalized value of 
# 'grams', following the process to normalize as we did in class.


#----------------------------------------------+
#### Question 3 ####
# Build a base ggplot function using the 'fast_food_long2' dataset, 
# 'norm_grams' being the x and 'total_fat' being the y.
# Color by variable and add the my_ggtheme object.
# Name this plot 'ff_norm_plot'.


#----------------------------------------------+
#### Question 4 ####
# Add the scatterplot layer via the geom_point object.
# View the graph.


#----------------------------------------------+
#### Question 5 ####
# Add a 2D density layer to the plot with alpha = 0.7.
# Then facet wrap by variable with 3 columns.
# Save the plot as "fast_food_norm.png" in the `plot_dir`.


#### Exercise 3 ####
# =================================================-

#### Question 1 ####
# Create a scatterplot named ff_scatter using hchart and the fast_food_long2 dataframe. 
# Plot the normalized values against `calories` and set the group = variables.
# View `ff_scatter`.


#----------------------------------------------+
#### Question 2 ####
# Use `hc_chart` to specify zoom for `ff_scatter`.
# Add a title to the plot "Fast Food Data Scatterplot".
# Do you notice any patterns in this dataset by looking at the scatterplot?
# If so, describe what you see and try to interpret it.


#----------------------------------------------+
#### Question 3 ####

# Create 'fast_food_sub' which is the 5th to ther 12th columns of
# the fast_food dataframe. Omit all rows containing NA values.
# HINT: na.omit() may be a useful function.
# Then, create a correlation matrix with 'fast_food_cor' named 'cor_matrix'.
# Use hchart to create an interactive correlation plot, named 'corr_interactive'.
# Add a title "Fast Food Data Correlation" and view the plot.


#### Exercise 4 ####
# =================================================-

#### Question 1 ####

# Save the output of `summary(fast_food_sub)` to `ffood_summary` and a dataframe object.
# Then, inspect `ffood_summary`.
# Remove `Var1` from `ffood_summary` and rename the remaining columns to be "Variable" and "Summary".
# Inspect `ffood_summary` after you make those changes.


#----------------------------------------------+
#### Question 2 ####
# Setup:
# Replicate the transformation used in the class exercise to separate 
# the `Summary` column into two different columns.
# You want the statistic and the value to be in different columns
# and convert the applicable data to numeric, rather than character.
# What separator will you use to split the column into two?


#----------------------------------------------+
#### Question 3 ####
# Setup & connect:
# Construct the summary chart `ffood_summary_interactive` using `hchart`.
# Add the setting that the tool tip is shared to `ffood_summary_interactive`.
# View `ffood_summary_interactive`.
# What's off about this chart? 
# What's wrong with sodium? 
# What should we have done before summarizing the data?


#----------------------------------------------+
#### Question 4 ####

# Replicate creating the boxplots with ggplot of `fast_food_long` from exercise 1, 
# but use highcharter instead.
# Create an interactive boxplot called `ff_bp_interactive`.


#----------------------------------------------+
#### Question 5 ####
# Enhance the boxplot options using `hc_plotOptions`, to color each boxplot.
# Add a title to the plot "Fast Food Data Boxplot".
# View the plot.

