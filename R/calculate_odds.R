#' Calculates odds ratios for a logistic regression model
#'
#' @param model A logistic regression model
#' @return A table of odds ratios for the coefficients of the logistic regression model
#' @examples
#' calculate_odds(lr_caused)
#' calculate_odds(lr_race)
calculate_odds <- function(model) {
  exp(cbind(OR = coef(model), confint(model)))
}
