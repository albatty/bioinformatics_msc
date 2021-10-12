##100 random numbers between 0 and 50
x <- runif(100, 0, 50)
sort(x)
##sort x from largest to smallest
sort(x, decreasing=TRUE)
##make a log of vector x 
a <- log(x)
##take vector logx from vector x
x - a
## save x - a as b
b <- x - a
g <- mean(b)
h <- sd(b)
##create function titled se to calculate standard error
se <- function(x){
  std_er <- sd(x)/sqrt(length(x))
  return(std_er)
}
