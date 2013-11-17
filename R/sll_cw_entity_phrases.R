sll_cw_entity_phrases = 
function(entity,phrase=NULL,mincount=1,sort="count",state=NULL,
         party=NULL,chamber=NULL,date=NULL,start_date=NULL,end_date=NULL,
  key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")))
{
  url = paste("http://capitolwords.org/api/phrases/",entity,".json",sep="")
  page = 0
  args <- compact(list(apikey=key, phrase=phrase,page=page,state=state,party=party,chamber=chamber,date=date,start_date=start_date,end_date=end_date))

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
     args <- compact(list(apikey=key, phrase=phrase,page=page,state=state,party=party,chamber=chamber,date=date,start_date=start_date,end_date=end_date))
   }
     
  data
}
