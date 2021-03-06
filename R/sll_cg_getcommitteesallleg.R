#' Gets a list of all committees that a member serves on, including subcommittes.
#' 
#' @import httr
#' @importFrom plyr compact
#' @template cg
#' @param bioguide_id legislator's bioguide_id
#' @return Committee details for all committees that the given member serves on.
#' @export
#' @examples \dontrun{
#' sll_cg_getcommitteesallleg(bioguide_id = 'S000148')
#' }
sll_cg_getcommitteesallleg <- function(bioguide_id = NULL,
    key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list()) 
{
  url = "http://services.sunlightlabs.com/api/committees.allForLegislator.json"
  args <- compact(list(apikey = key, bioguide_id = bioguide_id))
  content(GET(url, query=args, callopts))
}