\name{nyt_cg_memberslist}
\alias{nyt_cg_memberslist}
\title{Get a list of members of a particular chamber in a particular Congress.}
\usage{
  nyt_cg_memberslist(congress_no = NULL, chamber = NULL,
    state = NULL, district = NULL,
    key = getOption("NYTCongressKey", stop("need an API key for the NYT Congress API")),
    callopts = list())
}
\arguments{
  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}

  \item{callopts}{Optional additional curl options
  (debugging tools mostly)}

  \item{congress_no}{The number of the Congress during
  which the members served.}

  \item{chamber}{One of 'house' or 'senate.}

  \item{state}{Limits the list of members by state;
  two-letter state code (e.g., CA).}

  \item{district}{Limits the list of members by district
  (House only). If you specify a district, you must also
  specify a state. If the district number you specify is
  higher than the total number of districts for that state,
  a 404 response will be returned.}
}
\value{
  List of members of a particular chamber in a particular
  Congress.
}
\description{
  Get a list of members of a particular chamber in a
  particular Congress.
}
\examples{
\dontrun{
nyt_cg_memberslist(112, 'senate')
nyt_cg_memberslist(112, 'senate', 'NH')
nyt_cg_memberslist(110, 'senate', 'NH', responseformat='xml')
}
}

