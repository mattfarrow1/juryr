#' Create an odds ratio table
#'
#' @param x A logistic regression model.
#' @return An odds ratio table.
#' @examples
#' calculate_odds(lr_caused)
#' calculate_odds(lr_cause_inn)
calculate_odds <- function(x) {
  exp(cbind(OR = coef(x), confint(x)))
}
