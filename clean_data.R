#! /usr/bin/env Rscript

## read data
load("birth.Rdata")

## create unique IDs
id <- create_unique_ids(nrow(birth))
birth$id <- id

## variables of interest
vars <- c("id", "dmage", "mrace3", "dmeduc", "dmar", "nprevis", "birmon", "biryr", "weekday", "dgestat",
"csex", "dbirwt", "dplural", "diabetes", "chyper", "preterm", "tobacco", "alcohol", "congan")

## dataset to be cleaned for plausible values
birth <- birth[vars]

## cleaning data
birth <- mutate(birth,
  ID = id,
  AGE_M = ifelse(dmage >= 10 & dmage <= 55, dmage, NA),
  RACE_M = case_when(mrace3 == "1" ~ "1", ## white
  mrace3 == "2" ~ "1", ## black
  mrace3 == "3" ~ "3"), ## other
  MARITAL = case_when(dmar == "1" ~ "1", ## married
  dmar == "2" ~ "2"), ## unmarried
  PRENATAL = ifelse(nprevis == 99, NA, nprevis),
  BIRTHMONTH = as.character(birmon),
  BIRTHYEAR = as.character(biryr),
  BIRTHDAY = as.character(weekday),
  GEST_AGEDELIVER = ifelse(dgestat >= 20 & dgestat <= 40, dgestat, NA),
  SEX = case_when(csex == "1" ~ "1", ## male
  csex == "2" ~ "2"), ## female
  BIRTHWEIGHT = ifelse(dbirwt >= 250 & dbirwt <= 7500, dbirwt, NA),
  PLUR = ifelse(dplural > 0 & dplural < 6, dplural, NA),
  PREPREG_DIAB = as.character(diabetes),
  HTN = as.character(chyper),
  PREV_PRETERM = as.character(preterm),
  TOBACCO = as.character(tobacco),
  ALCOHOL = as.character(alcohol),
  CONANOM = as.character(congan),
  PTB = ifelse(GEST_AGEDELIVER <= 36, "1", "0"),
  LBW = ifelse(BIRTHWEIGHT < 2500, "1", "0")) %>%
  select(-vars)

## save data
write.table(birth, "data.txt", quote = FALSE, row.names = FALSE)
