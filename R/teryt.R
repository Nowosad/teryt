library('raster')
library('sp')
library('rgdal')
library('rgeos')

powiaty <- shapefile("raw_data/powiaty.shp", encoding='CP1250')
head(powiaty) # kod TERYT to zmienna jpt_kod_je

centroidy_powiatow <- gCentroid(powiaty, byid=TRUE)
plot(powiaty) # kilka chwil trzeba poczekać
points(centroidy_powiatow, pch=2) # kilka chwil trzeba poczekać

centroidy_powiatow <- SpatialPointsDataFrame(centroidy_powiatow, powiaty@data)
centroidy_powiatow@data <- cbind(centroidy_powiatow@data, as.data.frame(coordinates(centroidy_powiatow)))

saveRDS(centroidy_powiatow, file='data/centroidy_powiatow.rds')
