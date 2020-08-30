corr <- function(directory, threshold = 0) {
  cor_results <- numeric(0)
  complete_cases <- complete(directory)
  complete_cases <- complete_cases[complete_cases$nobs>=threshold, ]
  
  if(nrow(complete_cases)>0){
    for(i in complete_cases$id){
      path <- paste(getwd(), "/", directory, "/", sprintf("%03d", i), ".csv", sep = "")
      df <- read.csv(path)
      data <- df[(!is.na(df$sulfate)), ]
      data <- data[(!is.na(data$nitrate)), ]
      sulfate_data <- data["sulfate"]
      nitrate_data <- data["nitrate"]
      cor_results <- c(cor_results, cor(sulfate_data, nitrate_data))
    }
  }
  cor_results	
}

cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
