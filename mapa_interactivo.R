# devtools::install_github("ropensci/plotly")
# devtools::install_github("mapping", "jaredlander")
# devtools::install_github("sjmgarnier/viridis")
Sys.setenv("plotly_username" = "boriscout")
Sys.setenv("plotly_api_key" = "6dhvua95f6")
library(scales)
library(plotly)
library(Cairo)
#signup("id","mail",save=TRUE)

View(wmap)
ec<-readOGR("ECU_adm1.shp","ECU_adm1")
plot(ec)
# p <- plot_ly(economics, x = date, y = uempmed)
# p
#Leemos el archivo shp
wmap<-readOGR(dsn="ECU_adm1.shp",layer="ECU_adm1")
View(wmap)
# convert to dataframe... así obtenemos el mapa con las coordenadas
  wmap<-wmap[wmap$ID_1!="9",]
wmap_df <- fortify(wmap,region="NAMES_1")
names(wmap_df)
#El ID es el nombre de la provincia
plot(wmap)
theme_opts <- list(theme(panel.grid.minor = element_blank(),
                         panel.grid.major = element_blank(),
                         panel.background = element_blank(),
                         plot.background = element_rect(fill=amarillo1),
                         panel.border = element_blank(),
                         axis.line = element_blank(),
                         axis.text.x = element_blank(),
                         axis.text.y = element_blank(),
                         axis.ticks = element_blank(),
                         axis.title.x = element_blank(),
                         axis.title.y = element_blank(),
                         plot.title = element_text(size=20)))

names(wmap_df)
names(wmap)

mapa_Ecuador<-ggplot(wmap_df, aes(long,lat, group=group)) + 
  geom_polygon(col="blue",fill="yellow") + 
  labs(title="Ecuador") + 
  coord_equal() + 
  theme_opts+
  geom_text(data=wmap, aes(long, lat, label ="NAME_1" ), size=2)

mapa_Ecuador
View(wmap)
ggsave("map1.png",  width=12.5, height=8.25, dpi=72)
ggplotly(mapa_Ecuador)

names(wmap_df)
library(maps)
View(us.cities)
View(names(us.cities))
big_cities <- subset(us.cities, pop > 500000)
qplot(long, lat, data = big_cities) + borders("state", size = 0.5)

 ia <- map_data("county", "iowa")
 mid_range <- function(x) mean(range(x, na.rm = TRUE))
 centres <- ddply(ia, .(subregion),
                   + colwise(mid_range, .(lat, long)))
 ggplot(ia, aes(long, lat)) +
   geom_polygon(aes(group = group),
                 + fill = NA, colour = "grey60") +
   geom_text(aes(label = id), data = centres,
              + size = 2, angle = 45)
View(wmap_df)
head(wmap_df)
wmap[PROVINCIA]
coordinates(wmap)
ia <- map_data("county", "iowa")
class(ia)

library(maps)
View(us.cities)
class(wmap)
table(mama$PROVINCIA)
