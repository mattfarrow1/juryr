#' Create an odds ratio table
#'
#' @param x A logistic regression model.
#' @return An odds ratio table.
#' @export
#' @examples
#' calculate_odds(lr_caused)
calculate_odds <- function(x) {
  exp(cbind(OR = stats::coef(x), stats::confint(x)))
}
