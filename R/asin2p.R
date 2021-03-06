asin2p <- function(x, n = NULL, value = "mean", warn = TRUE) {
  
  ##
  ## Do nothing if all values are NA
  ## 
  if (all(is.na(x)))
    return(x)
  
  
  ##
  ## Calculate possible minimum and maximum
  ## for each transformation
  ##
  if (is.null(n)) {
    minimum <- asin(sqrt(0))
    maximum <- asin(sqrt(1))
  }
  else {
    minimum <- 0.5 * (asin(sqrt(0 / (n + 1))) + asin(sqrt((0 + 1) / (n + 1))))
    maximum <- 0.5 * (asin(sqrt(n / (n + 1))) + asin(sqrt((n + 1) / (n + 1))))
  }
  ##
  sel0 <- x < minimum
  sel1 <- x > maximum
  
  
  ##
  ## Check for (impossible) negative values
  ##
  if (any(sel0, na.rm = TRUE)) {
    if (is.null(n)) {
      if (warn)
        warning("Negative value for ",
                if (length(x) > 1)
                  "at least one ",
                if (value == "mean")
                  paste0("transformed proportion using arcsine transformation.",
                         "\n  Proportion set to 0."),
                if (value == "lower")
                  paste0("lower confidence limit using arcsine transformation.",
                         "\n  Lower confidence limit set to 0."),
                if (value == "upper")
                  paste0("upper confidence limit using arcsine transformation.",
                         "\n  Upper confidence limit set to 0."))
    }
    else {
      if (warn)
        warning("Too small value for ",
                if (length(x) > 1)
                  "at least one ",
                if (value == "mean")
                  paste0("transformed proportion using Freeman-Tukey double ",
                         "arcsine transformation.\n  Proportion set to 0."),
                if (value == "lower")
                  paste0("lower confidence limit using Freeman-Tukey double ",
                         "arcsine transformation.",
                         "\n  Lower confidence limit set to 0."),
                if (value == "upper")
                  paste0("upper confidence limit using Freeman-Tukey double ",
                         "arcsine transformation.",
                         "\n  Upper confidence limit set to 0."))
    }
  }
  
  ##
  ## Check for (impossible) large values
  ##
  if (any(sel1, na.rm = TRUE)) {
    if (is.null(n)) {
      if (warn)
        warning("Too large value for ",
                if (length(x) > 1)
                  "at least one ",
                if (value == "mean")
                  paste0("transformed proportion using arcsine transformation.",
                         "\n  Proportion set to 1."),
                if (value == "lower")
                  paste0("lower confidence limit using arcsine transformation.",
                         "\n  Lower confidence limit set to 1."),
                if (value == "upper")
                  paste0("upper confidence limit using arcsine transformation.",
                         "\n  Upper confidence limit set to 1."))
    }
    else {
      if (warn)
        warning("Too large value for ",
                if (length(x) > 1)
                  "at least one ",
                if (value == "mean")
                  paste0("transformed proportion using Freeman-Tukey double ",
                         "arcsine transformation.\n  Proportion set to 1."),
                if (value == "lower")
                  paste0("lower confidence limit using Freeman-Tukey double ",
                         "arcsine transformation.",
                         "\n  Lower confidence limit set to 1."),
                if (value == "upper")
                  paste0("upper confidence limit using Freeman-Tukey double ",
                         "arcsine transformation.",
                         "\n  Upper confidence limit set to 1."))
    }
  }
  
  
  res <- rep(NA, length(x))
  ##
  sel <- !(sel0 | sel1)
  sel <- !is.na(sel) & sel
  ##
  res[sel0] <- 0
  res[sel1] <- 1
  ##
  if (is.null(n)) {
    ##
    ## Back transformation of arcsine transformation:
    ##
    res[sel] <- sin(x[sel])^2
  }
  else {
    ##
    ## Back transformation of Freeman-Tukey double arcsine transformation:
    ##
    res[sel] <- 0.5 * (1 - sign(cos(2 * x[sel])) *
                       sqrt(1 - (sin(2 * x[sel]) +
                                 (sin(2 * x[sel]) -
                                  1 / sin(2 * x[sel])) / n[sel])^2))
  }
  res
}
