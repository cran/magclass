## ---- echo = FALSE------------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
# set back to default
options(magclass_expand_version = 2.1)
options(magclass_setMatching = FALSE)

## ---- echo = TRUE-------------------------------------------------------------
library(magclass)

#
a <- b <- maxample("pop")
getRegions(b)[1] <- "AAA"

## ---- echo = TRUE-------------------------------------------------------------

options(magclass_expand_version = 2.1) # default setting for magclass >= 5.0
head(a * b)

## ---- echo = TRUE-------------------------------------------------------------
options(magclass_expand_version = 2.1) # default setting for magclass >= 5.0

a <- b <- maxample("pop")

getSets(a)[1] <- "import"
getSets(b)[1] <- "export"

options(magclass_setMatching = FALSE)
head(a * b)

## ---- echo = TRUE-------------------------------------------------------------
options(magclass_setMatching = TRUE)
head(a * b)

## ---- echo = TRUE-------------------------------------------------------------
options(magclass_expand_version = 2.1) # default setting for magclass >= 5.0

a <- b <- maxample("pop")

getRegions(a)[1] <- "AAA"
getRegions(b)[1] <- "BBB"

options(magclass_setMatching = FALSE)
head(a * b)

## ---- echo = TRUE, error=TRUE-------------------------------------------------
options(magclass_setMatching = TRUE)
head(a * b)

## ---- echo = FALSE------------------------------------------------------------
# set back to default
options(magclass_expand_version = 2.1)
options(magclass_setMatching = FALSE)

