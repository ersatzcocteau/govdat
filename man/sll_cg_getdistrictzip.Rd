\name{sll_cg_getdistrictzip}
\alias{sll_cg_getdistrictzip}
\title{Get districts that overlap for a certain zip code.}
\usage{
  sll_cg_getdistrictzip(zip = NULL,
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list())
}
\arguments{
  \item{zip}{zip code to search}

  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}

  \item{callopts}{Optional additional curl options
  (debugging tools mostly)}
}
\value{
  List of output fields.
}
\description{
  Get districts that overlap for a certain zip code.
}
\examples{
\dontrun{
sll_cg_getdistrictzip(zip = 27511)
}
}

