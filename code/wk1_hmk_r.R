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
##set i to standard error of vector b
i <- se(x = b)
##create vector naming mean, sd, and se
j = c("mean" = g, "sd" = h, "se" = i)
j
##create sequence from 15 to 100
seq = c(15:100)
##calculate mean of numbers between 20 and 60
(mean(new_seq <- seq[seq>20 & seq<60]))
##sum the numbers un seq that are greater than 48
sum(newnew_seq <- seq[seq>48])
##  function that returns the min and max of seq
find_min_max <- function(u){
  ##get minimum from first value of sequence
  min <- seq[1]
  seq_rev <- sort(seq, decreasing = TRUE)
  ##get maximum from first value of reversed sequence
  max <- seq_rev[1]
  ans <- c(min, max)
  return(ans)
}
find_min_max(u = seq)