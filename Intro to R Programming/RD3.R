View(state.x77)
class(state.x77)
str(state.x77)
dim(state.x77)
dim(state.x77)[1]
dim(state.x77)[2]

#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTRO TO R PROGRAMMING DAY3 EXERCISE ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise 1 ####
# =================================================-

#### Question 1 ####

# Set seed as 2 and generate 10 state abbreviations from `state.abb`.
set.seed(2)
sample(state.abb, size = 10)

#----------------------------------------------+
#### Question 2 ####
# How can you get the same 10 state names as before?
By using set.seed prior to creating a random sample

#----------------------------------------------+
#### Question 3 ####
# In this question, we will use `unique_regions_list`, which we defined during the class.
unique_regions = unique(state.region)
unique_regions_list = as.list(unique_regions)
unique_regions_list = lapply(unique_regions_list, as.character)
# Convert the entries in the `unique_regions_list` to lower case using `lapply` and save them 
# in `lower_case_list` variable.
lower_case_list = lapply(unique_regions_list, tolower)
lower_case_list
# Hint: use the R base function `tolower` to do that.


#----------------------------------------------+
#### Question 4 ####
# Take the square root of the entries in the `numeric_list` using `lapply` and 
# save them into `sqrt_list` variable.
numeric_list = list(first=-1, second =2, third=3, fourth = -4)
numeric_list_abs = lapply(numeric_list, abs)
sqrt_list = lapply(numeric_list_abs, sqrt)
sqrt_list
#### Exercise 2 ####
# =================================================-

#### Question 1 ####
# Make a function `CubeRoot` that takes a cube root of a number. 
# Hint: sqrt(x) = x^(1/2)

CubeRoot = function(x){
  x^(1/3)
}
x = sample(1:10, size = 1)
x

#----------------------------------------------+
#### Question 2 ####
# Test the function on taking the cube root of 27. The answer you should get is 3.
CubeRoot(27)

#----------------------------------------------+
#### Question 3 ####
# In this question, we will use `sample_vec`, which we defined during the class.
sample_vec = sample(1:50, size=50)
sample_vec
# Using `lapply`, calculate the cube root of each entry of `sample_vec` and save 
# the output as a `vector` in a variable named `cube_root_vec`.
vector = lapply(sample_vec, CubeRoot)
vector
cube_root_vec = unlist(vector)
cube_root_vec
class(cube_root_vec)

#----------------------------------------------+
#### Question 4 ####
# Using the `even_ids` and `state.name` vector return the OTHER half of the
# state names that corresponds to randomly distributed ODD numbers.
# Convert these state names to upper case to display.
IsEven = function(n){
  if(n %% 2 == 0){
    TRUE
  }else{
    FALSE
  }
}

logical_list = lapply(sample_vec, IsEven)
logical_vec = unlist(logical_list)
even_id = sample_vec[logical_vec]
state.name[-even_id]
state.name[even_id]

#----------------------------------------------+
#### Question 5 ####
# In this question, we will use `sample_vec`, which we defined during the class
sample_vec = sample(1:50, size=50)
sample_vec
# Use the `cubeRoot` function on 'sample_vec' and generate the `cube_root_vector1` by using `sapply`. 
cube_root_vector1 = sapply(sample_vec, CubeRoot)
cube_root_vector1

#----------------------------------------------+
#### Question 6 ####
# Take the `state_df` dataframe, use `sapply` to find the mean of the first 8 columns.
state_data = state.x77
state_df = as.data.frame(state_data)
rownames(state_df)
state_df$State = rownames(state_df)
rownames(state_df) = NULL
View(state_df)

State_Mean = sapply(state_df[,1:8], mean)
State_Mean



#### Exercise 3 ####
# =================================================-

# Load the datasets we will be using for this exercise
# (this dataset is native to R).
install.packages("babynames")
library(babynames)
data(babynames)

#----------------------------------------------+
#### Question 1 ####
# Filter all names from 2015.
filter_baebies = filter(babynames, year ==2015)
filter_baebies

#----------------------------------------------+
#### Question 2 ####
# Filter all female names that are from 2015.
filter_baebies_f = filter(babynames, year ==2015, sex == "F")
filter_baebies_f

#----------------------------------------------+
#### Question 3 ####
# Filter all names that are below 1000 counts and that are between 1947-1975 inclusive.
filter_baebies_1947 = filter(babynames, year>=1947 & year <= 1975 , n < 1000)
head(filter_baebies_1947)
tail(filter_baebies_1947)

#----------------------------------------------+
#### Question 4 ####
# Filter all names that are either female or above 1000 counts, all from 1975.
filter_baebies_F1000 = filter(babynames, year == 1975, n > 1000 | sex == "F")
head(filter_baebies_F1000)
tail(filter_baebies_F1000)

#----------------------------------------------+
#### Question 5 ####
# Filter all names that are either female names born before 1952 or males born after 1985.
filter_baebies_F1952_M1985 = filter(babynames, year > 1975 & sex == "M" | year < 1952 & sex == "F")
head(filter_baebies_F1952_M1985)
tail(filter_baebies_F1952_M1985)

view(filter(babynames, name =="James"))

