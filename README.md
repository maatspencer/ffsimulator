
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ffsimulator <a href='#'><img src="man/figures/logo.png" align="right" width="25%" min-width="120px"/></a>

<!-- badges: start -->

[![CRAN
status](https://img.shields.io/cran/v/ffsimulator?style=flat-square&logo=R&label=CRAN)](https://CRAN.R-project.org/package=ffsimulator)
[![Dev
version](https://img.shields.io/github/r-package/v/ffverse/ffsimulator/main?label=dev&style=flat-square&logo=github)](https://ffsimulator.ffverse.com/)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg?style=flat-square)](https://lifecycle.r-lib.org/articles/stages.html)
[![R build
status](https://img.shields.io/github/workflow/status/ffverse/ffsimulator/R-CMD-check?label=R%20check&style=flat-square&logo=github)](https://github.com/ffverse/ffsimulator/actions)
[![Integration
testing](https://img.shields.io/github/workflow/status/ffverse/ffsimulator/api-check?label=api%20check&style=flat-square&logo=github)](https://github.com/ffverse/ffsimulator/actions)
[![Codecov test
coverage](https://img.shields.io/codecov/c/github/ffverse/ffsimulator?label=codecov&style=flat-square&logo=codecov)](https://app.codecov.io/gh/ffverse/ffsimulator?branch=dev)
[![nflverse
discord](https://img.shields.io/discord/789805604076126219?color=7289da&label=nflverse%20discord&logo=discord&logoColor=fff&style=flat-square)](https://discord.com/invite/5Er2FBnnQa)

<!-- badges: end -->

The `{ffsimulator}` package uses bootstrap resampling to run fantasy
football season simulations supported by historical rankings and
nflfastR data, calculating optimal lineups, and returning aggregated
results. This can quickly run your league through hundreds of seasons
and builds out the data to help you study:

-   expected season finishes and range of outcomes
-   player contributions to season wins
-   roster constructions
-   effects of (potential) trades
-   and more!

This package is part of the [ffverse](https://www.ffverse.com) family of
R packages for fantasy football analysis.

## Installation

Install the stable version of this package from CRAN:

``` r
install.packages("ffsimulator") # CRAN
```

Install the development version from either
[r-universe](https://ffverse.r-universe.dev) or GitHub:

``` r
install.packages("ffsimulator", repos = "https://ffverse.r-universe.dev")
# pak is recommended, see https://github.com/r-lib/pak
pak::pak("ffverse/ffsimulator")
# can also use remotes
remotes::install_github("ffverse/ffsimulator")
```

The development version has a [separate documentation site
here](https://ffsimulator.ffverse.com/dev/).

## Usage

A season simulation can be run as follows:

``` r
library(ffsimulator)
library(ggplot2)
library(ggridges)

mfl_conn <- mfl_connect(season = 2021, league_id = 22627)

## OTHER PLATFORM CONNECTIONS MAY BE USED, FOR EXAMPLE:
# sleeper_conn <- sleeper_connect(season = 2021,  league_id = "652582284720971776") 
# flea_conn <- fleaflicker_connect(season = 2021, league_id = 312861) 
# espn_conn <- espn_connect(season = 2021, league_id = 899513)

mfl_sim <- ff_simulate(conn = mfl_conn, n_seasons = 100)

plot(mfl_sim)
```

<img src="man/figures/ffsimulator_plot.png" width="100%" />

Please also see the

-   [basic usage](https://ffsimulator.ffverse.com/articles/basic.html)
    and
-   [custom
    simulations](https://ffsimulator.ffverse.com/articles/custom.html)

vignettes for more detailed introductions.

## Getting help

The best places to get help on this package are:

-   the [nflverse discord](https://discord.com/invite/5Er2FBnnQa) (for
    both this package as well as anything R/NFL related)
-   opening [an
    issue](https://github.com/ffverse/ffsimulator/issues/new/choose)

## Contributing

Many hands make light work! Here are some ways you can contribute to
this project:

-   You can [open an
    issue](https://github.com/ffverse/ffsimulator/issues/new/choose) if
    you’d like to request specific data or report a bug/error.
-   You can [sponsor this project with
    donations](https://github.com/sponsors/tanho63)!
-   If you’d like to contribute code, please check out [the contribution
    guidelines](https://ffsimulator.ffverse.com/CONTRIBUTING.html).

## Terms of Use

The R code for this package is released as open source under the [MIT
License](https://ffsimulator.ffverse.com/LICENSE.html). Fantasy football
and NFL data accessed by this package belong to their respective owners,
and are governed by their terms of use.
