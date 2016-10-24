
<!-- README.md is generated from README.Rmd. Please edit that file -->
joineRML
========

`joineRML` is an extension of the joineR package for fitting joint models of time-to-event data and multivariate longitudinal data. The model fitted in joineRML is an extension of the Wulfsohn and Tsiatis (1997) and Henderson et al. (2000) models, which is comprised on (*K* + 1)-sub-models: a Cox proportional hazards regression model (Cox, 1972) and a *K*-variate linear mixed-effects model -- a direct extension of the Laird and Ware (1982) regression model. The model is fitted using a Monte Carlo Expectation-Maximization (MCEM) algorithm, which closely follows the methodology presented by Lin et al. (2002).

Why use joineRML?
-----------------

As noted in Hickey et al. (2016), there is a lack of statistical software available for fitting joint models to multivariate longitudinal data. This is contrary to a growing methodology in the statistical literature. `joineRML` is intended to fill this void.

Please note that this is currently a **developmental version**, and caution is required when using it.

How to install
--------------

You will need R version (version 3.1 or higher). You will also need some additional software depending on what platform you are using. Optionally, you will also require LaTeX if you want to install the vignettes.

Note that installation will be much simpler after submission to CRAN, and no additional software dependencies will be required.

### On Windows

If not already installed, you will need to install [Rtools](https://cran.r-project.org/bin/windows/Rtools/). Choose the version that corresponds to the version of R that you are using.

### On Mac OSX

If not already install, you will need to install Xcode Command Line Tools. To do this, open a new terminal and run

``` bash
$ xcode-select --install
```

To verify that the install was successful, run the following line in the terminal

``` bash
$ xcode-select -p
```

which should return the following

``` bash
/Library/Developer/CommandLineTools
```

### From R

The package is not yet available on CRAN, as it is still in development. To install it, you will need `devtools`. You can check you are using the correct version by running

``` bash
pkg_check <- require('devtools')
if (pkg_check) {
  pkg_check <- (packageVersion("devtools") >= 1.6)
}
if (!pkg_check) {
  install.packages('devtools')
}
```

Once the prerequisite software is installed, you can install `joineRML` (**without** the vignettes) by running the following command in an R console

``` r
library('devtools')
install_github('graemeleehickey/joineRML')
```

If you have LaTeX installed, you can install `joineRML` (**with** the vignettes) by running the following command in an R console

``` r
library('devtools')
install_github('graemeleehickey/joineRML', build_vignettes = TRUE)
```

Note that LaTeX will need the following packages: `graphicx`, `amsmath`, `amssymb`, `amsfonts`, `setspace`, `enumitem`, `hyperref`.

Example
=======

The main workhorse function is `mjoint`. As a simple example, we use the `heart.valve` dataset from the package and fit a bivariate joint model.

``` r
library(joineRML)
data(heart.valve)
hvd <- heart.valve[!is.na(heart.valve$log.grad) & !is.na(heart.valve$log.lvmi), ]

set.seed(12345)
fit <- mjoint(
    formLongFixed = list("grad" = log.grad ~ time + sex + hs,
                         "lvmi" = log.lvmi ~ time + sex),
    formLongRandom = list("grad" = ~ 1 | num,
                          "lvmi" = ~ time | num),
    formSurv = Surv(fuyrs, status) ~ age,
    data = list(hvd, hvd),
    timeVar = "time")
```

The fitted model is assigned to `fit`. We can apply a number of functions to this object, e.g. `coef`, `logLik`, `plot`, `print`, `ranef`, `fixef`, `summary`, `extractAIC`, `getVarCov`. For example,

``` r
summary(fit)
plot(fit, param = 'gamma')
```

`mjoint` automatically estimates approximate standard errors using the empirical information matrix (Lin et al., 2002), but the `bootSE` function can be used as an alternative.

Errors and updates
==================

If you spot any errors or wish to see a new feature added, please file an issue at <https://github.com/graemeleehickey/joineRML/issues> or email [Graeme Hickey](mailto:graeme.hickey@liverpool.ac.uk).

Further learning
================

For an overview of the model estimation being performed, please see the technical vignette, which can be accessed by

``` r
vignette('technical', package = 'joineRML')
```

References
==========

1.  Cox DR. Regression models and life-tables. *J R Stat Soc Ser B Stat Methodol.* 1972; 34(2): 187-220.

2.  Henderson R, Diggle PJ, Dobson A. Joint modelling of longitudinal measurements and event time data. *Biostatistics.* 2000; **1(4)**: 465-480.

3.  Hickey GL, Philipson P, Jorgensen A, Kolamunnage-Dona R. Joint modelling of time-to-event and multivariate longitudinal outcomes: recent developments and issues. *BMC Med Res Methodol.* 2016; **16(1)**: 117.

4.  Laird NM, Ware JH. Random-effects models for longitudinal data. *Biometrics.* 1982; **38(4)**: 963-974.

5.  Lin H, McCulloch CE, Mayne ST. Maximum likelihood estimation in the joint analysis of time-to-event and multiple longitudinal variables. *Stat Med.* 2002; **21**: 2369-2382.

6.  Wulfsohn MS, Tsiatis AA. A joint model for survival and longitudinal data measured with error. *Biometrics.* 1997; **53(1)**: 330-339.