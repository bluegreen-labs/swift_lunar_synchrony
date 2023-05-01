# Moonlight synchronous flights across three western palearctic swifts mirror size dependent prey preferences

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7814214.svg)](https://doi.org/10.5281/zenodo.7814214) [![](https://raw.githubusercontent.com/bluegreen-labs/swift_lunar_synchrony/main/BioRxiv_logo.png)](https://doi.org/10.1101/2023.04.25.538243)

Koen Hufkens, Christoph M. Meier, Ruben Evens, Josefa Arán Paredes, Hakan Karaardiç, Stef Vercauteren, Ann Van Gijsel, James W. Fox, Carlos Miguel Pacheco, Luis P. da Silva, Sandra Fernandes, Pedro Henriques, Gonçalo Elias, Luís T. Costa, Martin Poot, Lyndon Kearsley

## Abstract

Recent studies have suggested the presence of moonlight mediated behaviour in avian aerial insectivores, such as swifts. At the same time swift species also show differences in prey (size) preferences. Here, we use the combined analysis of state-of-the-art data logger data across three swift species, the Common, Pallid and Alpine swifts, to quantify flight height and activity responses to crepuscular and nocturnal light conditions. Our results show a significant response in flight heights to moonlight illuminance for Common and Pallid swifts, while a moonlight driven response is absent in Alpine swifts. Swift flight responses followed the size dependent altitude gradient of their insect prey. We show a weak relationship between nighttime illuminance driven responses and twilight ascending behaviour, suggesting a decoupling of both crepuscular and nighttime behaviour. We suggest that swifts optimise their flight behaviour to adapt to favourable nighttime light conditions, driven by light responsive and size dependent vertical insect stratification and weather conditions.

> You are required to cite both the Zenodo data repository as well as the BioRXiv pre-print when using the project data, please refer to the data as: Hufkens et al. Moonlight synchronous flights across three western palearctic swifts mirror size dependent prey preferences. https://doi.org/10.5281/zenodo.7814214, and Hufkens et al. Moonlight synchronous flights across three western palearctic swifts mirror size dependent prey preferences. bioRxiv 2023.04.25.538243; doi: https://doi.org/10.1101/2023.04.25.538243.

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
