#### matrix ####
matrix(vect, byrow=T, nrow=, dimnames= list(vect_rownames,vect_colnames))

rowSums(matA) # somme des lignes

colSums(matA) # somme des colonnes

# adding column or multiple columns to a matrix
cbind(mat, vect)
cbind(matA, matB)

rbind()
#### factors ####

temperature_vector <- c("High", "Low", "High","Low", "Medium")
factor_temperature_vector <- factor(temperature_vector, order = TRUE, levels = c("Low", "Medium", "High"))

#### loops ####

while(cond){
  # treatment
  # modify "cond", so the loop can exit one moment
  if(cond2) {
    break # exit from while loop
  }
}
cities=c("aadir","bnimella","casa","rabat")
for(i in 1:length(cities)){
  print(paste(cities[i],"est dans la position",i,"dans le vecteur"))
}

for(city in cities){
  print(paste(city,"est dans la position",which(cities==city),"dans le vecteur"))
}
# nchar and next
for(city in cities){
  if(nchar(city)>5){
    next
  }
  print(city)
}
#### lapply..... sapply. ####

# lapply() is used on lists, otherwise, R language is vectorial
# it applies a function on every element of the list.

listt=list(pop=8548, b=c("agadir","bnimellal","casa","rabat"), cap=F)
lapply(listt,class)

lapply(listt$b,nchar)
# lapply returns a list, so use unlist function

unlist(lapply(listt$b,nchar))

# use it with our functions, having arguments !
unlist(lapply(oil_price,multiple,f=3))

multiple=function(x,f){
  return(x*f)
}

oil_price=c(4,2,3,7)
moil=multiple(oil_price,2)


pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
# split names from years
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Write function select_first()
select_first <- function(x) {
  x[1]
}

# Apply select_first() over split_low: names
names=lapply(split_low,select_first)

# using lapply() with anonymous function
years <- lapply(split_low, function(x) {x[2]})
unlist(years)

lapply(list(a=154,b="cada",c=T,d=c("aa","bb","ca")),
       str_replace_all,pattern="a",replacement="haw")
# IMPORTANT : lapply always return a list, with the same length of the input list or vector !
# sapply() : try to simplify the list to array (tableau)
# vapply() : explicitly specify output format, so we have to specify the function's output

temp=list(c(1,5,-5,7,9),c(-5,-3,0,5,2),c(6,1,-2,21,11))
temp

vapply(temp, function(x, y) { mean(x) > y }, y = 5,logical(1))


#### regular expressions trouver, remplacer string ####

grep("mot à chercher",string) # donne les indices des elements trouvés, ^p, p$ (p au début, p à la fin)
grepl() # retourne T/F si l'element est trouvé dans la chaine de caractère
grep(pattern = , x)
# sub() remplace une chaine de caractère.. (la 1ere rencontré), gsub() pour all changing
sub("@.*\\.edu$","@datacamp.edu","john.doe@ivyleague.edu")
sub(pattern , replacement = , x)
