sll_cw_phrases =
function(entity_type=NULL,entity_value=NULL,n=1,sort="count",
  key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")))
{
  splitt<-function(x) paste(str_sub(x, 1, 4), "-", str_sub(x, 5, 6), sep="")
  url = "http://capitolwords.org/api/phrases.json"
  page = 0
  args <- compact(list(apikey=key, entity_type=entity_type,entity_value=entity_value,n=n,page=page))

  data = NULL

  while(TRUE){
                       
     tt <- content(GET(url, query=args))
     if(length(tt) == 0) break()

     datat <- do.call(rbind.fill, lapply(tt, function(x) data.frame(x)))
     if(is.null(data)){
        data = datat
     }
     else{
        data = rbind(data,datat)
     }
     page = page + 1
     args <- compact(list(apikey=key, entity_type=entity_type,entity_value=entity_value,n=n,page=page))
   }
     
  data
}
