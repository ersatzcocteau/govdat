#' Search Legislators on OpenStates. 
#' 
#' @import httr
#' @importFrom plyr compact
#' @template cg
#' @param state state two-letter abbreviation (character)
#' @param firstname first name of legislator (character)
#' @param lastname last name of legislator (character)
#' @param chamber one of 'upper' or 'lower' (character)
#' @param active TRUE or FALSE (character)
#' @param term filter by legislators who served during a certain term (character)
#' @param district legislative district (character)
#' @param party democratic or republican (character)
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' sll_os_legislatorsearch(state = 'ca', party = 'democratic')
#' sll_os_legislatorsearch(state = 'tx', party = 'democratic', active = TRUE)
#' }
sll_os_legislatorsearch <- function(state = NULL, firstname = NULL, 
    lastname = NULL, chamber = NULL, active = NULL, term = NULL, district = NULL, 
    party = NULL,
    key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list())
{
  url = "http://openstates.org/api/v1/legislators/"
  args <- compact(list(apikey = key, state = state, firstname = firstname, 
                       lastname = lastname, chamber = chamber, active = active, 
                       term = term, district = district, party = party))
  content(GET(url, query=args, callopts))
}