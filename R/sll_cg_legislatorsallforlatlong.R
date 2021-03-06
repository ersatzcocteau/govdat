#' Search congress people and senate members for a latitude/longitude.
#' 
#' @import httr
#' @importFrom plyr compact
#' @template cg
#' @param latitude latitude of coordinate
#' @param longitude longitude of coordinate
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' sll_cg_legislatorsallForLatLong(latitude = 35.778788, longitude = -78.787805)
#' }
sll_cg_legislatorsallForLatLong <- function(latitude = NULL, longitude = NULL,
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  callopts = list())
{
  url = "http://services.sunlightlabs.com/api/legislators.allForLatLong.json"
  args <- compact(list(apikey = key, latitude=latitude, longitude=longitude))
  content(GET(url, query=args, callopts))
}