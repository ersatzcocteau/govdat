#' Return the top contributoring organizations, ranked by total dollars given. 
#'    An organization's giving is broken down into money given directly (by 
#'    the organization's PAC) versus money given by individuals employed by 
#'    or associated with the organization.
#'    
#' @import httr
#' @importFrom plyr compact
#' @template cg
#' @param id The ID of the entity in the given namespace.
#' @param limit Limit to 'limit' number of records.
#' @return The top contributoring organizations, ranked by total dollars given.
#' @export
#' @examples \dontrun{
#' sll_ts_aggregatetopcontribs(id = '85ab2e74589a414495d18cc7a9233981')
#' sll_ts_aggregatetopcontribs(id = '85ab2e74589a414495d18cc7a9233981', limit = 3)
#' }
sll_ts_aggregatetopcontribs <- function(id = NULL, limit = NULL,
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  callopts = list())
{
  url = "http://transparencydata.com/api/1.0/aggregates/pol/"
  url2 <- paste(url, id, '/contributors.json', sep='')
  args <- compact(list(apikey = key, limit = limit))
  content(GET(url2, query=args, callopts))
}
# http://transparencydata.com/api/1.0/aggregates/pol/ff96aa62d48f48e5a1e284efe74a0ba8/contributors.json?apikey=<you-key>&limit=3