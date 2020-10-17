#! /usr/bin/env Rscript

png("fig1.png")

plot(birth$BIRTHWEIGHT, birth$AGE_M,
     xlab = "Birthweight (g)",
     ylab = "Maternal age (yrs)",
     pch = 19)
     
dev.off()
     
