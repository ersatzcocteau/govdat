sll_cw_entity_phrases = 
function(entity,phrase=NULL,mincount=1,sort="count",
  key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")))
{
  url = paste("http://capitolwords.org/api/phrases/",entity,".json",sep="")
  page = 0
  args <- compact(list(apikey=key, phrase=phrase,page=page))

  data = NULL

  while(TRUE){
                       
     tt <- content(GET(url, query=args))$results
     if(length(tt) == 0) break()

     datat <- do.call(rbind.fill, lapply(tt, function(x) data.frame(x)))
     if(is.null(data)){
        data = datat
     }
     else{
        data = rbind(data,datat)
     }
     page = page + 1
     args <- compact(list(apikey=key, phrase=phrase,page=page))
   }
     
  data
}
