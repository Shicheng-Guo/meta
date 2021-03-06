% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary.rm5.R
\name{summary.rm5}
\alias{summary.rm5}
\alias{print.summary.rm5}
\title{Cochrane review: Summary of meta-analyses}
\usage{
\method{summary}{rm5}(object, comp.no, outcome.no, ...)

\method{print}{summary.rm5}(x, ...)
}
\arguments{
\item{object}{An object of class \code{rm5}.}

\item{comp.no}{Comparison number.}

\item{outcome.no}{Outcome number.}

\item{...}{Additional arguments (passed on to \code{metacr}).}

\item{x}{An object of class \code{summary.rm5}.}
}
\description{
Calculate and print a summary of all meta-analyses in a Cochrane
review.
}
\details{
This function can be used to redo all or selected meta-analyses of
a Cochrane Review.

Review Manager 5 (RevMan 5) is the current software used for
preparing and maintaining Cochrane Reviews
(\url{http://community.cochrane.org/tools/review-production-tools/revman-5}).
In RevMan 5, subgroup analyses can be defined and data from a
Cochrane review can be imported to R using the function
\code{read.rm5}.

The R function \code{\link{metacr}} is called internally.
}
\examples{
# Locate export data file "Fleiss1993_CR.csv"
# in sub-directory of package "meta"
#
filename <- system.file("extdata", "Fleiss1993_CR.csv", package = "meta")
Fleiss1993_CR <- read.rm5(filename)

# Print summary results for all meta-analysis
#
summary(Fleiss1993_CR)

# Print summary results only for second outcome of first comparison
#
summary(Fleiss1993_CR, comp.no = 1, outcome.no = 2)

}
\references{
Higgins, J.P.T and S. Green (2011):
\emph{Cochrane Handbook for Systematic Reviews of Interventions
  Version 5.1.0 [Updated March 2011]}.
The Cochrane Library: http://www.cochrane-handbook.org
}
\seealso{
\code{\link{summary.meta}}, \code{\link{metacr}},
  \code{\link{read.rm5}}, \code{\link{metabias.rm5}}
}
\author{
Guido Schwarzer \email{sc@imbi.uni-freiburg.de}
}
