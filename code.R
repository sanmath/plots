#Diferentes tipos de gráficos
install.packages("treemap",dependencies=TRUE)
library(treemap)
library(readxl)
library(grDevices)
library(data.table)
library(readxl)
library(dplyr)
library(stringr)

azul1<-rgb(0,44,106,maxColorValue = 255)
naranja1<-rgb(244,115,32,maxColorValue = 255)
amarillo1<-rgb(255,196,117,maxColorValue = 255)
cafe<-rgb(140,120,95,maxColorValue = 255)



ex_hombres<-data.frame(read_excel("Esperanzas_de_vida.xlsx",sheet = 1))
names(ex_hombres)<-c("Provincias","X2010","X2011","X2012","X2013","X2014","X2015","X2016","X2017","X2018","X2019","X2020")
ex_hombres<-data.table(ex_hombres)

ex_mujeres<-data.frame(read_excel("Esperanzas_de_vida.xlsx",sheet = 2))
class(ex_hombres)
names(ex_hombres)

library(data.table)



barplot(ex_hombres[1:25,X2010],col=azul1,ylim=c(0,80),main="Esperanza de Vida",cex.main=0.8,names.arg = ex_hombres[1:25,Provincias],las=2,cex.names = 0.5)
abline(h=mean(ex_hombres[1:25,X2010]),col=naranja1)

barplot(rep(NA,length(y)),ylim=c(0,max(y)),axes=FALSE)
abline(h=mean(y))
barplot(y, add=T)


ex_hombres<-data.table(ex_hombres)
names(ex_hombres)
barplot(,ex_hombres[,X2010])
barplot[]
library(ggplot2)
ggplot(ex_hombres, aes(x = )) + geom_bar(ex_hombres[,X2010])

ggplot(ex_hombres[,Provincias], aes(x = Level)) + geom_bar()


ex_hombres[,Provincias]

treemap(ex_hombres,fontsize.labels=8,force.print.labels=FALSE,fontface.labels=2,overlap.labels=0.5,
        index = c("PROVINCIAS..","X2020"),vSize = "X2020",vColor="PROVINCIAS..",type = "index",algorithm="squarified")
treemap(e1,index = c("PROVINCIAS..","X2010"),vSize = "X2010",vColor="PROVINCIAS..",type = "index",algorithm="squarified")


names(ex_hombres)<-c("Provincias","X2010","X2011","X2012","X2013","X2014","X2015","X2016","X2017","X2018","X2019","X2020")
x<-as.vector(ex_hombres[1,2:11])
y<-c(2010:2020)
dim(t(x))
x
cbind(t(x),t(y))
plot()
