# Statistics on crepuscular / twilight behaviour
# relating moonlight illuminance to changes in
# the timing of twilight behaviour

#---- setup environment ----
# stats and data wrangling
library(tidyverse)
library(lme4)
library(report)

#---- 0. read data, subset and calculate data ----

if(!file.exists("data/curated/data_twilight.rds")){

  df <- readRDS("data/data_annotated.rds") |>
    filter(
      group != 0,
      sensor == "MDL",
      (stages == "dawn" | stages == "dusk")
    ) |>
    mutate(
      diff_dusk = date_time - dusk,
      diff_dawn = dawn - date_time,
      species = as.factor(species),
      stages = as.factor(stages)
    )

  # twilight statistics
  tmp <- df |>
    group_by(tag, site, species, date_offset, stages, moon_phase) |>
    summarize(
      moon_illuminance = moon_illuminance[which(flight_height == max(flight_height, na.rm = TRUE))[1]],
      diff_dusk = diff_dusk[which(flight_height == max(flight_height, na.rm = TRUE))[1]],
      diff_dawn = diff_dawn[which(flight_height == max(flight_height, na.rm = TRUE))[1]],
      max_flight_height = max(flight_height, na.rm = TRUE)
    ) |>
    ungroup()

  # unit conversions
  tmp <- tmp |>
    mutate(
      twilight_timing = ifelse(abs(diff_dusk) < abs(diff_dawn), diff_dusk, diff_dawn),
      twilight_timing = twilight_timing/60
    ) |>
    select(
      twilight_timing,
      moon_illuminance,
      moon_phase,
      stages,
      species,
      tag
    )

  # save and compress for reproducibility
  saveRDS(tmp, file = "data/curated/data_twilight.rds", compress = "xz")

} else {
  tmp <- readRDS("data/curated/data_twilight.rds")
}

#--- linear mixed effects model ---

fm <- lmer(
  twilight_timing ~ moon_illuminance + (1|species/tag),
  data = tmp
)

# print the details on the full lagged model
message("Model summary:")
print(summary(fm))
message("----")

message("Writen report:")
print(report(fm, ci_method = "wald"))
message("----")
