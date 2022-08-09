#' Caused, by race.
#'
#' A logistic regression model whose response variable is `jur_caused` and whose
#' explanatory variable is `jur_race_w`.
"lr_caused"

#' Caused, by age group only.
#'
#' A logistic regression model whose response variable is `jur_caused` and whose
#' explanatory variable is `age_group`.
"lr_caused_a"

#' Caused, by gender only.
#'
#' A logistic regression model whose response variable is `jur_caused` and whose
#' explanatory variable is `jur_gend`.
"lr_caused_g"

#' Caused by I-30 split only.
#'
#' A logistic regression model whose response variable is `jur_caused` and whose
#' explanatory variable is `i_30`.
"lr_i30"

#' Caused by I-30 split and race.
#' A logistic regression model whose response variable is `jur_caused` and whose
#' explanatory variables are `i_30` and `jur_race_w`.
"lr_caused_i30"

#' Caused by inability to accept a defendant's 5th Amendment rights, by race.
#'
#' A logistic regression model whose response variable is `ammend_5` and whose
#' explanatory variable is `jur_race_w`.
"lr_cause_5am"

#' Caused by inability to accept a defendant's 5th Amendment rights, by age
#' group and I-30 split.
#'
#' A logistic regression model whose response variable is `ammend_5` and whose
#' explanatory variables are `i_30` and `age_group`.
"lr_cause_5am_a"

#' Caused by inability to accept a defendant's 5th Amendment rights, by gender.
#'
#' A logistic regression model whose response variable is `ammend_5` and whose
#' explanatory variable is `jur_gend`.
"lr_cause_5am_g"

#' Caused for bias, by race.
#'
#' A logistic regression model whose response variable is `jur_biased` and whose
#' explanatory variable is `jur_race_w`.
"lr_cause_bias"

#' Caused for bias, by age group.
#'
#' A logistic regression model whose response variable is `jur_biased` and whose
#' explanatory variable is `age_group`.
"lr_cause_bias_a"

#' Caused for bias, by all genders.
#'
#' A logistic regression model whose response variable is `jur_biased` and whose
#' explanatory variable is `jur_gend`.
"lr_cause_bias_g"

#' Caused for bias, by male and female only.
#'
#' A logistic regression model whose response variable is `jur_biased` and whose
#' explanatory variable is `jur_gend`. Unlike `lr_cause_bias_g`, this model uses
#' only jurors who identified as "Male" or "Female".
"lr_caused_mf"

#' Bias against the state, by gender.
#'
#' A logistic regression model whose response variable is `bias_a_g_state` and
#' whose explanatory variable is `jur_gend`.
"lr_bias_a_g_state_g"

#' Bias against the defense, by race.
#'
#' A logistic regression model whose response variable is `bias_a_g_def` and
#' whose explanatory variable is `jur_race_w`.
"lr_bias_a_g_def"

#' Bias against the defense, by gender.
#'
#' A logistic regression model whose response variable is `bias_a_g_def` and
#' whose explanatory variable is `jur_gend`.
"lr_bias_a_g_def_g"

#' Bias against the police, by race.
#'
#' A logistic regression model whose response variable is `bias_a_g_police` and
#' whose explanatory variable is `jur_race_w`.
"lr_bias_a_g_police"

#' Bias against the police, by age group.
#'
#' A logistic regression model whose response variable is `bias_a_g_police` and
#' whose explanatory variable is `age_group`.
"lr_bias_a_g_police_a"

#' Bias against the police, by gender.
#'
#' A logistic regression model whose response variable is `bias_a_g_police` and
#' whose explanatory variable is `jur_gend`.
"lr_bias_a_g_police_g"

#' Burden of proof, by race.
#'
#' A logistic regression model whose response variable is `bop_100_percent` and
#' whose explanatory variable is `jur_race_w`.
"lr_cause_bop"

#' Burden of proof, by age group.
#'
#' A logistic regression model whose response variable is `bop_100_percent` and
#' whose explanatory variable is `age_group`.
"lr_cause_bop_a"

#' Burden of proof, by gender.
#'
#' A logistic regression model whose response variable is `bop_100_percent` and
#' whose explanatory variable is `jur_gend`.
"lr_cause_bop_g"

#' Presumption of innocence, by race and I-30 split.
#'
#' A logistic regression model whose response variable is `inn` and
#' whose explanatory variables are `i_30` and `jur_race_w`.
"lr_cause_inn"

#' Presumption of innocence, by age group.
#'
#' A logistic regression model whose response variable is `inn` and whose
#' explanatory variable is `age_group`.
"lr_cause_inn_a"

#' Inability to accept the full range of punishment, by race.
#'
#' A logistic regression model whose response variable is `jur_pun` and whose
#' explanatory variable is `jur_race_w`.
"lr_cause_pun"

#' Inability to accept the full range of punishment, by age group.
#'
#' A logistic regression model whose response variable is `jur_pun` and whose
#' explanatory variable is `age_group`.
"lr_cause_pun_a"

#' Inability to accept the full range of punishment, by gender.
#'
#' A logistic regression model whose response variable is `jur_pun` and whose
#' explanatory variable is `jur_gend`.
"lr_cause_pun_g"

#' Inability to accept the maximum punishment, by race.
#'
#' A logistic regression model whose response variable is `pun_max` and whose
#' explanatory variable is `jur_race_w`.
"lr_pun_max"

#' Inability to accept the maximum punishment, by age group.
#'
#' A logistic regression model whose response variable is `pun_max` and whose
#' explanatory variable is `age_group`.
"lr_pun_max_a"

#' Inability to accept the minimum punishment, by age group.
#'
#' A logistic regression model whose response variable is `pun_min` and whose
#' explanatory variable is `age_group`.
"lr_pun_min_a"
