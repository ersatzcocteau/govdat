#' Get information about a particular member's appearances on the House or 
#' Senate floor.
#' 
#' @import httr
#' @importFrom plyr compact
#' @template nyt
#' @param memberid The member's unique ID number (alphanumeric). To find a 
#'    member's ID number, get the list of members for the appropriate House 
#'    or Senate. You can also use the Biographical Directory of the United 
#'    States Congress to get a member's ID. In search results, each member's 
#'    name is linked to a record by index ID (e.g., 
#'    http://bioguide.congress.gov/scripts/biodisplay.pl?index=C001041). 
#'    Use the index ID as member-id in your request.
#' @return Get information about a particular member's appearances on the 
#'    House or Senate floor. 
#' @export
#' @examples \dontrun{
#' nyt_cg_memberappear('S001181')
#' }
nyt_cg_memberappear <- function(memberid = NULL,
  key = getOption("NYTCongressKey", stop("need an API key for the NYT Congress API")),
  callopts = list()) 
{
  url = "http://api.nytimes.com/svc/politics/v3/us/legislative/congress/members/"
  url2 <- paste(url, memberid, '/floor_appearances.json', sep='')
  args <- list('api-key' = key)
  content(GET(url2, query=args, callopts))
}