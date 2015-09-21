library(datasets)
library(ggplot2)
data(mtcars)
g=ggplot(data=mtcars)

#Exploratory:
summary(lm(mpg~am,data=mtcars)) #Significant so probably connection exists (unlikely that cofounders nullify)
g+geom_boxplot(aes(factor(am),mpg,fill=factor(am)))+labs(title="MPG for manual automatic cars",x="Trasmission", y="MPG")+theme(legend.position="none")+scale_x_discrete(labels=c("Automatic","Manual"))

