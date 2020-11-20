#! /usr/bin/env Rscript

# read in data
birth <- read.table("data/clean.txt", header = TRUE)

# save scatterplot as png file
png("figs/fig1.png")

# make scatterplot
plot(birth$BIRTHWEIGHT, birth$AGE_M,
     xlab = "Birthweight (g)",
     ylab = "Maternal age (yrs)",
     pch = 19)
     
dev.off()
     
