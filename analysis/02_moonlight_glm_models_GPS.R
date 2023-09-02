# Statistical analysis of the GPS geolocator
# data, modelling nighttime flight height (high/low)
# as a function of moonlight illuminance

#---- setup environment ----
library(tidyverse)
library(glmmTMB)
library(report)

#---- 0. read in data and subset ----

df <- readRDS("data/curated/data_GPS.rds")

#---- 1. fit model ----

fm <- glmmTMB(
  altbin ~ moon_illuminance + species + (1|species/tag),
  data = df,
  family = binomial
)

# print the details on the full lagged model
message("Model summary:")
print(summary(fm))
message("----")

message("Writen report:")
print(report(fm, ci_method = "wald"))
message("----")

#---- 2. save model for plotting ----
saveRDS(fm, file = "data/model_fit_GPS.rds", compress = "xz")
