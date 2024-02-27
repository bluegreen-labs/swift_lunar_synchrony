# Evaluating the effects of moonlight on the vertical flight profiles of three western palearctic swifts

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7814214.svg)](https://doi.org/10.5281/zenodo.7814214)

Koen Hufkens, Christoph M. Meier, Ruben Evens, Josefa Arán Paredes, Hakan Karaardiç, Stef Vercauteren, Ann Van Gijsel, James W. Fox, Carlos Miguel Pacheco, Luis P. da Silva, Sandra Fernandes, Pedro Henriques, Gonçalo Elias, Luís T. Costa, Martin Poot, Lyndon Kearsley

## Abstract

Recent studies have suggested the presence of moonlight mediated behaviour in avian aerial insectivores, such as swifts. Here, we use the combined analysis of state-of-the-art activity logger data across three swift species, the Common, Pallid and Alpine swifts, to quantify flight height and activity in responses to moonlight driven crepuscular and nocturnal light conditions. Our results show a significant response in flight heights to moonlight illuminance for Common and Pallid swifts, i.e. when moon illuminance increased flight height also increased, while a moonlight driven response is absent in Alpine swifts. We show a weak relationship between night-time illuminance driven responses and twilight ascending behaviour, suggesting a decoupling of both crepuscular and night-time behaviour. We suggest that swifts optimise their flight behaviour to adapt to favourable night-time light conditions, driven by light responsive and size-dependent vertical insect stratification and weather conditions.

> Please cite as: Hufkens Koen, Meier Christoph M., Evens Ruben, Paredes Josefa Arán, Karaardiç Hakan, Vercauteren Stef, Van Gysel Ann, Fox James W., Pacheco Carlos Miguel, da Silva Luis P., Fernandes Sandra, Henriques Pedro, Elias Gonçalo, Costa Luís T., Poot Martin and Kearsley Lyndon. 2023. Evaluating the effects of moonlight on the vertical flight profiles of three western palaearctic swiftsProc. R. Soc. B. 2902023095720230957. http://doi.org/10.1098/rspb.2023.0957

![](https://github.com/bluegreen-labs/swift_lunar_synchrony/raw/main/vignettes/figures/Figure_02_flight_profiles_small.png)

## Use

Clone or download the project [zip file](https://github.com/bluegreen-labs/swift_lunar_synchrony/archive/refs/heads/main.zip).

```bash
git clone https://github.com/bluegreen-labs/swift_lunar_synchrony.git
```
The repository is an `R` project and can be opened in [RStudio](https://posit.co/download/rstudio-desktop/), which will set the correct relative path.

### Data structure & analysis

Analysis data is saved as compressed R serial files (.rds) in the [`data` folder](https://github.com/bluegreen-labs/swift_lunar_synchrony/tree/main/data). Scripts to reproduce the main statistical results are provided in the [`analysis` folder](https://github.com/bluegreen-labs/swift_lunar_synchrony/tree/main/analysis). Data contain the below fields:

| Variable         | Description                                                                          |
|------------------|--------------------------------------------------------------------------------------|
| tag              | tag id of the data logger used (alpha-numeric)                                       |
| species          | swift species                                                                        |
| lag_altitude     | lagged altitude to account for correlations in the residuals of models               |
| moon_illuminance | moon illuminance (in lux)                                                            |
| moon_phase       | moon phase (descriptive)                                                             |
| stages           | stages of the day (day, dawn, dusk, night)                                           |
| altbin           | Altitude bin, if data is low or high (0, 1)                                          |

## Related work

This study is follow up work of [our paper in Oikos](https://onlinelibrary.wiley.com/doi/10.1111/oik.08594) titled: "The aeroecology of atmospheric convergence zones: the case of pallid swifts". You can find this dataset on Zenodo [here](https://zenodo.org/record/6320888)

## Licensing

Be mindful of the CC-BY 4.0 license of the data and figures. Reuse is permitted on the condition of proper attribution and documentation of any changes.
