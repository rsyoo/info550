#! /usr/bin/env Rscript

# read in data
load("birth_cleaned.Rdata")

png("fig1.png")

plot(birth$BIRTHWEIGHT, birth$AGE_M,
     xlab = "Birthweight (g)",
     ylab = "Maternal age (yrs)",
     pch = 19)
     
dev.off()
     
