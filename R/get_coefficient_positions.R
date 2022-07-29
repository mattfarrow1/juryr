#' Get coefficient positions to assist with calling by number
#'
#' @param model A logistic regression model
#' @return A table of coefficients with their respective line numbers for a
#'     logistic regression model
#' @examples
#' get_coef_positions(lr_caused)
#' get_coef_positions(lr_race)
get_coef_positions <- function(model) {
  tibble(tidy(model$coefficients)) |>
    dplyr::mutate(position = row_number(), .before = names)
}
