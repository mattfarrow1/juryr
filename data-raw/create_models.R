# Models ------------------------------------------------------------------

# The models here are the ones that were significant at a p < 0.05 level.

# Caused, by race only
lr_caused <- glm(jur_caused ~ jur_race_w, data = bullpen, family = "binomial")

# Caused, by age group only
lr_caused_a <- glm(jur_caused ~ age_group, data = bullpen, family = "binomial")

# Caused, by gender only
lr_caused_g <- glm(jur_caused ~ jur_gend, data = bullpen, family = "binomial")

#                                 By I-30 Split
# ────────────────────────────────────────────────────────────────────────────▶

# Caused by I-30 split only
lr_i30 <- glm(jur_caused ~ i_30, data = bullpen, family = "binomial")

# Caused by I-30 split and race
lr_caused_i30 <- glm(jur_caused ~ i_30 * jur_race_w, data = bullpen, family = "binomial")

#                             5th Amendment Rights
# ────────────────────────────────────────────────────────────────────────────▶

# For these models, the potential juror was unable to accept a defendant's 5th
# Amendment rights

# By race
lr_cause_5am <- glm(ammend_5 ~ jur_race_w, data = bullpen, family = "binomial")

# By age group and I-30 split
lr_cause_5am_a <- glm(ammend_5 ~ i_30 * age_group, data = bullpen, family = "binomial")

# By gender
lr_cause_5am_g <- glm(ammend_5 ~ jur_gend, data = bullpen, family = "binomial")

#                                 General Bias
# ────────────────────────────────────────────────────────────────────────────▶

# By race
lr_cause_bias <- glm(jur_biased ~ jur_race_w, data = bullpen, family = "binomial")

# By age group
lr_cause_bias_a <- glm(jur_biased ~ age_group, data = bullpen, family = "binomial")

# By gender (all)
lr_cause_bias_g <- glm(jur_biased ~ jur_gend, data = bullpen, family = "binomial")

# By gender (male & female only)
no_other_gen <- filter(bullpen, jur_gend != "Other")
lr_caused_mf <- glm(jur_caused ~ jur_gend, data = no_other_gen, family = "binomial")

#                            Bias Against the State
# ────────────────────────────────────────────────────────────────────────────▶

# By gender
lr_bias_a_g_state_g <- glm(bias_a_g_state ~ jur_gend, data = bias_subset, family = "binomial")

#                           Bias Against the Defense
# ────────────────────────────────────────────────────────────────────────────▶

# By race
lr_bias_a_g_def <- glm(bias_a_g_def ~ jur_race_w, data = bias_subset, family = "binomial")

# By gender
lr_bias_a_g_def_g <- glm(bias_a_g_def ~ jur_gend, data = bias_subset, family = "binomial")

#                            Bias Against the Police
# ────────────────────────────────────────────────────────────────────────────▶

# By race
lr_bias_a_g_police <- glm(bias_a_g_police ~ jur_race_w, data = bias_subset, family = "binomial")

# By age group
lr_bias_a_g_police_a <- glm(bias_a_g_police ~ age_group, data = bias_subset, family = "binomial")

# By gender
lr_bias_a_g_police_g <- glm(bias_a_g_police ~ jur_gend, data = bias_subset, family = "binomial")

#                                Burden of Proof
# ────────────────────────────────────────────────────────────────────────────▶

# By race
lr_cause_bop <- glm(bop_100_percent ~ jur_race_w, data = bullpen, family = "binomial")

# By age group
lr_cause_bop_a <- glm(bop_100_percent ~ age_group, data = bullpen, family = "binomial")

# By gender
lr_cause_bop_g <- glm(bop_100_percent ~ jur_gend, data = bullpen, family = "binomial")

#                           Presumption of Innocence
# ────────────────────────────────────────────────────────────────────────────▶

# For these models, the potential juror was unable to accept a the presumption
# of innocence for a defendant

# By race and I-30 split
lr_cause_inn <- glm(inn ~ i_30 * jur_race_w, data = bullpen, family = "binomial")

# By age group
lr_cause_inn_a <- glm(inn ~ age_group, data = bullpen, family = "binomial")

#                            Punishment (Full Range)
# ────────────────────────────────────────────────────────────────────────────▶

# By race
lr_cause_pun <- glm(jur_pun ~ jur_race_w, data = bullpen, family = "binomial")

# By age group
lr_cause_pun_a <- glm(jur_pun ~ age_group, data = bullpen, family = "binomial")

# By gender
lr_cause_pun_g <- glm(jur_pun ~ jur_gend, data = bullpen, family = "binomial")

#                             Punishment (Maximum)
# ────────────────────────────────────────────────────────────────────────────▶

# By race
lr_pun_max <- glm(pun_max ~ jur_race_w, data = pun_subset, family = "binomial")

# By age group
lr_pun_max_a <- glm(pun_max ~ age_group, data = pun_subset, family = "binomial")


#                             Punishment (Minimum)
# ────────────────────────────────────────────────────────────────────────────▶

# By age group
lr_pun_min_a <- glm(pun_min ~ age_group, data = pun_subset, family = "binomial")
