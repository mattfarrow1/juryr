
# Load Libraries ----------------------------------------------------------

library(dplyr, warn.conflicts = FALSE)
library(here)
library(janitor)
library(lubridate)
library(readxl)
library(forcats)
library(data.table)

# Load Data ---------------------------------------------------------------

# Load data
df <- read_excel(here::here("data", "2022-03-10_voir_dire_data.xlsx"),
                 sheet = "Sheet1 - Clean",
                 col_types = c(
                   "numeric", "numeric", "numeric",
                   "numeric", "numeric", "numeric",
                   "numeric", "numeric", "numeric",
                   "numeric", "numeric", "numeric",
                   "numeric", "numeric", "numeric",
                   "numeric", "numeric", "numeric",
                   "numeric", "numeric", "numeric",
                   "numeric", "numeric", "numeric",
                   "numeric", "numeric", "numeric",
                   "numeric", "numeric", "numeric",
                   "numeric", "numeric", "numeric",
                   "text", "text", "numeric", "numeric",
                   "date", "text", "text", "text", "text",
                   "date", "text", "text", "numeric",
                   "numeric", "text"
                 )
)

# Clean Data --------------------------------------------------------------

# Clean column names
df <- janitor::clean_names(df)

# Rename columns
df <- df |>
  rename(
    state = "s",
    defense = "d",
    amend_5 = "x5",
    judgement = "j",
    eye_witness = "x1_eye_witness",
    jur_race = "race",
    jur_gend = "g",
    jur_bday = "birthday",
    zip_code = "zip"
  )

# Remove empty rows
df <- df |>
  filter(
    !is.na(state),
    !is.na(juror)
  )

# Anonymize defendant name
df$defendants_name <- as.factor(df$defendants_name)
df$defendants_name <- df$defendants_name |> fct_anon("def_")

# Fix typo on date
df[df$voir_dire_date %like% "2317-05-01",43] <- as.Date("2017-05-01")

# Recode 'juror_not_struck' to factor for prop tables and set reference level to "0"
df$juror_not_struck <-  as.factor(df$juror_not_struck)
df$juror_not_struck <- recode(df$juror_not_struck, '0' = "Not a Juror", '1' = "Juror")
df$juror_not_struck <- relevel(df$juror_not_struck, ref = "Juror")

# Race --------------------------------------------------------------------

# Relabel juror race
df$jur_race <-
  recode(df$jur_race,
         B = "Black",
         H = "Hispanic",
         W = "White",
         A = "Asian",
         O = "Other",
         MA = "Hispanic",
         I = "Asian",
         "NA" = "Native American"
  )

# Relabel defendant race
df$defendants_race <- recode(df$defendants_race,
                             B = "Black",
                             H = "Hispanic",
                             W = "White",
                             A = "Asian",
                             O = "Other",
                             MA = "Hispanic",
                             I = "Asian"
)

# Gender ------------------------------------------------------------------

# Relabel juror gender
df$jur_gend <-
  recode(df$jur_gend,
         "F" = "Female",
         M = "Male",
         O = "Other"
  )

# Relabel defendant gender
df$defendants_gender <-
  recode(df$defendants_gender,
         "F" = "Female",
         M = "Male",
         O = "Other"
  )

# Age ---------------------------------------------------------------------

# Convert jurors birthday to just an age
df <- df |> mutate(jur_age = interval(jur_bday, voir_dire_date) / years(1))

# Create age buckets
df$age_group <- cut(df$jur_age,
                    breaks = c(-Inf, 30, 45, 55, Inf),
                    labels = c("18 - 30", "31 - 44", "45 - 54", "55 +")
)

# Change age to integer
df$jur_age = as.integer(df$jur_age)

# Drop juror birthday
df <- df |> select(-jur_bday)

# Put juror age with other juror columns
df <- df |> relocate(jur_age, .before = jur_race)

# Convert character columns to factors
df <- df |> mutate(across(where(is_character), as_factor))

# Peremptory Strikes ------------------------------------------------------

# If a peremptory strike was used, by whom?
df <- df |>
  mutate(peremptory_strike = if_else(state == TRUE,
                                     "State",
                                     if_else(defense == TRUE,
                                             "Defense",
                                             "No"
                                     )
  ))

caused <- c(
  "ammend_5",
  "inn",
  "bias_no_fair",
  "bias_for_state",
  "bias_a_g_state",
  "bias_for_def",
  "bias_a_g_def",
  "bias_a_g_police",
  "bias_for_police",
  "bop_100_percent",
  "pun",
  "pun_min",
  "pun_max"
)

biased <- c(
  "bias_no_fair",
  "bias_for_state",
  "bias_a_g_state",
  "bias_for_def",
  "bias_a_g_def",
  "bias_a_g_police",
  "bias_for_police"
)

pun <- c(
  "pun",
  "pun_min",
  "pun_max"
)

struck <- c(
  "state", "defense"
)

exempt <- c(
  "med",
  "work_exempt",
  "child_exempt",
  "age_exempt"
)

disq <- c(
  "esl",
  "no_show"
)

# Calculate the number of instances of each type of dismissal
df <- df |>
  rowwise() |>
  mutate(
    jur_caused = as.factor(sum(across(c(caused)))),
    jur_struck = as.factor(sum(across(c(all_of(struck))))),
    jur_exempt = as.factor(sum(across(all_of(exempt)))),
    jur_disqualified = as.factor(sum(across(all_of(disq)))),
    jur_biased = as.factor(sum(across(all_of(biased)))),
    jur_pun = as.factor(sum(across(all_of(pun))))
  )

# # Assume juror 4 jur_disqualified = No (prior_convictions is NA)
# df$jur_disqualified[4] <- 0

# Make this a binary factor
df <- df |>
  mutate(
    jur_caused = (if (jur_caused == 0) "No" else "Yes"),
    jur_struck = (if (jur_struck == 0) "No" else "Yes"),
    jur_exempt = (if (jur_exempt == 0) "No" else "Yes"),
    jur_disqualified = (if (jur_disqualified == 0) "No" else "Yes"),
    jur_biased = as.factor(if (jur_biased == 0) "No" else "Yes"),
    jur_pun = as.factor(if (jur_pun == 0) "No" else "Yes")
  )

# Final Clean Up ----------------------------------------------------------

# Make 'clean' df and remove all missing values except for notes, area_name, and four
cols <- colnames(df)
cols <- cols[!(cols %in% c("notes", "area_name", "four"))]

df_clean <- df[!is.na(df$jur_age), ]
df_clean <- df_clean[!is.na(df_clean$bop_100_percent), ]
df_clean <- df_clean[!is.na(df_clean$prior_conviction), ]
df_clean <- df_clean[!is.na(df_clean$jur_race), ]
df_clean <- df_clean[!is.na(df_clean$jur_gend), ]
df_clean <- df_clean[!is.na(df_clean$zip_code), ]
df_clean <- df_clean[!is.na(df_clean$age_group), ]

names <- c(1:4, 6:33, 37:38, 47, 50:54)
df_clean[,names] <- lapply(df_clean[,names] , factor)

# Create Data Sets --------------------------------------------------------

venire <- df_clean |>
  ungroup() |>
  rename(venireperson = juror) |>
  mutate(juror_id = row_number(), .before = venireperson)

disqualified_yes <- venire |> filter(esl == 1 | no_show == 1)

disqualified_no <- venire |> filter(esl == 0 & no_show == 0)

exempt_yes <- venire |>
  filter(age_exempt == 1 |
           work_exempt == 1 |
           child_exempt == 1)

exempt_no <- disqualified_no |>
  filter(age_exempt == 0 &
           work_exempt == 0 &
           child_exempt == 0)

# Copying this to bullpen to match existing code
bullpen <- disqualified_no

# Save Data ---------------------------------------------------------------

save(bullpen,
     # caused,
     # caused_no_reason,
     # disqualified,
     disqualified_no,
     disqualified_yes,
     exempt_no,
     exempt_yes,
     # no_disq_venire,
     # exempt,
     # no_disq_no_exempt,
     venire,
     file = here::here("data", "jury_data.RData"))

