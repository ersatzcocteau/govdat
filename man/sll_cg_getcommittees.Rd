\name{sll_cg_getcommittees}
\alias{sll_cg_getcommittees}
\title{Gets details (subcommittees + membership) for a committee by id.}
\usage{
  sll_cg_getcommittees(id = NULL,
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list())
}
\arguments{
  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}

  \item{callopts}{Optional additional curl options
  (debugging tools mostly)}

  \item{id}{committee id (eg. JSPR)}
}
\value{
  Committee details including subcommittees and all
  members.
}
\description{
  Gets details (subcommittees + membership) for a committee
  by id.
}
\examples{
\dontrun{
sll_cg_getcommittees(id = 'JSPR')
}
}

