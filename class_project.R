library(datasets)
library(ggplot2)
library(reshape2)
data(mtcars)
g=ggplot(data=mtcars)

# Exploratory:
summary(lm(mpg~am,data=mtcars)) #Significant so probably connection exists (unlikely that cofounders nullify)
ggplot(data=mtcars)+geom_boxplot(aes(factor(am),mpg,fill=factor(am)))+labs(title="MPG for manual automatic cars",x="Trasmission", y="MPG")+theme(legend.position="none")+scale_x_discrete(labels=c("Automatic","Manual"))

# Naive model
fit1=lm(mpg~am,data=mtcars)
summary(fit1)

# Possible confounders
cormt=cor(mtcars)
melmt=melt(cormt[,c(1,9)])
ggplot(data=melmt,aes(x=Var1,y=Var2,fill=value)) + geom_tile(color="black") + scale_fill_gradient2(low="brown3",high="chartreuse3",mid="white",limit=c(-1,1))+geom_text(aes(Var1,Var2,label=round(value,2)),size=4,color="black")+labs(title="MPG and Transmission Covariates", x="",y="Covariates",fill="Correlation")
