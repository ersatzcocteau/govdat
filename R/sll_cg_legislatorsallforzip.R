#' Search congress people and senate members for a zip code.
#' 
#' @import httr
#' @importFrom plyr compact
#' @param zip zip code to search
#' @template cg
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' sll_cg_legislatorsallforzip(zip = 77006)
#' }
sll_cg_legislatorsallforzip <- function(zip = NULL,
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  callopts = list())
{
  url = "http://services.sunlightlabs.com/api/legislators.allForZip.json"
  args <- compact(list(apikey = key, zip = zip))
  content(GET(url, query=args, callopts))
}