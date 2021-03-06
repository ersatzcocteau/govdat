\name{nyt_cg_memberbioroles}
\alias{nyt_cg_memberbioroles}
\title{Get biographical and Congressional role information for a particular member of Congress.}
\usage{
  nyt_cg_memberbioroles(memberid = NULL,
    key = getOption("NYTCongressKey", stop("need an API key for the NYT Congress API")),
    callopts = list())
}
\arguments{
  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}

  \item{callopts}{Optional additional curl options
  (debugging tools mostly)}

  \item{memberid}{The member's unique ID number
  (alphanumeric). To find a member's ID number, get the
  list of members for the appropriate House or Senate. You
  can also use the Biographical Directory of the United
  States Congress to get a member's ID. In search results,
  each member's name is linked to a record by index ID
  (e.g.,
  http://bioguide.congress.gov/scripts/biodisplay.pl?index=C001041).
  Use the index ID as member-id in your request.}
}
\value{
  List of members of a particular chamber in a particular
  Congress.
}
\description{
  Get biographical and Congressional role information for a
  particular member of Congress.
}
\examples{
\dontrun{
nyt_cg_memberbioroles('S001181')
}
}

