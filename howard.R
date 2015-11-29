### howard's code here #

load("/Users/howardliu/dropbox/Chinese NLP project/Data/icews_nlp.RData")
loc = read.csv("/Users/howardliu/dropbox/Chinese NLP project/codebook_location.csv")
province = as.character(loc$Province)



## extract locations (this code works): MAY anyone know how to not dropping events but still make this code work?
## for which no location noun --> regular noun
setNames(df, c(1:642))## need to give a event id

k = list()
for(i in 1:642){
   k[[i]] = df[[i]]$location
}
k
k = k[!sapply(k,is.null)]  ## but i lose track of which ones are deleted
k = lapply(k, function(x) x[!is.na(x)])
k
J = lapply(k, function(x) as.character(x)) %>%
  str_replace_all(" ","") %>%
  str_replace_all("Province","") %>%
  str_replace_all("\n",";") %>%
  strsplit(";")

locs =list()
for(i in 1:602) {
  locs[[i]] =  J[[i]][which(J[[i]] %in% province == TRUE)] %>% unique()
}
locs


## end of howard's code
