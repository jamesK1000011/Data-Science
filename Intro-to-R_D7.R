#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## 2 RSHINY DAY1 EXERCISES ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise 1 ####
# =================================================-

#### Question 1 ####
# Navigate to the 'shiny' folder and the subfolder called 'day-1-exercises'. 
# Inside the folder 'day-1-exercises', create a folder called 'exercise-1'.
print("G2G")
#### Question 2 ####
# Inside the folder 'exercise-1', create a new R file called 'ui.R'.
print("G2G")
# In the ui.R file, set the directory to the 'af-werx' folder, using code that can
# automatically detect if a user is using a Linux-based system (Apple or Linux) or a Windows-based system.
print("G2G")
# In the ui.R file, create data-dir and set working directory to data directory.
print("G2G")
# In the ui.R file, load the Shiny package.
print("G2G")
# In the ui.R file, add the code to load the 'fast_food_data.csv' dataset as 'fast_food_data'.
print("G2G")
# Please comment each line of code with a brief description.
print("G2G")

### Question 3 ####
# In the ui.R file, add the code to create the actual UI.
print("G2G")

### Question 4 ####
# Inside the folder 'exercise-1', create a new R file called 'server.R'.
print("G2G")
# In the 'server.R' file, set the directory to the 'af-werx' folder, using code that can automatically detect if a user is using a Linux-based system (Apple or Linux) or a Windows-based system.
print("G2G")
# In the 'server.R' file, add the code to load the 'shiny' package.
print("G2G")
# In the 'server.R file, add the code to load the 'fast_food_data.csv' dataset as `fast_food_data`.
print("G2G")
# Please comment each line of code with a brief description.
print("G2G")

### Question 5 ####
# In the 'server.R' file, add the code to create the actual Server.
print("G2G")

#### Question 6 ####
# Run your application.
# What do you see?
print("lost of errors, apple doesn't not like R")

#### Exercise 2 ####
# =================================================-

#### Question 1 ####
# Navigate to the 'shiny' folder and the subfolder called 'day-1-exercises'. 
# Inside the folder 'day-1-exercises', create a folder called 'exercise-2'.
# Inside 'exercise-2' create three folder, called 'question-3', 'question-4', and 'question-5'.
print("done")
#### Question 2 ####
# In each of the folders called 'question-3', 'question-4', and 'question-5', create a file 'ui.R' that contains the base structure and a file 'server.R' that contains the base structure.
print("done")

#### Question 3 ####
# In folder 'question-3', manipulate 'ui.R' to create a slider range according to the following instructions:
# - Name of the element: 'exerciseSliderRange'
# - Header to be displayed: 'Select your range'
# - Minimum value that can be selected: -100
# - Maximum value that can be selected: 100
# - Range selected by default: -10 to 10
print("done")

#### Question 4 ####
# In folder 'question-4', manipulate 'ui.R' to create a checkbox group according to the following instructions:
# - Name of the element: 'exerciseCheckGroup'
# - Header to be displayed: 'Select a color'
# - Choices to be displayed: 
#     -'Red'
#     -'Blue'
#     -'Green'
#     -'Orange'
# - Choices selected by default:
#     -'Green'
#     -'Orange'


#### Question 5 ####
# In folder 'question-5', manipulate 'ui.R' to create a numeric input and a text input according to the following instructions. 
# Tip: to create two or more input widgets on the same UI, you need to separate the input widget functions in 'ui.R' by a comma.

# Numeric input specifications:
# - Name of the element: 'exerciseNumericInput'
# - Header to be displayed: 'Select your number'
# - Value selected by default: 9999

# Text input specifications:
# - Name of the element: 'exerciseTextInput'
# - Header to be displayed: 'Write your text'
# - Value selected by default: 'Your text goes here...'


#### Exercise 3 ####
# =================================================-
#### Question 1 ####

# Navigate to the 'shiny' folder and the subfolder called 'day-1-exercises'. 
# Inside the folder 'day-1-exercises', create a folder called 'exercise-3'.
# Inside 'exercise-3' create four folders, called 'question-3', 'question-4', 'question-5' and 'question-6'.
print("g2g")

#### Question 2 ####
# In each of the folders called 'question-3', 'question-4', 'question-5' and 'question-6', create a file 'ui.R' that contains the base structure and a file 'server.R' that contains the base structure.
print("g2g")

#### Question 3 ####
# In folder 'question-3', manipulate 'ui.R' and 'server.R' to create a text output to be shown according to the following instructions:

# - Name of the text output element: 'my_exercise_text'
# - Text to be assigned to `my_exercise_text` element: 'Text output for exercise 3 question 3'


#### Question 4 ####
# In folder 'question-4', manipulate 'ui.R' and 'server.R' to create a table output to be shown according to the following instructions:

# - Name of the table output element: 'my_exercise_table'
# - Assign table to output content of 'my_exercise_table' element
# - Define the table with the 'fast_food_data' dataset, to be assigned to output 'my_exercise_table' element


#### Question 5 ####
# In folder 'question-5', manipulate 'ui.R' and 'server.R' to create a plot output to be shown according to the following instructions:

# - Name of the plot output element: 'my_exercise_plot'
# - Assign plot to output content of 'my_exercise_plot' element
# - Define the plot with `Calories` as the y-axis and `Total Fat (g)` as the x-axis, to be assigned to output 'my_exercise_plot' element


#### Question 6 ####
# In folder 'question-6', manipulate 'ui.R' and 'server.R' to create a print output to be shown according to the following instructions:

# - Name of the print output element: 'my_exercise_print'
# - Assign print object to output contents of 'my_exercise_print' element
# - Define the print object as `str(fast_food_data[,1:3])`, to be assigned to output 'my_exercise_print' element


#### Exercise 4 ####
# =================================================-

#### Question 1 ####

# Navigate to the 'shiny' folder and the subfolder called 'day-1-exercises'. 
# Inside the folder 'day-1-exercises', create a folder called 'exercise-4'.
# Inside 'exercise-4' create two folders, called 'question-3' and 'question-4'.

#### Question 2 ####
# In each of the folders called 'question-3' and 'question-4', create a file 'ui.R' that contains the base structure and a file 'server.R' that contains the base structure.


#### Question 3 ####
# In folder 'question-3', manipulate 'ui.R' to add in html tags in UI for the shiny app according to the following instructions:

# - Create a header saying `Adding HTML tags for the exercise` with `tags$h1` tag
# - Create another header saying `Choose the range` with `tags$h3` tag
# - Create a slider range input with 0 as minimum value and 100 as maximum value
# - After three lines of space, add another header saying 'Link to more information' with a `h3` tag
# - Name the slider range as `exerciseSliderRange` and add a label saying `Select your range`
# - Create a paragraph tag that says `More information can be found here:` and displays a hyperlink `RShiny Cheatsheet`
# - Set the href to `https://shiny.rstudio.com/images/shiny-cheatsheet.pdf` for the hyperlink


#### Question 4 ####
# In folder 'question-4', manipulate 'ui.R' and 'server.R' to embed files in the app according to the following instructions:

# - Create a subfolder named `www` inside our shiny app along with `server` and `ui` and add the `ggplot2-cheatsheet.pdf` file and `R-logo.png` file in it
# - You can find the files from `RShiny Day 1 Exercises file` folder in the data folder
# - Create a header saying `Embedding images and pdf files for the exercise` with a html tag `tags$h2` 
# - Embed the image file and the pdf file with three lines of space between each other
# - Set the size of the image as `width=500, height=300`
