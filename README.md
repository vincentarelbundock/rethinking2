# Statistical Rethinking 2 with `Stan` and `R`

Vincent is trying to replicate (nearly) all the models in Richard McElreath's [*Statistical Rethinking*](https://xcelab.net/rm/statistical-rethinking/) (2nd ed.) book using `R`, `Stan`, `cmdstanr`, `tidybayes`, and `ggplot2`.

This is work in progress. Files can be downloaded from Github: [https://github.com/vincentarelbundock/rethinking2](https://github.com/vincentarelbundock/rethinking2)

Each `Rmarkdown` notebook starts with:

`source('helper.R')`

This script loads:

1. The `tidyverse`, `cmdstanr`, `tidybayes`, and `patchwork` libraries; 
2. A method called `tidy_draws.CmdStanMCMC` which allows `tidybayes` to process objects produced by `cmdstanr`; 
3. A convenience function called `fit_model` which allows users to fit Stan models by calling `fit_model(stan_program, stan_data)`, where `stan_program` is a character object, and `stan_data` is a list.

# Table of contents

* [Chapter 04](https://vincentarelbundock.github.io/rethinking2/04.html)
* [Chapter 05](https://vincentarelbundock.github.io/rethinking2/05.html)
* [Chapter 07](https://vincentarelbundock.github.io/rethinking2/07.html)
* [Chapter 08](https://vincentarelbundock.github.io/rethinking2/08.html)
* [Chapter 09](https://vincentarelbundock.github.io/rethinking2/09.html)
* [Chapter 10](https://vincentarelbundock.github.io/rethinking2/10.html)
* [Chapter 11](https://vincentarelbundock.github.io/rethinking2/11.html)
* [Chapter 12](https://vincentarelbundock.github.io/rethinking2/12.html)
* [Chapter 13](https://vincentarelbundock.github.io/rethinking2/13.html)
* [Chapter 14](https://vincentarelbundock.github.io/rethinking2/14.html)
