#' Get the position numbers of the coefficients
#'
#' @param x A logistic regression model.
#' @return Positions of each coefficient.
#' @examples
#' get_coef_positions(lr_caused)
#' get_coef_positions(lr_cause_inn)
get_coef_positions <- function(x) {
  x <- as.data.frame(x$coefficients)
  colnames(x)[1] <- "Coefficients"
  x$Position <- seq.int(nrow(x))
  return(x)
}
