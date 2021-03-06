#' Get list of all committees for a given chamber along with their subcommittees.
#' 
#' @import httr
#' @importFrom plyr compact
#' @param chamber House, Senate, or Joint
#' @template cg
#' @return List of all committees in the specified chamber with their
#'    subcommittees (but not memberships due to size of response).
#' @export
#' @examples \dontrun{
#' sll_cg_getcommitteeslist(chamber = 'Joint')
#' }
sll_cg_getcommitteeslist <- function(chamber = NULL,
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  callopts = list())
{
  url = "http://services.sunlightlabs.com/api/committees.getList.json"
  args <- compact(list(apikey = key, chamber = chamber))
  content(GET(url, query=args, callopts))
}