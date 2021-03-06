\name{sll_cw_timeseries}
\alias{sll_cw_timeseries}
\title{Find the popularity of a phrase over a period of time.}
\usage{
  sll_cw_timeseries(phrase = NULL, start_date = NULL,
    end_date = NULL, chamber = NULL, state = NULL,
    party = NULL, bioguide_id = NULL, mincount = NULL,
    percentages = NULL, granularity = "day",
    entity_type = NULL, entity_value = NULL,
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list())
}
\arguments{
  \item{phrase}{Phrase to search.}

  \item{title}{Title of page to search.}

  \item{start_date}{Start date to search on.}

  \item{end_date}{End date to search on.}

  \item{chamber}{Chamber of congress, House or Senate.}

  \item{state}{State, capital two-letter abbreviation
  (e.g., AK,AZ,NM).}

  \item{party}{Political party (one of D,R,I).}

  \item{bioguide_id}{Bioguide ID for politician (e.g.,
  B000243)}

  \item{congress}{Congressional session (e.g.,
  110,111,112)}

  \item{session}{Session within the current congress (e.g.,
  1,2)}

  \item{cr_pages}{No definition.}

  \item{volume}{No definition.}

  \item{page}{No definition.}

  \item{mincount}{Only return results where mentions are at
  or above the supplied threshold.}

  \item{percentages}{Include the percentage of mentions
  versus total words in the result objects. Valid values:
  TRUE, FALSE}

  \item{granularity}{The length of time covered by each
  result. Valid values: 'year', 'month', 'day' (default)}

  \item{key}{Your SunlightLabs API key; loads from
  .Rprofile.}

  \item{callopts}{Further curl options (debugging tools
  mostly)}

  \item{entity_type}{The entity type to get top phrases
  for. Valid values: 'date', 'month', 'state',
  'legislator'}

  \item{entity_value}{The value of the entity given in
  entity_type. Formats are as follows: date: 2011-11-09;
  month: 201111; state: NY; legislator (bioguide): L000551}
}
\value{
  A data.frame with number of times (and percentages of the
  text result, if selected).
}
\description{
  Find the popularity of a phrase over a period of time.
}
\examples{
\dontrun{
# Search for a phrase to get a time series of
sll_cw_timeseries(phrase='climate change')

# Get percentages back, which are not returned by default
sll_cw_timeseries(phrase='climate change', percentages='true')

# Get a list of how many times the phrase "united states" was said by
# legislators from Virginia on each day of the most recent Congress:
sll_cw_timeseries(phrase='united states', entity_type='state',
entity_value='VA')

# Get a list of how many times the phrase "united States" appears in the
# Congressional Record on each day between Jan. 1, 2010, and June 1, 2010:
sll_cw_timeseries(phrase='united states', start_date='2009-01-01',
end_date='2009-06-01')

# Get a list of how many times the phrase "united states" appears in the
# Congressional Record in each month between January and June, 2010:
sll_cw_timeseries(phrase='united states', start_date='2009-01-01',
end_date='2009-04-30', granularity='month')

# Plot data
library(ggplot2)
dat <- sll_cw_timeseries(phrase='climate change')
ggplot(dat, aes(day, count)) + geom_line() + theme_grey(base_size=20)

dat_d <- sll_cw_timeseries(phrase='climate change', party="D")
dat_d$party <- rep("D", nrow(dat_d))
dat_r <- sll_cw_timeseries(phrase='climate change', party="R")
dat_r$party <- rep("R", nrow(dat_r))
dat_both <- rbind(dat_d, dat_r)
ggplot(dat_both, aes(day, count, colour=party)) + geom_line() +
theme_grey(base_size=20) + scale_colour_manual(values=c("blue","red"))
}
}

