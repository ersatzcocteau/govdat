\name{nyt_cg_membervotecompare}
\alias{nyt_cg_membervotecompare}
\title{Get a list of members who have left the Senate or House or have announced plans to do so.}
\usage{
  nyt_cg_membervotecompare(memberid_1 = NULL,
    memberid_2 = NULL, congress_no = NULL, chamber = NULL,
    key = getOption("NYTCongressKey", stop("need an API key for the NYT Congress API")),
    callopts = list())
}
\arguments{
  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}

  \item{callopts}{Optional additional curl options
  (debugging tools mostly)}

  \item{memberid_1}{The member's unique ID number
  (alphanumeric). To find a member's ID number, get the
  list of members for the appropriate House or Senate. You
  can also use the Biographical Directory of the United
  States Congress to get a member's ID. In search results,
  each member's name is linked to a record by index ID
  (e.g.,
  http://bioguide.congress.gov/scripts/biodisplay.pl?index=C001041).
  Use the index ID as member-id in your request.}

  \item{memberid_2}{See description for memberid_1.}

  \item{congress_no}{The number of the Congress during
  which the members served.}

  \item{chamber}{One of 'house' or 'senate.}
}
\value{
  List of new members of he current Congress.
}
\description{
  Get a list of members who have left the Senate or House
  or have announced plans to do so.
}
\examples{
\dontrun{
nyt_cg_membervotecompare('S001181', 'A000368', 112, 'senate')
}
}

