library(readxl)
library(choroplethr)
library(choroplethrMaps)
library(ggmap)
library(RColorBrewer)
library(classInt)
library(maps)       # Provides functions that let us plot the maps
library(mapdata)    # Contains the hi-resolution points that mark out the countries.
library(rgdal)
Ecu_prov<-readOGR("DEMOGRAFICO/prov_pop01.shp",layer="prov_pop01")
names(Ecu_prov)
prov<-as.vector(Ecu_prov$PROVINCIA)
plot(Ecu_prov)
centroides<-coordinates(Ecu_prov)
text(centroides,prov,cex=0.4)
lifex<-data.frame(read_excel("life_expectancy.xlsx"))
row.names(lifex)<-lifex$id
row.names(Ecu_prov)
row.names(lifex)<-row.names(Ecu_prov)
names(lifex)<-c("id","PROVINCIA","Esperanza_de_vida")
Ecu_prov.data<-SpatialPolygonsDataFrame(Ecu_prov,lifex)





Mapa_Ecuador<-plot(Ecu_prov,col=c(azul1,amarillo1,"red",celeste,cafe,base,azul_oscuro,naranja1),main="Esperanza de Vida")
text(centroides,prov,cex=0.4)

