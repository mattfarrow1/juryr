#' Create a relative risk ratio table
#'
#' @param x A logistic regression model.
#' @return A risk ratio table.
#' @examples
#' calculate_risk(lr_caused)
calculate_risk <- function(x) {
  rr <- epitools::probratio(x)

  cbind(rr[, 0],
        RR = rr[, 1],
        "p-value" = rr[, 4],
        `2.5%` = rr[, 5],
        `97.5%` = rr[, 6])
}
