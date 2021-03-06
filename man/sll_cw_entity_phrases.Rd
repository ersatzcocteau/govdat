\name{sll_cw_entity_phrases}
\alias{sll_cw_entity_phrases}
\title{Get the top (legislator|state|party|bioguide_id|volume|chamber)s for a phrase. Standard arguments are supported.}
\usage{
 sll_cw_entity_phrases(entity,phrase=NULL,mincount=1,sort="count",
  key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")))
}
\arguments{
  \item{entity}{One of "legislator", "state", "party", "bioguide_id", "volume", or "chamber".}

  \item{mincount}{Only return results where mentions are at or above the supplied threshold.}

  \item{sort}{The metric on which to sort top results.}
  
  \item{state}{Limit results to members of Congress from the given state. Valid values: 2-letter state abbreviation, such as MD, VA, DC.}

  \item{party}{Limit results to members of Congress from the given party. Valid values: "R", "D", "I"}

  \item{chamber}{The chamber to search. Default includes House, Senate and extensions of remarks. Valid values: "house", "senate", "extensions", "date".}

  \item{date}{Show results for only the given date.}
   \item{start_date}{Limit results to those on or after the given date.}
   \item{end_date}{Limit results to those on or before the given date.}
   
   \item{key}{Your SunlightLabs API key; loads from
  .Rprofile.}
}
\value{
  A data.frame of entities with associated count data.
}
\description{
  Get the top (legislator|state|party|bioguide_id|volume|chamber)s for a phrase.
}
\examples{
\dontrun{
#Get a list of pieces of text with the phrase "obama administration" in them:
sll_cw_entity_phrases(phrase="obama administration",key=<YOUR_KEY>)

#Get a list of pieces of text by Republicans with the phrase "health care debate" in them:
sll_cw_entity_phrases(phrase="health care debate",party="R",key=<YOUR_KEY>)

}
}
