library(tidyverse)
library(ggthemes)

# Plot odds ratios (#1)
plot_odds_ratios <- function(model, caption) {

  odds <- tibble(as_tibble_col(tibble(tidy(model$coefficients))$names),
                 as_tibble(exp(cbind(OR = coef(model), confint(model)))),
                 std_err = tibble(summary(model)$coefficients[, 2]))

  odds[-1, ] |>
    filter(std_err < 2) |>
    ggplot(aes(y = value, x = OR, label = value)) +
    geom_errorbarh(aes(
      xmin = `2.5 %`,
      xmax = `97.5 %`
    ),
    height = 0.2
    ) +
    geom_point(size = 4, shape = 18, color = "black") +
    geom_vline(xintercept = 1, linetype = "longdash") +
    scale_y_discrete(labels = c(
      "jur_race_wAsian" = "Asian",
      "jur_race_wBlack" = "Black",
      "jur_race_wHispanic" = "Hispanic",
      "jur_race_wOther" = "Other",
      "i_30Split" = "I-30 (Split)",
      "i_30North" = "I-30 North",
      "i_30Split:jur_race_wOther" = "I-30 (split) * Race (Other)",
      "i_30Split:jur_race_wHispanic" = "I-30 (split) * Race (Hispanic)",
      "i_30Split:jur_race_wBlack" = "I-30 (split) * Race (Black)",
      "i_30Split:jur_race_wAsian" = "I-30 (split) * Race (Asian)",
      "i_30North:jur_race_wOther" = "I-30 (North) * Race (Other)",
      "i_30North:jur_race_wHispanic" = "I-30 (North) * Race (Hispanic)",
      "i_30North:jur_race_wBlack" = "I-30 (North) * Race (Black)",
      "i_30North:jur_race_wAsian" = "I-30 (North) * Race (Asian)",
      "age_group55 +" = "Age Group 55 and Up",
      "age_group45 - 54" = "Age Group 45 - 54",
      "age_group31 - 44" = "Age Group 31 - 44",
      "i_30Split:age_group55 +" = "I-30 (split) * Age Group 55 and Up",
      "i_30Split:age_group45 - 54" = "I-30 (split) * Age Group 45 - 54",
      "i_30Split:age_group31 - 44" = "I-30 (split) * Age Group 31 - 44",
      "i_30North:age_group55 +" = "I-30 (North) * Age Group 55 and Up",
      "i_30North:age_group45 - 54" = "I-30 (North) * Age Group 45 - 54",
      "i_30North:age_group31 - 44" = "I-30 (North) * Age Group 31 - 44",
      "jur_gendOther" = "Other",
      "jur_gendMale" = "Male",
      "i_30Split:jur_gendOther" = "I-30 (split) * Other",
      "i_30Split:jur_gendMale" = "I-30 (split) * Male",
      "i_30North:jur_gendOther" = "I-30 (North) * Other",
      "i_30North:jur_gendMale" = "I-30 (North) * Male"
    )) +
    labs(
      caption = caption,
      x = "Odds Ratio",
      y = ""
    ) +
    ggthemes::theme_foundation() +
    theme(
      plot.title = element_text(
        face = "bold",
        family = "Georgia",
        size = rel(1.4), hjust = 0, margin = margin(0, 0, 20, 0)
      ),
      text = element_text(),
      panel.background = element_rect(colour = NA),
      plot.background = element_rect(colour = NA),
      panel.border = element_rect(colour = NA),
      axis.title = element_text(
        face = "bold",
        family = "Georgia",
        size = rel(1)
      ),
      axis.title.y = element_text(angle = 90, vjust = 2),
      axis.title.x = element_text(vjust = -0.2, hjust = 0.5),
      axis.text = element_text(family = "Georgia"),
      axis.line.x = element_line(colour = "black"),
      axis.line.y = element_line(colour = "black"),
      axis.ticks = element_line(),
      panel.grid.major = element_line(
        colour = "#d8d8d8",
        size = 0.5,
        linetype = "dotted"
      ),
      panel.grid.minor = element_blank(),
      plot.caption = element_text(
        face = "italic",
        family = "Georgia"
      ),
      legend.key = element_rect(colour = NA),
      legend.position = "bottom",
      legend.direction = "horizontal",
      legend.box = "vertical",
      legend.key.size = unit(0.5, "cm"),
      # legend.margin = unit(0, "cm"),
      legend.title = element_text(face = "italic"),
      plot.margin = unit(c(10, 5, 5, 5), "mm"),
      strip.background = element_rect(colour = "#f0f0f0", fill = "#f0f0f0"),
      strip.text = element_text(face = "bold")
    )
}

# Plot odds ratios (#2)
plot_odds_ratios2 <- function(model, caption) {

  odds <- tibble(as_tibble_col(tibble(tidy(model$coefficients))$names),
                 as_tibble(exp(cbind(OR = coef(model), confint(model)))),
                 std_err = tibble(summary(model)$coefficients[, 2]))

  odds[-1, ] |>
    filter(std_err < 2) |>
    ggplot(aes(y = value, x = OR, label = value)) +
    xlim(0.5, 11) +
    geom_errorbarh(aes(
      xmin = `2.5 %`,
      xmax = `97.5 %`
    ),
    height = 0.2
    ) +
    geom_point(size = 4, shape = 18, color = "black") +
    geom_vline(xintercept = 1, linetype = "longdash") +
    scale_y_discrete(labels = c(
      "jur_race_wAsian" = "Asian",
      "jur_race_wBlack" = "Black",
      "jur_race_wHispanic" = "Hispanic",
      "jur_race_wOther" = "Other",
      "jur_race_oWhite" = "Other",
      "jur_raceWhite" = "Black",
      "jur_race_aWhite" = "Asian",
      "jur_race_hWhite" = "Hispanic",
      "jur_race_oHispanic" = "Hispanic",
      "jur_race_oBlack" = "Black",
      "jur_race_oAsian" = "Asian",
      "age_group55 +" = "Age Group 55 and Up",
      "age_group45 - 54" = "Age Group 45 - 54",
      "age_group31 - 44" = "Age Group 31 - 44"
    )) +
    labs(
      caption = caption,
      x = "Odds Ratio",
      y = ""
    ) +
    ggthemes::theme_foundation() +
    theme(
      plot.title = element_text(
        face = "bold",
        family = "Georgia",
        size = rel(1.4), hjust = 0, margin = margin(0, 0, 20, 0)
      ),
      text = element_text(),
      panel.background = element_rect(colour = NA),
      plot.background = element_rect(colour = NA),
      panel.border = element_rect(colour = NA),
      axis.title = element_text(
        face = "bold",
        family = "Georgia",
        size = rel(1)
      ),
      axis.title.y = element_text(angle = 90, vjust = 2),
      axis.title.x = element_text(vjust = -0.2, hjust = 0.5),
      axis.text = element_text(family = "Georgia"),
      axis.line.x = element_line(colour = "black"),
      axis.line.y = element_line(colour = "black"),
      axis.ticks = element_line(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      plot.caption = element_text(
        face = "italic",
        family = "Georgia"
      ),
      legend.key = element_rect(colour = NA),
      legend.position = "bottom",
      legend.direction = "horizontal",
      legend.box = "vertical",
      legend.key.size = unit(0.5, "cm"),
      # legend.margin = unit(0, "cm"),
      legend.title = element_text(face = "italic"),
      plot.margin = unit(c(10, 5, 5, 5), "mm"),
      strip.background = element_rect(colour = "#f0f0f0", fill = "#f0f0f0"),
      strip.text = element_text(face = "bold")
    )
}

# Plot odds ratios #3
plot_odds_ratios3 <- function(model, caption) {

  odds <- tibble(as_tibble_col(tibble(tidy(model$coefficients))$names),
                 as_tibble(exp(cbind(OR = coef(model), confint(model)))),
                 std_err = tibble(summary(model)$coefficients[, 2]))

  odds[-1, ] |>
    filter(std_err < 2) |>
    ggplot(aes(y = value, x = OR, label = value)) +
    xlim(0.5, 2) +
    geom_errorbarh(aes(
      xmin = `2.5 %`,
      xmax = `97.5 %`
    ),
    height = 0.2
    ) +
    geom_point(size = 4, shape = 18, color = "black") +
    geom_vline(xintercept = 1, linetype = "longdash") +
    scale_y_discrete(labels = c(
      "age_group118 - 30" = "Age Group 45 - 54",
      "age_group155 +" = "Age Group 55 And Up",
      "age_group131 - 44" = "Age Group 31 - 44",
      "age_group218 - 30" = "Age Group 55 And Up",
      "age_group245 - 54" = "Age Group 45 - 54",
      "age_group231 - 44" = "Age Group 31 - 44",
      "age_group318 - 30" = "Age Group 31 - 44",
      "age_group355 +" = "Age Group 55 And Up",
      "age_group345 - 54" = "Age Group 45 - 54"
    )) +
    labs(
      caption = caption,
      x = "Odds Ratio",
      y = ""
    ) +
    theme_foundation() +
    theme(
      plot.title = element_text(
        face = "bold",
        family = "Georgia",
        size = rel(1.4), hjust = 0, margin = margin(0, 0, 20, 0)
      ),
      text = element_text(),
      panel.background = element_rect(colour = NA),
      plot.background = element_rect(colour = NA),
      panel.border = element_rect(colour = NA),
      axis.title = element_text(
        face = "bold",
        family = "Georgia",
        size = rel(1)
      ),
      axis.title.y = element_text(angle = 90, vjust = 2),
      axis.title.x = element_text(vjust = -0.2, hjust = 0.5),
      axis.text = element_text(family = "Georgia"),
      axis.line.x = element_line(colour = "black"),
      axis.line.y = element_line(colour = "black"),
      axis.ticks = element_line(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      plot.caption = element_text(
        face = "italic",
        family = "Georgia"
      ),
      legend.key = element_rect(colour = NA),
      legend.position = "bottom",
      legend.direction = "horizontal",
      legend.box = "vertical",
      legend.key.size = unit(0.5, "cm"),
      # legend.margin = unit(0, "cm"),
      legend.title = element_text(face = "italic"),
      plot.margin = unit(c(10, 5, 5, 5), "mm"),
      strip.background = element_rect(colour = "#f0f0f0", fill = "#f0f0f0"),
      strip.text = element_text(face = "bold")
    )
}
