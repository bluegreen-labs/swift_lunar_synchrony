# Statistical analysis of the MDL geolocator
# data, modelling nighttime flight height (high/low)
# as a function of moonlight illuminance

#---- setup environment ----
library(tidyverse)
library(glmmTMB)
library(report)

#---- 0. read in data and subset ----

if(!file.exists("data/curated/data_MDL.rds")){

  # read in data and subset the multi data logger
  # select only night values
  # drop those with missing lagged altitude values
  # at the start of a day centered on midnight
  # and not belonging to stationary periods (group = 0)
  df <- readRDS("data/data_annotated.rds") |>
    filter(
      sensor == "MDL",
      !is.na(lag_altitude),
      stages == "night",
      group != 0
    )

  # Scaling needs to happen to make sure
  # that these are processed correctly between tags/species
  # as the changes in flight height are tag/species specific
  df <- df |>
    group_by(tag) |>
    mutate(
      lag_altitude = as.vector(scale(lag_altitude))
    ) |>
    select(
      altbin,
      moon_illuminance,
      species,
      lag_altitude,
      tag
    )

  # save and compress for reproducibility
  saveRDS(df, file = "data/curated/data_MDL.rds", compress = "xz")

} else {
  df <- readRDS("data/curated/data_MDL.rds")
}

#---- 1. fit model ----

# basic model without any lag
fm_no_lag <- glmmTMB(
  altbin ~ moon_illuminance + species + (1|species/tag),
  data = df,
  family = binomial
)

# print the details on the full lagged model
message("Model summary (no lag):")
print(summary(fm_no_lag))
message("----")

# lagged model, taking the previous flight height into account
# addressing auto-correlations concerns (see Evens et al. 2020)
fm_lagged <- glmmTMB(
  altbin ~ moon_illuminance + lag_altitude + species + (1|species/tag),
  data = df,
  family = binomial
)


# the zero inflated version of the model addressing the abundance
# of zero values
fm_zero_inflated <- glmmTMB(
  altbin ~ moon_illuminance + lag_altitude + species + (1|species/tag),
  data = df,
  family = binomial,
  ziformula = ~1
)

# compare all models using an AIC metric
print(AIC(fm_no_lag,fm_lagged, fm_zero_inflated))

# compare autocorrelation metrics between
# the lagged and non-lagged model (only
# consider first order lag)
ac1 <- acf(resid(fm_no_lag), plot = FALSE, lag.max = 1)
ac2 <- acf(resid(fm_lagged), plot = FALSE, lag.max = 1)

message("Auto-correlation:")
print(ac1)
print(ac2)
message("----")

# print the details on the full lagged model
message("Model summary (lagged):")
print(summary(fm_lagged))
message("----")

message("Writen report:")
print(report(fm_lagged, ci_method = "wald"))
message("----")

#----- 2. save model for plotting ----
saveRDS(fm_lagged, file = "data/model_fit_MDL.rds", compress = "xz")
