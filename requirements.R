library(devtools)

install_version("lubridate","1.6.0")
install_version("automap", "1.0-14")
install_version("cartogram", "0.0.2")
install_version("epitools", "0.5-7")
install_version("ggplot2", "2.2.1")
install_version("gstat", "1.1-4")
install_version("mapmisc", "1.5.0")
#install_version("R2BayesX", "1.1-0")
install_github("datacamp/R2BayesX")
install_version("raster", "2.5-8")
install_version("rgdal", "1.2-5")
install_version("rgeos", "0.3-22")
install_version("sp", "1.2-4")
install_version("spatialkernel", "0.4-19")
# CRAN version of spatstat fails on DataCamp platform
install_github("baddstats/polyclip")
install_github("spatstat/spatstat.utils")
install_github("spatstat/spatstat")
install_version("spdep", "0.6-11")
install_version("splancs", "2.01-39")

data_dir <- "/usr/local/share/datasets"
dir.create(data_dir)

download.file(
  "http://s3.amazonaws.com/assets.datacamp.com/production/course_3070/datasets/pcrime-spatstat.rds",
    file.path(data_dir, "pcrime-spatstat.rds")
    )

download.file(
  "http://s3.amazonaws.com/assets.datacamp.com/production/course_3070/datasets/seg-1000.rds",
    file.path(data_dir, "seg-1000.rds")
    )

download.file(
  "http://s3.amazonaws.com/assets.datacamp.com/production/course_3070/datasets/osm_preston_gray.rds",
    file.path(data_dir, "osm_preston_gray.rds")
    )

download.file(
  "http://s3.amazonaws.com/assets.datacamp.com/production/course_3070/datasets/sasquatch.rds",
    file.path(data_dir, "sasquatch.rds")
    )

download.file(
  "http://s3.amazonaws.com/assets.datacamp.com/production/course_3070/datasets/london_eu.rds",
    file.path(data_dir, "london_eu.rds")
    )

download.file(
  "http://s3.amazonaws.com/assets.datacamp.com/production/course_3070/datasets/london_2017_2.rds",
    file.path(data_dir, "london_2017_2.rds")
    )

download.file(
  "http://s3.amazonaws.com/assets.datacamp.com/production/course_3070/datasets/ca_geo.rds",
    file.path(data_dir, "ca_geo.rds")
    )

download.file(
  "http://s3.amazonaws.com/assets.datacamp.com/production/course_3070/datasets/ca_geo_bounds.rds",
    file.path(data_dir, "ca_geo_bounds.rds")
)
