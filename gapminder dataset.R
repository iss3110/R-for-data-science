
install.packages("gapminder")
library(gapminder)
library(dplyr)
library(stringr)


head(gapminder)
head(gapminder$country)
unique(gapminder$country)
gapminder$country=="Morocco"
sum(gapminder$country=="Morocco")
# 12 
idx <- which(gapminder$country=="Morocco")
idx
gapminder[idx,]

mor <- gapminder[idx]
mor

str_detect(gapminder)
# ?str_detect
#### l'opérateur %>% pipe (tuyau) ####
# Filter the gapminder dataset for the year 1957
gapminder %>% 
  filter(year=="1957")

gapminder %>% 
  filter(year=="2002" & country=="China")
# arrange() pour trier

gapminder %>%
  arrange(desc(gdpPercap))

gapminder %>%
  filter(year=="2007") %>%
  arrange(desc(gdpPercap))

# mutate() pour changer le dataset (ajouter un colonne modifier...)
# MAIS, comme filter et arrange, mutate ne modifie pas le dataset d'origine, elle 
# crée juste un nouveau dataframe

# Ici on crée a new colomn gdp, we filter on year 2007, then we sort on gdp :
pib_trie_2007 = gapminder %>%
  mutate(gdp=gdpPercap*1000000) %>%
  filter(year=="2007")%>%
  arrange(desc(gdp))
str(pib_trie_2007)
grep("Morocco",gapminder$country)
gapminder[1021:1032,]

#### with ggplot ####

ggplot(gapminder,aes(gdpPercap,lifeExp,color=continent,size=pop))+
  geom_point()+
  scale_x_log10()+
  facet_wrap(~year)

#### summarize verb ####
gapminder %>%
  summarize(medianLifeExp=median(lifeExp),maxlife=max(lifeExp),maxgdp=max(gdpPercap))
gapminder[gapminder$lifeExp==max(gapminder$lifeExp),]
summarize(median(),min(),max(),mean(),sum(),sd())

#### group by verb ####

gapminder %>%
  filter(year==1957) %>%
  group_by(continent) %>%
  summarize(meanLifeExp=mean(lifeExp))

gapminder %>%
  group_by(year,continent) %>%
  summarise(menLifeExp=mean(lifeExp))

#### ggplot summaries.. + multi plot + bar plot ####

# Summarize the median GDP and median life expectancy per continent in 2007
by_continent_2007 = gapminder %>%
  filter(year==2007) %>%
  group_by(continent) %>%
  summarize(medianGdpPercap=median(gdpPercap),medianLifeExp=median(lifeExp))
library(ggplot2)

# Use a scatter plot to compare the median GDP and median life expectancy
ggplot(by_continent_2007,aes(medianGdpPercap,medianLifeExp,color=continent))+
  geom_point()+
  expand_limits(y=0)


by_year = gapminder %>%
  group_by(year) %>%
  summarize(medianGdpPercap=median(gdpPercap),meangdp=mean(gdpPercap))

# multi plot
ggplot(by_year)+
  geom_line(aes(year,medianGdpPercap),color="blue")+
  geom_line(aes(year,meangdp),color="red")+
  expand_limits(y=0)

# bar plot geom_col()

oceania_1952=gapminder%>%
  filter(year==1952 , continent=="Oceania")

# Create a bar plot of gdpPercap by country
ggplot(oceania_1952,aes(country,gdpPercap))+
  geom_col()

# geom_histogram()

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Create a histogram of population (pop), with x on a log scale
ggplot(gapminder_1952,aes(pop))+
  scale_x_log10()+
  geom_histogram()

# boxplot()

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Add a title to this graph: "Comparing GDP per capita across continents"
ggplot(gapminder_1952, aes(x = continent, y = gdpPercap)) +
  geom_boxplot() +
  ggtitle("Comparing GDP per capita across continents")+
  scale_y_log10()


