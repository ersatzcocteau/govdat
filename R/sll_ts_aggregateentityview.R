#' Look up the entity ID based on an ID from a different data set. Currently 
#'    they provide a mapping from the ID schemes used by Center for Reponsive 
#'    Politics (CRP) and the National Institute for Money in State Politics (NIMSP).
#'    
#' @import httr
#' @importFrom plyr compact
#' @template cg
#' @param id The ID of the entity in the given namespace.
#' @param cycle Return contribution totals for the given cycle. When not given, 
#'    returns totals for all cycles.
#' @return a JSON object listing the TransparencyData IDs matching the 
#'    given external ID.
#' @export
#' @examples \dontrun{
#' sll_ts_aggregateentityview(id = '85ab2e74589a414495d18cc7a9233981')
#' }
sll_ts_aggregateentityview <- function(id = NULL, cycle = NULL,
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  callopts = list())
{
  if(is.null(id))
    stop("id must specify an entity id")
  url = "http://transparencydata.com/api/1.0/entities/"
  url2 <- paste(url, id, '.json', sep='')
  args <- list(apikey = key, cycle = cycle)
  content(GET(url2, query=args, callopts))
}
# http://transparencydata.com/api/1.0/entities/ff96aa62d48f48e5a1e284efe74a0ba8.json?apikey=<your-key>