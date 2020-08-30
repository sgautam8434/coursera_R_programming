pollutantmean<-function(directory, pollutant,id=1:332){
  means <- c()
  print(getwd())
  for(i in id){
    path <- paste(getwd(), "/", directory, "/", sprintf("%03d", i), ".csv", sep = "")
    df <- read.csv(path)
    data <- df[pollutant]
    means <- c(means, data[!is.na(data)])
  }
  
  mean(means)
}
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 34)
