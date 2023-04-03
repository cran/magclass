## ---- echo = FALSE------------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ---- echo = TRUE-------------------------------------------------------------
library(magclass)
a <- maxample("animal")
p <- maxample("pop")

## ---- echo = TRUE-------------------------------------------------------------
getItems(a, split = TRUE)

## ---- echo = TRUE-------------------------------------------------------------
getItems(a, dim = 1, split = TRUE)

## ---- echo = TRUE-------------------------------------------------------------
getItems(a, dim = 1.1, full = TRUE)

## ---- echo = TRUE-------------------------------------------------------------
dimSums(a, c("x", "y", "cell", "day", "month", "species", "color"))

getCPR(a, 3.2)

add_dimension(p[, 1, 1], 1.2)

add_columns(p[, 1, 1], dim = "i")

## ---- echo = TRUE-------------------------------------------------------------
p[3, dim = 2] # equivalent to p[,3,]

## ---- echo = TRUE-------------------------------------------------------------
getItems(a, dim = 3.2)
getItems(a, dim = "color")

## ---- echo = TRUE-------------------------------------------------------------
getItems(a, dim = 3.2, full = TRUE)

## ---- echo = TRUE-------------------------------------------------------------
getItems(a, dim = 3)

## ---- echo = TRUE-------------------------------------------------------------
getItems(a, dim = 3, split = TRUE)

## ---- echo = TRUE-------------------------------------------------------------
getItems(a, dim = "color") <- paste0("color", 1:4)
getItems(a, dim = 3)

## ---- echo = TRUE-------------------------------------------------------------
getItems(a, dim = "color", full = TRUE) <- paste0("color", 1:5)
getItems(a, dim = 3)

## ---- echo = TRUE-------------------------------------------------------------
getItems(a, dim = "color") <- NULL
getItems(a, dim = 3)

## ---- echo = TRUE-------------------------------------------------------------
getItems(a, maindim = 3, dim = "newcolor") <- paste0("color", 1:5)
getItems(a, dim = 3)

