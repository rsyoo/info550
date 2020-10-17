#! /usr/bin/env Rscript

# read in data
birth <- read.table("clean.txt", header = TRUE)

# save scatterplot as png file
png("fig1.png")

# make scatterplot
plot(birth$BIRTHWEIGHT, birth$AGE_M,
     xlab = "Birthweight (g)",
     ylab = "Maternal age (yrs)",
     pch = 19)
     
dev.off()
     
