library(tidyverse) # ubiquitous
library(cmdstanr)  # wrapper around command line Stan
library(tidybayes) # extract and format draws
library(patchwork) # combining plots
library(coda)      # needed for tidy_draws.CmdStanMCMC

# number of cores on Vincent's computer
cores <- 4

#' a convenience function to fit models with `cmdstanr` from a model passed as a
#' R string object
#' 
#' @param stan_program A Stan program as a character object
#' @param stan_data A list of data objects to be passed to Stan
fit_model <- function(stan_program, stan_data) {
    # write 
    f <- write_stan_tempfile(stan_program)
    mod <- cmdstan_model(f)
    fit <- mod$sample(stan_data, parallel_chains = cores)
    unlink(f)
    return(fit)
}

# this method allows `tidybayes` to support `cmdstanr` models
tidy_draws.CmdStanMCMC = function(model, ...) {
  # parameter draws
  sample_matrix = model$draws() #[iteration, chain, variable]
  class(sample_matrix) = 'array'
  n_chain = dim(sample_matrix)[[2]]
  mcmc_list = as.mcmc.list(lapply(seq_len(n_chain), 
                                  function(chain) as.mcmc(sample_matrix[, chain, ]))) # nolint
  parameter_draws = tidy_draws(mcmc_list, ...)
  
  # diagnostic draws
  diagnostic_matrix = model$sampler_diagnostics()
  class(diagnostic_matrix) = 'array'
  mcmc_list = as.mcmc.list(lapply(seq_len(n_chain), 
                                  function(chain) as.mcmc(diagnostic_matrix[, chain, ]))) # nolint
  diagnostic_draws = tidy_draws(mcmc_list)
  
  # combine parameter and diagnostic draws
  draws = full_join(parameter_draws, diagnostic_draws, by = c('.chain', '.iteration', '.draw'))
  
  # keep the constructors around in case they were set on the original model
  attr(draws, "tidybayes_constructors") = attr(model, "tidybayes_constructors")
  draws
}


# set default graphics theme if Vincent's personal package is installed
if (requireNamespace('vincent', quietly = TRUE)) {
    vincent::theming()
}
