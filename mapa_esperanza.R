library(readxl)
library(choroplethr)
library(choroplethrMaps)
library(ggmap)
library(RColorBrewer)
library(classInt)
library(maps)       # Provides functions that let us plot the maps
library(mapdata)    # Contains the hi-resolution points that mark out the countries.
library(rgdal)
library(maptools)
Sys.setenv("plotly_username" = "boriscout")
Sys.setenv("plotly_api_key" = "6dhvua95f6")
#Leemos el archivo shapefile,
#este cuenta con información geográfica para hacer el mapa.
Ecu_prov<-readOGR("DEMOGRAFICO/prov_pop01.shp",layer="prov_pop01")
names(Ecu_prov)
prov<-as.vector(Ecu_prov$PROVINCIA)
plot(Ecu_prov)
#calculamos los centroides de cada provincia
centroides<-coordinates(Ecu_prov)
#Escribimos el texto correspondiente a los nombres de cada provincia en cada centroide
text(centroides,prov,cex=0.4)
lifex<-data.frame(read_excel("life_expectancy.xlsx"))
row.names(lifex)<-lifex$id
row.names(Ecu_prov)
row.names(lifex)<-row.names(Ecu_prov)
names(lifex)<-c("id","PROVINCIA","Esperanza_de_vida")
Ecu_prov.data<-SpatialPolygonsDataFrame(Ecu_prov,lifex)




Mapa_Ecuador<-plot(Ecu_prov,col=c(azul1,amarillo1,"red",celeste,cafe,base,azul_oscuro,naranja1),main="Esperanza de Vida")
text(centroides,prov,cex=0.4)


library(ggplot2); library(maps)

county_df <- map_data('county')  #mappings of counties by state
ny <- subset(county_df, region=="new york")   #subset just for NYS
cnames <- aggregate(cbind(long, lat) ~ subregion, data=ny, 
                    FUN=function(x)mean(range(x)))
newyork<-ggplot(ny, aes(long, lat)) +  
  geom_polygon(aes(group=group), colour='black', fill=NA) +
  geom_text(data=cnames, aes(long, lat, label = subregion), size=2) +
  coord_map()

ggplotly(newyork)
