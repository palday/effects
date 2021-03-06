\name{Prestige}
\alias{Prestige}
\docType{data}

\title{Prestige of Canadian Occupations}

\description{
The \code{Prestige} data frame has 102 rows and 6 columns.
The observations are occupations.
}

\format{
  This data frame contains the following columns:
  \describe{
    \item{education}{
      Average education (years) of occupational incumbents, in 1971. 
      }
    \item{income}{
      Average income (dollars) of incumbents, 1971.
      }
    \item{women}{
      Percentage of incumbents who are women, 1971.
      }
    \item{prestige}{
      Pineo-Porter prestige score for occupation, from a social survey
      conducted in the mid-1960s.
      }
    \item{census}{
      Canadian Census occupational code.
      }
    \item{type}{
      Type of occupation.
      A factor with levels (note: out of order):
      \code{bc}, Blue Collar;
      \code{prof}, Professional, Managerial, and Technical;
      \code{wc}, White Collar. 
      }
    }
  }

\source{
 Canada (1971)
 \emph{Census of Canada}. Vol. 3, Part 6. Statistics Canada [pp. 19-1--19-21].
 
 Personal communication from B. Blishen, W. Carroll, and
 C. Moore, Departments of Sociology, York University and
 University of Victoria.
}

\references{
  Fox, J. (1997)
  \emph{Applied Regression, Linear Models, and Related Methods.} Sage.
}


\usage{
Prestige
}

\keyword{datasets}
