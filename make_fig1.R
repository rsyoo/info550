#! /usr/bin/env Rscript

# read in data
load("birth_cleaned.Rdata")

# save scatterplot as png file
png("fig1.png")

# make scatterplot
plot(birth$BIRTHWEIGHT, birth$AGE_M,
     xlab = "Birthweight (g)",
     ylab = "Maternal age (yrs)",
     pch = 19)
     
dev.off()
     
