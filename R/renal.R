#' Renal transplantation data
#'
#' @description This is a dataset on 407 patients suffering from chronic kidney
#'   disease who underwent a primary renal transplantation with a graft from a
#'   deceased or living donor in the University Hospital of the Catholic
#'   University of Leuven (Belgium) between 21 January 1983 and 16 August 2000.
#'   Chronic kidney (renal) disease is a progressive loss of renal function over
#'   a period of months or years through five stages. Each stage is a
#'   progression through an abnormally low and progressively worse glomerular
#'   filtration rate (GFR). The dataset records 3 repeated measures (2
#'   continuous and 1 binary), and an event time.
#'
#' @usage data(renal)
#' @format This is a list with 4 data frames: \enumerate{
#'
#'   \item{\code{prot}: repeated measurement data for proteinuria (binary) that
#'   measures whether the kidneys succeed in sustaining the proteins in the
#'   blood and not discard them in the urine.}
#'
#'   \item{\code{haem}: repeated measurement data for blood haematocrit level
#'   (continuous) that measures whether the kidneys produce adequate amounts of
#'   the hormone erythropoietin that regulates the red blood cell production.}
#'
#'   \item{\code{gfr}: repeated measurement data for GFR (continuous) that
#'   measures the filtration rate of the kidneys.}
#'
#'   \item{\code{surv}: time-to-event data for renal graft failure.}
#'
#'   }
#'
#'   \strong{All datasets} have the common data columns, which are in long
#'   format for the 3 longitudinal data data frames, and 1-per-subject for the
#'   time-to-event data frame: \describe{
#'
#'   \item{\code{id}}{number for patient identification.}
#'
#'   \item{\code{age}}{age of patient at day of surgery (years).}
#'
#'   \item{\code{weight}}{preoperative weight of patient (kg).}
#'
#'   \item{\code{sex}}{gender of patient.}
#'
#'   \item{\code{fuyears}}{maximum follow up time, with transplant date as the
#'   time origin (years).}
#'
#'   \item{\code{failure}}{censoring indicator (\code{1=}graft failure and
#'   \code{0=}censored).}
#'
#'   }
#'
#'   \strong{The longitudinal datasets only} contain 2 further columns:
#'   \describe{
#'
#'   \item{\code{time}}{observed time point, with surgery date as the time
#'   origin (years).}
#'
#'   \item{biomarker value}{a recorded measurement of the biomarker taken at
#'   time \code{time}. The 3 biomarkers (one per data frame) are: \itemize{
#'
#'   \item{\code{proteinuria}: recorded as binary indicator: present or
#'   not-present. Present in the \code{prot} data.}
#'
#'   \item{\code{haematocrit}: recorded as percentage (\%) of the ratio of the
#'   volume of red blood cells to the total volume of blood. Present in the
#'   \code{haem} data.}
#'
#'   \item{\code{gfr}: measured as ml/min/1.73\eqn{m^2}. Present in the
#'   \code{gfr} data.}
#'
#'   }}
#'
#'   }
#' @keywords datasets
#' @seealso \code{\link{pbc2}}, \code{\link{heart.valve}},
#'   \code{\link{epileptic.qol}}.
#' @source Dr Dimitris Rizopoulos (\email{d.rizopoulos@@erasmusmc.nl}).
#' @references
#'
#' Rizopoulos D, Ghosh, P. A Bayesian semiparametric multivariate joint model
#' for multiple longitudinal outcomes and a time-to-event. \emph{Stat Med.}
#' 2011; \strong{30(12)}: 1366-80.
"renal"
