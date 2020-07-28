# Statistical Rethinking 2 with `Stan` and `R`

Vincent is trying to replicate (nearly) all the models in Richard McElreath's [*Statistical Rethinking*](https://xcelab.net/rm/statistical-rethinking/) (2nd ed.) book using `R`, `Stan`, `cmdstanr`, `tidybayes`, and `ggplot2`. *This is work in progress.*

Rendered `Rmarkdown` notebooks can be viewed here:

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

All files can be downloaded from Github: [https://github.com/vincentarelbundock/rethinking2](https://github.com/vincentarelbundock/rethinking2)

# Replication strategy

Many software packages can be used to replicate the models in *Statistical Rethinking 2*. Here, I will mainly rely on these `R` libraries:

* `cmdstanr`
* `tidybayes`
* `tidyverse`

`cmdstanr` is a wrapper around the command line `Stan` interface. In my limited experience, it seems more stable, and it produces fewer weird warnings than `rstan`. The `Stan` developers also claim that it is easier to install and use the latest versions of `Stan` with `cmdstanr`.

To fit a model using `cmdstanr`, users would typically save the model specification in a file with a `.stan` extension and point the `cmdstan_model` function to this file. For example:

```r
model <- cmdstan_model(stanfile = 'model.stan')
model$sample(data_list)
```

For pedagogical reasons, I do not save `Stan` programs to file, but rather present directly in the notebooks as `R` strings. Then, I use a simple helper function called `fit_model` to write a temporary `.stan` file to disk, and use that file for estimate. `fit_model` accepts only two arguments: `stan_program` (character) and `stan_data` (list). A trivial model could be:

```r
stan_program <- '
data {
  vector[1000] y;
}
parameters {
  real mu;
  real<lower=0> sigma;
}
model {
  y ~ normal(mu, sigma);
  mu ~ normal(0, 1);
  sigma ~ exponential(1);
}
'
stan_data <- list('y' = rnorm(1000, 10, 2))
model <- fit_model(stan_program, stan_data)
```

This helper function is stored in the `helper.R` file. Since we're going to use `fit_model` a lot, each `Rmarkdown` notebook starts with:

`source('helper.R')`

This script loads:

1. The `tidyverse`, `cmdstanr`, `tidybayes`, and `patchwork` libraries; 
2. A method called `tidy_draws.CmdStanMCMC` which allows `tidybayes` to process objects produced by `cmdstanr`; 
3. A convenience function called `fit_model` which allows users to fit Stan models by calling `fit_model(stan_program, stan_data)`, where `stan_program` is a character object, and `stan_data` is a list.

# Caveat

I make no claim to expertise. This project was started as a way to learn Stan and Bayesian statistics. If you find bad code or inacurate content, please send me an email or file an issue on Github.
