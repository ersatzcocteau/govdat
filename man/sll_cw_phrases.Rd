\name{sll_cw_phrases}
\alias{sll_cw_phrases}
\title{List the top phrases for a facet.}
\usage{
 sll_cw_phrases(entity_type=NULL,entity_value=NULL,n=1,sort="count",
  key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")))
}
\arguments{
  \item{entity_type}{The entity type to get top phrases
  for. Valid values: 'date', 'month', 'state',
  'legislator'}

  \item{entity_value}{The value of the entity given in
  entity_type. Formats are as follows: date: 2011-11-09;
  month: 201111; state: NY; legislator (bioguide): L000551}

  \item{n}{The size of phrase, in words, to search for (up to 5).}

  \item{sort}{The metric and direction to sort by. Valid values: tfidf (default) count. Both a metric and direction must be supplied, such as sort="count asc".}

  \item{key}{Your SunlightLabs API key; loads from
  .Rprofile.}

}
\value{
  A data.frame of phrases with tf-idf and count data.
}
\description{
  List the top phrases for a facet.
}
\examples{
\dontrun{
#List the top words in July 2010 by count:
sll_cw_phrases(entity_type="month",entity_value="201007",key=<YOUR_KEY>)

#List the top words for Nevada:
sll_cw_phrases(entity_type="state",entity_value="NV",key=<YOUR_KEY>)

#List the top words for Nevada:
sll_cw_phrases(entity_type="legislator",entity_value="L000551",key=<YOUR_KEY>)


}
}
