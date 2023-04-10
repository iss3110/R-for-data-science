library(tidyr)

#### tidyr package ####




# principles of tidy data :
# Each obs forms a row, each variable forms a column, and each type of observational
# unit forms a table.
# each value belongs to a variable and an obs
# observations are rows
# variables are columns


# messy data:
# column headers are values not variable names




#             gather(data, my_key, my_val, -col)
# cette fonction remet des "variables" comme données, par exemple, un jeu de donné
# avec des noms de colonnes 1980, 1981, 1982, 1983... permet d'avoir une seule
# colonne comme Year qui contient les années...
# -col : we want to "gather" the columns of data, into key-value pairs, except the column
# col, the dataframe data contains values in the head of columns, except col.
# my_key : bare name of new key column 
# my_val : bare name of  new value column

# spread()
# spread(df, my_key, my_val) do the inverse of gather
# une colonne par exemple "type" peut contenir 3 types d'animaux, il peut étre judicieux
# de créer une variable pour chaque type d'animal, cette fonction va donc élargir (wide)

# separate() # séparer une colonne en deux
# unite() # l'inverse, rassembler deux colonnes en une

irisll=gather(iris,key,val,-Species)
irisll

# separate 
# bmi_cc_clean <- separate(bmi_cc, col = Country_ISO, into = c("Country", "ISO"),
                    #     sep = "/")

# taht separates the column Country_ISO into two columns..


#### coerce type of variables (lubridate) + stringr ####

# from string to date : 

# Definition of character strings representing times
str1 <- "May 23, '96 hours:23 minutes:01 seconds:45"
str2 <- "2012-3-12 14:23:08"

# Convert the strings to POSIXct objects: time1, time2
time1 <- as.POSIXct(str1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
time2 <- as.POSIXct(str2)

# Convert times to formatted strings
format(time1,"%M")
format(time2,"%I:%M %p")
# format() : extract some usefull strings from times and date,
# see ?strptime for full conversion symbols

# DATES
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date3 <- as.Date(str3, format = "%d/%B/%Y")

format(date3,"%b %Y")

library(lubridate)

ymd("2005, august 25")
dmy("31 nomvember 1298")
hms("15-53-50")
ymd_hms("2004/11/21 3.23.54")
as.integer(TRUE)
dmy("24/11/1987")


#### tidy data (data rangés) ####

gather(df,key,val,c(-var1,-var2,-var3,-var4),na.rm=T)
# mis à part les var1:var4, le reste des variables se transorme en valeurs

spread(df,column_with_var_not_values,value)
# spread function transforms values of a column into new variables

# iris.tidy
# str(iris.tidy)
# 'data.frame':	600 obs. of  4 variables:
# $ Species: Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
# $ Part   : chr  "Sepal" "Sepal" "Sepal" "Sepal" ...
# $ Measure: chr  "Length" "Length" "Length" "Length" ...
# $ Value  : num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...


ggplot(iris.tidy, aes(x = Species, y = Value, col = Part)) +
  geom_jitter() +
  facet_grid(. ~ Measure)

library(tidyr)

# Fill in the ___ to produce to the correct iris.tidy dataset
iris.tidy <- iris %>%
  gather(key, value, -Species) %>%      # Species
  separate(key, c("Part", "Measure"), "\\.")   # Part, Measure

str(iris.tidy)
head(iris.tidy)
head(iris)
# a dataset is called tidy when every row is an observation and every column is
# a variable. The gather() function moves information from the columns to the rows.
# It takes multiple columns and gathers them into a single column by adding rows. 
# The separate() function splits one column into two or more columns according to 
# a pattern you define. Lastly, the %>% (or "pipe") operator passes the result of 
# the left-hand side as the first argument of the function on the right-hand side.

# gather() rearranges the data frame by specifying the columns that are categorical
# variables with a - notation. Complete the command. Notice that only one variable 
# is categorical in iris.
# separate() splits up the new key column, which contains the former headers,
# according to .. The new column names "Part" and "Measure" are given in a character
# vector. Don't forget the quotes.

#  head(iris.wide)
#  Species  Part Length Width
# 1  setosa Petal    1.4   0.2
# 2  setosa Petal    1.4   0.2


library(tidyr)

# Add column with unique ids (don't need to change)
iris$Flower <- 1:nrow(iris)

# Fill in the ___ to produce to the correct iris.wide dataset
iris.wide <- iris %>%
  gather(key, value, -Species, -Flower) %>%
  separate(key, c("Part", "Measure"), "\\.") %>%
  spread(Measure, value)
head(iris.wide)

# Before you begin, you need to add a new column called Flower that contains a unique
# identifier for each row in the data frame. This is because you'll rearrange the 
# data frame afterwards and you need to keep track of which row, or which specific 
# flower, each value came from. It's done for you, no need to add anything yourself.

# gather() rearranges the data frame by specifying the columns that are categorical 
# variables with a - notation. In this case, Species and Flower are categorical. 
# Complete the command.
# separate() splits up the new key column, which contains the former headers, 
# according to .. The new column names "Part" and "Measure" are given in a character
# vector.
# The last step is to use spread() to distribute the new Measure column and 
# associated value column into two columns.

#### stringr package ####

library(stringr)

# Split (diviser) names from birth year
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split_math <- strsplit(pioneers, split = ":")
str(split_math)
unlist()


# diviser une chaine de caractère (en caractères)
strsplit()
rquote <- "r's internals are irrefutably intriguing"
chars <- strsplit(rquote, split = "")[[1]]


str_trim("    c'est   un test    ") # attention à " ' " de c'est
"c'est   un test"

str_pad("2441",width=7,side="left",pad="0") # width : la longeur souhaitée du string 

friends=c("issam","nabil","amine")
str_detect(friends,"issam")
str_replace(friends,"issam","yassine")
?str_replace

grep()
grepl()

sub()
gsub()


tolower("I'm Beasy")
"i'm beasy"

toupper("i'm beasy")
"I'M BEASY"

awards <- c("Won 1 Oscar.",
            "Won 1 Oscar. Another 9 wins & 24 nominations.",
            "1 win and 2 nominations.",
            "2 wins & 3 nominations.",
            "Nominated for 2 Golden Globes. 1 more win & 2 nominations.",
            "4 wins & 1 nomination.")

sub(".*\\s([0-9]+)\\snomination.*$", "\\1", awards)

#### missing values ####

any(is.na(dataframe))
sum(is.na(dataframe))

summary(df)

# to find rows with no NA :
complete.cases(df)

# to keep only rows with complete cases
df[complete.cases(df), ]

# un equivalent
na.omit(df)

#### outlier values ####
set.seed(10)
x <- c(rnorm(30, mean=15, sd=5),-5,28,35)
boxplot(x,horizontal = T)
hist(df$attribute, breaks=20, right=FALSE) # right = F to omit negative values 

#### other importing ... ####

library(readxl)
excel_sheets(character_excel)

library(tidyverse)
# import character_table, where strings are separated by each line, 
read_lines(character_table) 

library(readr)
# Import character_chart which is a flat file with a semi-colon (";") as
# the separator/delimiter
read_delim(character_chart, delim =";")

library(httr)
get(url,query=params)

library(rvest)
# Extract the table of capitals, to create a data frame from imported HTML object
html_table(capitals) %>%
  head(n = 3)

library(tidyverse)
# importing first 3 rows
read_csv(character_table, n_max = 3)

library(readxl)
read_excel(character_excel, sheet = 2, range = 'A1:C3')
# Import cells A1 through C3 from the second sheet

library(tidyr)
separate(costs, col = value, into = c("currency", "amount"))
# to separate a column into 2 columns

library(tidyr)
yearly_price %>%
  replace_na(replace = list(value = 5))

library(rvest)
# return a link from html object
html_attr(paragraph, 'href')