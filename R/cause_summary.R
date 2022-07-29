#' Get a summary of the counts of each cause
#'
data(bullpen)
cause_summary <- bullpen |>
  dplyr::summarize(
    "5th Amendment" = sum(as.numeric(as.character(ammend_5))),
    "Judgement" = sum(as.numeric(as.character(judgement))),
    "Presumption of Innocence" = sum(as.numeric(as.character(inn))),
    "General Bias" = sum(as.numeric(as.character(bias_no_fair))),
    "Burden of Proof" = sum(as.numeric(as.character(bop_100_percent))),
    "Punishment" = sum(as.numeric(as.character(pun)))
  ) |>
  tibble::rownames_to_column() |>
  tidyr::pivot_longer(cols = -rowname,
                      names_to = "Cause Reason",
                      values_to = "Instances") |>
  dplyr::select(-rowname) |>
  dplyr::mutate(Percent = (Instances / sum(as.numeric(as.character(bullpen$caused)))) * 100)
