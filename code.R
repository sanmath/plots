#Diferentes tipos de gráficos
library(treemap)
library(readxl)
library(grDevices)
library(data.table)
library(readxl)
library(dplyr)
library(stringr)
library(ggplot2)

azul1<-rgb(0,44,106,maxColorValue = 255)
naranja1<-rgb(244,115,32,maxColorValue = 255)
amarillo1<-rgb(255,196,117,maxColorValue = 255)
cafe<-rgb(141,120,95,maxColorValue = 255)
celeste<-rgb(189,210,235,maxColorValue = 255)
base<-rgb(199,139,107,maxColorValue = 255)
azul_oscuro<-rgb(0,33,107,maxColorValue = 255)



ex_hombres<-data.frame(read_excel("Esperanzas_de_vida.xlsx",sheet = 1))
names(ex_hombres)<-c("Provincias","X2010","X2011","X2012","X2013","X2014","X2015","X2016","X2017","X2018","X2019","X2020")
ex_hombres<-data.table(ex_hombres)

ex_mujeres<-data.frame(read_excel("Esperanzas_de_vida.xlsx",sheet = 2))
names(ex_mujeres)<-c("Provincias","X2010","X2011","X2012","X2013","X2014","X2015","X2016","X2017","X2018","X2019","X2020")
ex_mujeres<-data.table(ex_mujeres)

save(ex_hombres,file="ex_hombres.RData")
save(ex_mujeres,file="ex_mujeres.RData")

#Gráfico de Barras para las esperanzas de Vida
par(mfrow=c(1,2))
barplot(ex_hombres[1:25,X2010],col=azul1,ylim=c(0,80),main="Esperanza de Vida \n Hombres 2010",cex.main=0.8,names.arg = ex_hombres[1:25,Provincias],las=2,cex.names = 0.5)
abline(h=mean(ex_hombres[1:25,X2010]),col=naranja1)
barplot(ex_mujeres[1:25,X2010],col=amarillo1,ylim=c(0,80),main="Esperanza de Vida \n Hombres 2010",cex.main=0.8,names.arg = ex_hombres[1:25,Provincias],las=2,cex.names = 0.5)
abline(h=mean(ex_mujeres[1:25,X2010]),col=naranja1)



dat <- data.frame(
  Provincias = factor(ex_hombres[1:25,Provincias], levels=ex_hombres[,Provincias]),
  Edad = ex_hombres[1:25,X2010]
)
ggplot(data=dat, aes(x=Provincias, y=Edad, fill=Provincias)) +
  geom_bar(colour="black", stat="identity")+
  guides(fill=FALSE)+scale_fill_brewer(palette="blue")

"#999999", "#E69F00", "#56B4E9"
