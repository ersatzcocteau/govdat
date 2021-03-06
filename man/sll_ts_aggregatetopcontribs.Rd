\name{sll_ts_aggregatetopcontribs}
\alias{sll_ts_aggregatetopcontribs}
\title{Return the top contributoring organizations, ranked by total dollars given.
   An organization's giving is broken down into money given directly (by
   the organization's PAC) versus money given by individuals employed by
   or associated with the organization.}
\usage{
  sll_ts_aggregatetopcontribs(id = NULL, limit = NULL,
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list())
}
\arguments{
  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}

  \item{callopts}{Optional additional curl options
  (debugging tools mostly)}

  \item{id}{The ID of the entity in the given namespace.}

  \item{limit}{Limit to 'limit' number of records.}
}
\value{
  The top contributoring organizations, ranked by total
  dollars given.
}
\description{
  Return the top contributoring organizations, ranked by
  total dollars given.  An organization's giving is broken
  down into money given directly (by the organization's
  PAC) versus money given by individuals employed by or
  associated with the organization.
}
\examples{
\dontrun{
sll_ts_aggregatetopcontribs(id = '85ab2e74589a414495d18cc7a9233981')
sll_ts_aggregatetopcontribs(id = '85ab2e74589a414495d18cc7a9233981', limit = 3)
}
}

