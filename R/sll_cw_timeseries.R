#' Find the popularity of a phrase over a period of time.
#'    
#' @import httr
#' @importFrom plyr compact rbind.fill
#' @importFrom stringr str_sub
#' @template cw
#' @return A data.frame with number of times (and percentages of the text result, 
#' if selected).
#' @export
#' @examples \dontrun{
#' # Search for a phrase to get a time series of 
#' sll_cw_timeseries(phrase='climate change')
#' 
#' # Get percentages back, which are not returned by default
#' sll_cw_timeseries(phrase='climate change', percentages=TRUE)
#' 
#' # Get a list of how many times the phrase "united states" was said by 
#' # legislators from Virginia on each day of the most recent Congress:
#' sll_cw_timeseries(phrase='united states', entity_type='state', 
#' entity_value='VA')
#' 
#' # Get a list of how many times the phrase "united States" appears in the 
#' # Congressional Record on each day between Jan. 1, 2010, and June 1, 2010:
#' sll_cw_timeseries(phrase='united states', start_date='2009-01-01', 
#' end_date='2009-06-01')
#' 
#' # Get a list of how many times the phrase "united states" appears in the 
#' # Congressional Record in each month between January and June, 2010:
#' sll_cw_timeseries(phrase='united states', start_date='2009-01-01', 
#' end_date='2009-04-30', granularity='month')
#' 
#' # Plot data
#' library(ggplot2)
#' dat <- sll_cw_timeseries(phrase='climate change')
#' ggplot(dat, aes(day, count)) + geom_line() + theme_grey(base_size=20)
#' 
#' dat_d <- sll_cw_timeseries(phrase='climate change', party="D")
#' dat_d$party <- rep("D", nrow(dat_d))
#' dat_r <- sll_cw_timeseries(phrase='climate change', party="R")
#' dat_r$party <- rep("R", nrow(dat_r))
#' dat_both <- rbind(dat_d, dat_r)
#' ggplot(dat_both, aes(day, count, colour=party)) + geom_line() + 
#' theme_grey(base_size=20) + scale_colour_manual(values=c("blue","red"))
#' }

sll_cw_timeseries <- function(phrase=NULL, start_date=NULL, end_date=NULL,
  chamber=NULL, state=NULL, party=NULL, bioguide_id=NULL, mincount=NULL,
  percentages=NULL, granularity='day', entity_type=NULL, entity_value=NULL,
  key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  callopts=list()) 
{
  splitt<-function(x) paste(str_sub(x, 1, 4), "-", str_sub(x, 5, 6), sep="")
  url = "http://capitolwords.org/api/dates.json"
  if(!is.null(percentages)){
     if(percentages) percentages='true'
     else percentages=NULL
  }
  args <- compact(list(apikey=key, phrase=phrase, start_date=start_date,
                       end_date=end_date, chamber=chamber, state=state, 
                       party=party, bioguide_id=bioguide_id, mincount=mincount,
                       percentages=percentages, granularity=granularity, 
                       entity_type=entity_type, entity_value=entity_value))  
  tt <- content(GET(url, query=args, callopts))
  message(sprintf('%s records returned', length(tt[[1]])))
  data <- do.call(rbind.fill, lapply(tt[[1]], function(x) data.frame(x)))
  if(granularity=='day'){ data$day <- as.Date(data$day) } else
    if(granularity=='month'){ data$month <- as.Date(sprintf("%s-01", sapply(data$month, splitt))) } else
      if(granularity=='year'){ data$year <- as.Date(sprintf("%s-01-01", data$year)) }
  data
}
