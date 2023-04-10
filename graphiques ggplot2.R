library(MASS)
head(mammals)
library(ggplot2)
ggplot(mammals, aes(x=body,y=brain))+geom_point()

ggplot(mammals, aes(x=body, y=brain))+
  annotation_logticks()+ #graduations log
  geom_point(alpha=0.6)+
  coord_fixed(xlim = c(10^-3,10^4), ylim = c(10^-1,10^4))+
  scale_x_log10()+
  scale_y_log10()+
  #scale_x_log10(expression("body weight(log"["10"]*"(kg))"),
  #              breaks=trans_breaks("log10",function(x) 10^x),
  #              labels=trans_format("log10",math_format(10^.x)))+
  #scale_y_log10(expression("brain weight(log"["10"]*"(g))"),
                
  #              breaks=trans_breaks("log10",function(x) 10^x),
  #              labels=trans_format("log10",math_format(10^.x)))+

  stat_smooth(method="lm",col="red",se=F,size=1)+
  theme_classic()


?mtcars
?scale_x_log10
# trois couches essentielles pour un plot : data, aesthetics, geometries, +4 optiennelles
# aesthetics : color, line etc..
# geometries : histogram, boxplot, camember, courbe 2D, nuage de points..
mtcars


# It plots the mpg (miles per gallon) against the weight (in thousands of pounds). You don't have to change anything about this command.
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()
# In the second call of ggplot() change the color argument in aes() (which stands for aesthetics).
# The color should be dependent on the displacement of the car engine, found in disp
ggplot(mtcars, aes(x = wt, y = mpg, color = disp)) +
  geom_point()

# The size should be dependent on the displacement of the car engine, found in disp
ggplot(mtcars, aes(x = wt, y = mpg, size = disp)) +
  geom_point()

# we have an error because shape only make sense with categorical data, and disp is continuous
ggplot(mtcars, aes(x = wt, y = mpg, shape = disp)) +
  geom_point()

# diamonds data
str(diamonds)
diamonds
# 1 - nuage de point + regression avec gam 
ggplot(diamonds, aes(x = carat, y = price))+
geom_point()+
geom_smooth()


# 2 - Copy the above command but show only the smooth line
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_smooth()



# 3 - Copy the above command and assign the correct value to color (by Clarity) in aes()

ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
 
  geom_smooth()

# 4 - Same color settings from previous command. Plot only the points with argument alpha.
# alpha = 0.4 inside geom_point(). This will make the points 60% transparent/40% visible
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
  geom_point(alpha=0.4)

# Create the object containing the data and aes layers: dia_plot
dia_plot <- ggplot(diamonds, aes(x = carat, y = price))

# Add a geom layer with + and geom_point()
dia_plot <- ggplot(diamonds, aes(x = carat, y = price)) + 
geom_point()

# Add the same geom layer, but with aes() inside
# Note that you can also call aes() within the geom_point() function.
# Map clarity to the color argument in this way.
dia_plot <- ggplot(diamonds, aes(x = carat, y = price)) + 
geom_point(aes(color = clarity))

# 2 - Expand dia_plot by adding geom_point() with alpha set to 0.2
dia_plot <- dia_plot + geom_point(alpha=0.2)

# 3 - Plot dia_plot with additional geom_smooth() with se set to FALSE
# You don't want any error shading, 
# which can be achieved by setting the se = FALSE in geom_smooth().
dia_plot + geom_smooth(se = F)

# 4 - Copy the command from above and add aes() with the correct mapping to geom_smooth()
dia_plot + geom_smooth(aes(color = clarity), se = F)

#### How structure of data influences plots ####
# that means we have to understand the structure of data, and modify it depending on cases
# base plot :
# scatter points 
plot(iris$Sepal.Length,iris$Sepal.Width)
# to add scatter pts of petals 
points(iris$Petal.Length,iris$Petal.Width,col="red") # (limitation of base plots)
# it doesn't redraw new plot, just add points to last draw, may loose data..
# plot is drawn as an image, we just add new thing not an object that we can manipulate
# need to add manually a legend
# not unified framework for plotting, if we want histogram... we need other functions

plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)
plot(mtcars$wt, mtcars$mpg, col = as.factor(mtcars$cyl))

# Use lm() to calculate a linear model and save it as carModel
carModel <- lm(mpg ~ wt, data = mtcars)

# Basic plot
mtcars$cyl <- as.factor(mtcars$cyl)
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)

# Call abline() with carModel as first argument and set lty to 2
abline(carModel, lty = 2) # lty : line type

# Plot each subset efficiently with lapply
# You don't have to edit this code
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)
lapply(mtcars$cyl, function(x) {
  abline(lm(mpg ~ wt, mtcars, subset = (cyl == x)), col = x)
  })

# lapply() function takes as input a vector and a function.
# Then lapply() applies the function it was given to each element of the vector
# and returns the results in a list. In this case, lapply() takes each element
# of mtcars$cyl and calls the function defined in the second argument. This function
# takes a value of mtcars$cyl and then subsets the data so that only rows with
# cyl == x are used. Then it fits a linear model to the filtered dataset and uses
# that model to add a line to the plot with the abline() function.



# This code will draw the legend of the plot
# In base package you have to take care of using the legend() function by yourself.

legend(x = 5, y = 33, legend = levels(mtcars$cyl),
       col = 1:3, pch = 1, bty = "n") 

# using ggplot

# Plot 1: add geom_point() to this command to create a scatter plot
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point()  # Fill in using instructions Plot 1

# Plot 2: include the lines of the linear models, per cyl
# Add a linear model for each subset according to cyl by adding a geom_smooth() layer.
# Inside this geom_smooth(), set method to "lm" and se to FALSE.
# geom_smooth() will automatically draw a line per cyl subset. It recognizes the
# groups you want to identify by color in the aes() call within the ggplot() command.
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point() + # Copy from Plot 1
  geom_smooth(method="lm",se=F)   

# Plot 3: include a lm for the entire dataset in its whole
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
 geom_point() + # Copy from Plot 2
 geom_smooth(method="lm",se=F) + # Copy from Plot 2
 geom_smooth(se=F,linetype=2)   # adding layout with entire dataset lm with gam method

#### aesthetics ####
# the type of variable is very important for ploting with ggplot
# coutnious numeric variables are used in x and y axis
# factors are used in other parameters (col, fill...)

# it's about attributes which will be ploted on x and y axis,
# if we wanna add a 3d variable, we can choose to color the points according 
# to the group from where they came 
# aes(x= , y= , col = )
      # other param of aes :
        # fill : colour of the outline of the shape
        # size : diametre of points, thickness of lines & fontsize of text
        # alpha : transparency (1 is opac)
        # linetype : dash pattern of a line
        # labels : text on a plot or axes
        # shape : shape of the points

mtcars$cyl = as.factor(mtcars$cyl)
mtcars$am = as.factor(mtcars$am)

library(ggplot2)
# 1 - Map mpg to x and cyl to y
ggplot(mtcars, aes(mpg, cyl)) +
  geom_point()
  
# 2 - Reverse: Map cyl to x and mpg to y
ggplot(mtcars, aes(cyl, mpg)) +
  geom_point()

# 3 - Map wt to x, mpg to y and cyl to col
ggplot(mtcars, aes(wt, mpg, col= cyl)) +
  geom_point()

# 4 - Change shape and size of the points in the above plot
ggplot(mtcars, aes(wt, mpg, col= cyl)) +
  geom_point(size = 4,shape =1)


# 1 - Map cyl to fill
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(shape = 1, size = 4)


# 2 - Change shape and alpha of the points in the above plot

ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(shape = 21, size = 4,alpha=0.6)

# 3 - Map am to col in the above plot
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl,col=am)) +
  geom_point(shape = 21, size = 8,alpha=0.6)
?geom_point


# Shapely coding! Notice that mapping a categorical variable onto fill doesn't 
# change the colors, although a legend is generated! This is because the default
# shape for points only has a color attribute and not a fill attribute! Use fill
# when you have another shape (such as a bar), or when using a point that does have
# a fill and a color attribute, such as shape = 21, which is a circle with an outline.
# Any time you use a solid color, make sure to use alpha blending to account for over
# plotting.

# Map cyl to size
ggplot(mtcars, aes(wt, mpg,size=cyl)) +
  geom_point()


# Map cyl to alpha

ggplot(mtcars, aes(wt, mpg,alpha=cyl)) +
  geom_point()

# Map cyl to shape 

ggplot(mtcars, aes(wt, mpg,shape=cyl)) +
  geom_point()

# Map cyl to label
ggplot(mtcars, aes(wt, mpg,label=cyl)) +
  geom_text()

my_color <- "#4ABEFF"

# Draw a scatter plot with color *aesthetic*
ggplot(mtcars, aes(wt, mpg,color=cyl)) +
  geom_point()


# Same, but set color *attribute* in geom layer 

ggplot(mtcars, aes(wt, mpg,size=cyl)) +
  geom_point(color=my_color)


# Set the fill aesthetic; color, size and shape attributes
ggplot(mtcars, aes(wt, mpg,fill=cyl)) +
  geom_point(size=10,shape=23,color=my_color)

# Expand to draw points with alpha 0.5
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl))+
geom_point(alpha=0.6)
  
# Expand to draw points with shape 24 and color yellow
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
geom_point(shape=24,color="yellow")


  
# Expand to draw text with label rownames(mtcars) and color red
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
geom_text(label=rownames(mtcars),color="red")



# Map mpg onto x, qsec onto y and factor(cyl) onto col
ggplot(mtcars, aes(x = mpg, y = qsec, col = factor(cyl)))+
geom_point()


# Add mapping: factor(am) onto shape
ggplot(mtcars, aes(x = mpg, y = qsec, col = factor(cyl),shape=factor(am)))+
geom_point()


# Add mapping: (hp/wt) onto size
ggplot(mtcars, aes(x = mpg, y = qsec,shape=factor(am), col = factor(cyl),size=(hp/wt)))+
geom_point()

library(gapminder)
library(ggplot2)

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Scatter plot comparing pop and lifeExp, faceted by continent
ggplot(gapminder_1952,aes(pop,lifeExp))+
geom_point()+
facet_wrap(~continent)+ # réer un graph pour chaque continent
scale_x_log10()


ggplot(gapminder,aes(gdpPercap,lifeExp,color=continent,size=pop))+
geom_point()+
scale_x_log10()+
facet_wrap(~year)

# exemple web :

sd <- 10

library(ggplot2)
ggplot(df, aes(cat, means)) +
geom_bar(aes(fill = cat), stat = "Identity", width = 0.75) +
geom_errorbar(aes(ymin = means - sd, ymax = means + sd),
width = 0.2, position = position_dodge(0.9)) +
geom_line(data = df1, aes(a, b)) +
annotate("text", x = 2, y = 350, label = "*", size = 8) +
scale_fill_grey(start = 0.4, end = 0.8) +
labs(y = "Mean",
fill = NULL) +
theme(legend.position = "none",
axis.text.y = element_text(family = "Arial",size=14,face = "bold"),
axis.text.x = element_text(family = "Arial", size = 16, face = "bold"),
axis.title.x = element_blank(),
axis.title.y = element_text(family = "Arial",size = 16, face = "bold"))
