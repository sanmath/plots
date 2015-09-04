# devtools::install_github("ropensci/plotly")
# devtools::install_github("mapping", "jaredlander")
# devtools::install_github("sjmgarnier/viridis")
Sys.setenv("plotly_username" = "boriscout")
Sys.setenv("plotly_api_key" = "6dhvua95f6")

library(plotly)
library(ddply)
#signup("id","mail",save=TRUE)



# p <- plot_ly(economics, x = date, y = uempmed)
# p
wmap<-readShapeLines("DEMOGRAFICO/prov_pop01.shp")
#wmap <- readOGR(dsn="DEMOGRAFICO/prov_pop01.shp", layer="prov_pop01")
names(wmap)
# convert to dataframe
wmap_df <- fortify(wmap)

View(wmap_df)
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


mapa_Ecuador<-ggplot(wmap_df, aes(long,lat, group=group)) + 
  geom_polygon(col="black",lwd=0,aes(fill="azul1")) + 
  labs(title="Ecuador") + 
  coord_equal() + 
  theme_opts


mapa_Ecuador

geom_text(data=wmap_df, aes(long, lat, label = id), size=2)
View(wmap)
wmap

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
