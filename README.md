Vincent is trying to replicate (nearly) all the models in Richard McElreath's "Statistical Rethinking" (2nd ed.) book using `R`, `Stan`, `cmdstanr`, `tidybayes`, and `ggplot2`.

Each `Rmarkdown` notebook starts with:

`source('helper.R')`

This script loads:

1. The `tidyverse`, `cmdstanr`, `tidybayes`, and `patchwork` libraries; 
2. A method called `tidy_draws.CmdStanMCMC` which allows `tidybayes` to process objects produced by `cmdstanr`; 
3. A convenience function called `fit_model` which allows users to fit Stan models by calling `fit_model(stan_program, stan_data)`, where `stan_program` is a character object, and `stan_data` is a list.
