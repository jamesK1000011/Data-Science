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
fast_food = 
  read.csv("fast_food_data.csv",
           header = TRUE)
View(fast_food)
# We are going to transform `fast_food` to a long dataset `fast_food_long`.
# Select Carbs..g., Protein..g., Saturated.Fat..g., Sugars..g., Total.Fat..g., Trans.Fat..g.
ff_var_vec= c("Carbs..g.", "Protein..g.", "Saturated.Fat..g.", "Sugars..g.", "Total.Fat..g.", "Trans.Fat..g.")
fast_food_long = select(fast_food, ff_var_vec)
head(fast_food_long)
# and rename them 'carbs', 'protein', 'saturated_fat', 'sugars', 
# 'total_fat', and 'trans_fat', respectively.
ff_Name_vec = c("carbs" = "Carbs..g.", "protein" = "Protein..g.", "saturated_fat" = "Saturated.Fat..g.", 
                "sugars" ="Sugars..g.", "total_fat" = "Total.Fat..g.", "trans_fat" = "Trans.Fat..g.")
fast_food_long = rename(fast_food_long, !!ff_Name_vec)
head(fast_food_long)
# Gather all of these columns using the arguments key = "variable" and value = "grams".
# Make sure to check the data afterwards.
fast_food_long = fast_food_long %>%
  gather(key = "variable",
         value = "grams") 
head(fast_food_long)

fast_food_long = fast_food_long %>%
  group_by(variable) %>%            
  mutate(grams =                 
           grams/max(grams,           
                     na.rm = TRUE))   

fast_food_long

#----------------------------------------------+
#### Question 2 ####
# Set up & connect:
# Create a base boxplot of of `fast_food_long` and save it as `ffboxplot`.
ffboxplot = ggplot(fast_food_long,
                  aes(x = variable,  
                      y = grams)) 
ffboxplot
#----------------------------------------------+
#### Question 3 ####
# Polish:
# Update the aesthetics of the boxplot by filling the boxplot with color by variable, 
# but make sure a legend for color is not included in the plot.
# Add my_ggtheme to the plot.
ffboxplot = ggplot(fast_food_long,        
                  aes(x = variable, 
                      y = grams, 
                      fill = variable)) +
            geom_boxplot() + 
            guides(fill = FALSE) +
            my_ggtheme

# View plot.
ffboxplot

#----------------------------------------------+
#### Question 4 ####
# Update `ffboxplot` by highlighting the outliers. Make them red and size 3.
# Add a title "Fast Food Data" and subtitle "Boxplot" to the plot.
ffboxplot = ffboxplot + 
  labs(title = "Fast Food Data", 
       subtitle = "Boxplot") +
  geom_boxplot(outlier.color = "red",
               outlier.size = 3)
ffboxplot

#----------------------------------------------+
#### BONUS ####
# Use the fast food data to recreate the normalized density plots from the class exercise,
# except use the MEAN rather than the MAX to normalize the data.
fast_food_Norm = 
  read.csv("fast_food_data.csv",
           header = TRUE)
ff_var_vec_N= c("Carbs..g.", "Protein..g.", "Saturated.Fat..g.", "Sugars..g.", "Total.Fat..g.", "Trans.Fat..g.")
ff_Name_vec_N = c("carbs", "protein", "saturated_fat", "sugars", "total_fat", "trans_fat")
fast_food_Norm = select(fast_food_Norm, ff_var_vec_N) 
colnames(fast_food_Norm)<-(ff_Name_vec_N)
head(fast_food_Norm)
fast_food_Norm = fast_food_Norm %>%
  gather(key = "variable",
         value = "grams") 
head(fast_food_Norm)
tail(fast_food_Norm)
mean(fast_food_Norm$grams, na.rm = TRUE)
fast_food_Norm = fast_food_Norm %>%
  group_by(variable) %>%             
  mutate(grams =                 
           grams/mean(grams,           
                      na.rm = TRUE))   
fast_food_Norm
# Set up & mutate data. Create, adjust, and polish plot.
# Create the base plot `base_food_norm`.
base_food_norm = ggplot(fast_food_Norm,        
                   aes(x = grams, 
                       fill = variable)) 
# View plot.
base_food_norm
# Then, add a density plot to `base_food_norm` save it to `food_density`.
food_density = base_food_norm +
              my_ggtheme  +
              geom_density() #<- adjust fill
# Separate the overlapping plots into facets.
# Add a `vline` to show the mean of each normalized food element.
food_density = food_density +                      
              facet_wrap (~ variable, ncol = 3) +             
              geom_vline(data = fast_food_Norm,    
              aes(xintercept = mean(grams, na.rm = TRUE), color = variable), linetype = "dashed")
# Make sure the final plot does not have a legend.
# Add title "Fast food data" and subtitle "Faceted density plot".
food_density = food_density +           
              guides(fill = FALSE, color = FALSE) +  
              labs(title = "Fast food data", subtitle = "Faceted density plot")
# View updated plot.
food_density

#### Exercise 2 ####
# =================================================-

#### Question 1 ####
# Similar to question 1 in exercise 1, execute the following commands:
#
# In a new dataframe, 'fast_food_long2', select Carbs..g., Protein..g., 
# Saturated.Fat..g., Sugars..g., Total.Fat..g., Trans.Fat..g., Calories and rename them # as 'carbs', 'protein', 'saturated_fat', 'sodium', 
# 'sugars','total_fat','trans_fat', and 'calories', respectively.
fast_food_long2 = 
  read.csv("fast_food_data.csv",
           header = TRUE)
ff_var_long2= c("Carbs..g.", "Protein..g.", "Saturated.Fat..g.", "Sugars..g.", "Total.Fat..g.", "Trans.Fat..g.", "Calories")
ff_Name_long2 = c("carbs", "protein", "saturated_fat", "sugars", "total_fat", "trans_fat", "calories")
fast_food_long2 = select(fast_food_long2, ff_var_long2)
colnames(fast_food_long2)<-(ff_Name_long2)
head(fast_food_long2)

# Gather all of these columns EXCEPT calories,
# using the arguments key = "variable" and value = "grams".
fast_food_long2 = fast_food_long2 %>%
  gather(carbs:trans_fat,
         key = "variable",
         value = "grams") 
head(fast_food_long2)

#----------------------------------------------+
#### Question 2 ####
# Utilizing the mutate function, create a new variable 'norm_grams' in the
# 'fast_food_long2' dataframe that is the normalized value of 
# 'grams', following the process to normalize as we did in class.
fast_food_long2 = fast_food_long2 %>%
  group_by(variable) %>%             
  mutate(norm_grams =                 
           grams/max(grams,           
                     na.rm = TRUE))   

head(fast_food_long2)
tail(fast_food_long2)

#----------------------------------------------+
#### Question 3 ####
# Build a base ggplot function using the 'fast_food_long2' dataset, 
# 'norm_grams' being the x and 'total_fat' being the y.
# Color by variable and add the my_ggtheme object.
# Name this plot 'ff_norm_plot'.
ff_norm_plot = ggplot(fast_food_long2,      
                        aes(x = norm_grams,       
                            y = calories,     
                            color = variable)) + 
                            my_ggtheme                    

# View base plot + theme.
ff_norm_plot

#----------------------------------------------+
#### Question 4 ####
# Add the scatterplot layer via the geom_point object.
# View the graph.
ff_norm_plot = ff_norm_plot +        
  geom_point() 
ff_norm_plot

#----------------------------------------------+
#### Question 5 ####
# Add a 2D density layer to the plot with alpha = 0.7.
ff_norm_plot = ff_norm_plot +             
  geom_density2d(alpha = 0.5)
ff_norm_plot
# Then facet wrap by variable with 3 columns.
ff_norm_plot = ff_norm_plot +                  
  facet_wrap(~ variable, ncol = 3)
ff_norm_plot
# Save the plot as "fast_food_norm.png" in the `plot_dir`.
setwd(plot_dir)

png("fast_food_norm.png",
    width = 1200, 
    height = 600, 
    units = "px")
ff_norm_plot
dev.off()

#### Exercise 3 ####
# =================================================-

#### Question 1 ####
# Create a scatterplot named ff_scatter using hchart and the fast_food_long2 dataframe. 
# Plot the normalized values against `calories` and set the group = variables.
# View `ff_scatter`.
ff_scatter = hchart(fast_food_long2, "scatter", hcaes(x = grams, y = calories, group = variable))
ff_scatter
#----------------------------------------------+
#### Question 2 ####
# Use `hc_chart` to specify zoom for `ff_scatter`.
ff_scatter = ff_scatter %>% hc_chart(zoomType = "xy")
# Add a title to the plot "Fast Food Data Scatterplot".
ff_scatter = ff_scatter %>% hc_title(text = "Fast Food Data Scatterplot")
# Do you notice any patterns in this dataset by looking at the scatterplot?
ff_scatter
# If so, describe what you see and try to interpret it.
print("there is a strong correlation between calories/total fat, calories/protein")

#----------------------------------------------+
#### Question 3 ####

# Create 'fast_food_sub' which is the 5th to ther 12th columns of
fast_food_sub = fast_food[,5:12]
ff_sub_vec= c("calories", "total_fat", "saturated_fat", "trans_fat", "sodium", "carbs","sugars", "protein")
colnames(fast_food_sub)<-(ff_sub_vec)
fast_food_sub
# the fast_food dataframe. Omit all rows containing NA values.
# HINT: na.omit() may be a useful function.
fast_food_sub = fast_food_sub %>% na.omit()
fast_food_sub
# Then, create a correlation matrix with 'fast_food_sub' named 'cor_matrix'.
cor_matrix = cor(fast_food_sub)
# Use hchart to create an interactive correlation plot, named 'corr_interactive'.
corr_interactive = hchart(cor_matrix) %>%
  hc_title(text = "Fast Food Data Correlation")
# Add a title "Fast Food Data Correlation" and view the plot.
corr_interactive

#### Exercise 4 ####
# =================================================-

#### Question 1 ####

# Save the output of `summary(fast_food_sub)` to `ffood_summary` and a dataframe object.
ffood_summary = summary(fast_food_sub)
ffood_summary = as.data.frame(ffood_summary)
# Then, inspect `ffood_summary`.
head(ffood_summary)
# Remove `Var1` from `ffood_summary` and rename the remaining columns to be "Variable" and "Summary".
ffood_summary$Var1 = NULL
colnames(ffood_summary) = c("Variable", "Summary")
# Inspect `ffood_summary` after you make those changes.
head(ffood_summary)

#----------------------------------------------+
#### Question 2 ####
# Setup:
# Replicate the transformation used in the class exercise to separate 
# the `Summary` column into two different columns.

# You want the statistic and the value to be in different columns
# and convert the applicable data to numeric, rather than character.
# What separator will you use to split the column into two?
ffood_summary = ffood_summary %>% separate(Summary, into = c("Statistic", "value"), sep = ":", convert = TRUE)
head(ffood_summary)
nrow(subset(ffood_summary, is.na(value)))
#----------------------------------------------+
#### Question 3 ####
# Setup & connect:
# Construct the summary chart `ffood_summary_interactive` using `hchart`.
ffood_summary_interactive = hchart(ffood_summary, "column", hcaes(x = Statistic, y = value, group = Variable))
# Add the setting that the tool tip is shared to `ffood_summary_interactive`.
ffood_summary_interactive = ffood_summary_interactive %>% 
  hc_tooltip(shared = TRUE)
# View `ffood_summary_interactive`.
ffood_summary_interactive
# What's off about this chart? 
print("the sodium is to damn high!")
# What's wrong with sodium? 
# What should we have done before summarizing the data?
converted sodium from miligrams to grams

fast_food_sub$sodium = fast_food_sub$sodium/1000
ffood_summary = summary(fast_food_sub)
ffood_summary = as.data.frame(ffood_summary)
ffood_summary$Var1 = NULL
colnames(ffood_summary) = c("Variable", "Summary")
ffood_summary = ffood_summary %>% separate(Summary, into = c("Statistic", "value"), sep = ":", convert = TRUE)

ffood_summary_interactive = hchart(ffood_summary, "column", hcaes(x = Statistic, y = value, group = Variable))
ffood_summary_interactive = ffood_summary_interactive %>% 
  hc_tooltip(shared = TRUE)
ffood_summary_interactive
#----------------------------------------------+
#### Question 4 ####

# Replicate creating the boxplots with ggplot of `fast_food_long` from exercise 1, 
# but use highcharter instead.

# Create an interactive boxplot called `ff_bp_interactive`.
head(fast_food_long)
ff_bp_interactive = hcboxplot(x = fast_food_long$grams, 
                              var = fast_food_long$variable, 
                              name="Normalized value")
ff_bp_interactive

#----------------------------------------------+
#### Question 5 ####
# Enhance the boxplot options using `hc_plotOptions`, to color each boxplot.
# Add a title to the plot "Fast Food Data Boxplot".
ff_bp_interactive = ff_bp_interactive %>%
  hc_plotOptions(boxplot = list(colorByPoint = TRUE)) %>%
  hc_title(text = "Fast Food Data Boxplot")
# View the plot.
ff_bp_interactive
