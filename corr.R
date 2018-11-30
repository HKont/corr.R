corr <- function(directory, threshold = 1) {
    
    filelist <- list.files(path = directory, full.names = TRUE)
    allnobs <- complete(directory)
    allnobs <- allnobs[allnobs$nobs >= threshold,]
    
    poll.correlation <- numeric() 
    x <- 1
    
    for (i in allnobs$id) {
        alldata <- read.csv(filelist[i])
        poll.correlation[x] <- cor(alldata$sulfate, alldata$nitrate, use = "complete.obs")
        x <- (x+1)
    }
    poll.correlation
}
