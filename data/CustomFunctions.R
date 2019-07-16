ImputeNAWithMean = function(dataset){
  
  for(i in 1:ncol(dataset)){
    is_na = is.na(dataset[,1])
    if(any(is_na)){
      na_ids = which(is_na)
      #mean
      var_mean = mean(dataset[,i], na.rm = T)
      dataset[na_ids,i] = var_mean
      message = paste0("replacing NA with mean:", colnames(dataset)[i])
      print(message)
    }
  }
  return(dataset)
}