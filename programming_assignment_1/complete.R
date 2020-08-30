complete <- function(directory, id = 1:332) {
  results <- data.frame(id=numeric(0), nobs=numeric(0))
  for(i in id){
    path <- paste(getwd(), "/", directory, "/", sprintf("%03d", i), ".csv", sep = "")
    df <- read.csv(path)
    data <- df[(!is.na(df$sulfate)), ]
    data <- data[(!is.na(data$nitrate)), ]
    nobs <- nrow(data)
    results <- rbind(results, data.frame(id=i, nobs=nobs))
  }
  results
}
pollutantmean("specdata", "nitrate")
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)
cc <- complete("specdata", 54)
print(cc$nobs)
RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
