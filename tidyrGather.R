df<- read.table(text =c("
A       B       C       G       Xax
0.451   0.333   0.034   0.173   0.22        
0.491   0.270   0.033   0.207   0.34    
0.389   0.249   0.084   0.271   0.54    
0.425   0.819   0.077   0.281   0.34
0.457   0.429   0.053   0.386   0.53    
0.436   0.524   0.049   0.249   0.12    
0.423   0.270   0.093   0.279   0.61    
0.463   0.315   0.019   0.204   0.23"), header = T)
df

library(tidyr)
library(ggplot2)

df %>% tidyr::gather("id", "value", 1:4) %>% 
  ggplot(., aes(Xax, value))+
  geom_point()+
  geom_smooth(method = "lm", se=FALSE, color="black")+
  facet_wrap(~id)

# on a le data frame df
# >%> on lui applique une transfo gather() puis on applique un plot
# sur le resultat >%> ggplot()+...

df %>% tidyr::gather("id", "value", 1:4)
