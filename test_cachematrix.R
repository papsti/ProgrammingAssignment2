## test_cachematrix.R
## Script to test out cachematrix.R
## Profiling the functions I wrote to make sure
## caching is actually working

## Clear environment
rm(list=ls())

## Source script to load functions
source("cachematrix.R")

## Generate BIG random matrix
n <- 1000
mymatrix <- matrix(rnorm(n^2), nrow=n)

## Invert with solve and profile (should take long)
start_time_solve <- Sys.time()
solve(mymatrix)
print(paste0("Time taken w/ solve(): ", Sys.time() - start_time_solve))

## Invert using cachematrix.R and profile
x <- makeCacheMatrix(mymatrix)

## First solve (should take as long as above)
start_time_script_1 <- Sys.time()
cacheSolve(x)
print(paste0("Time taken w/ script (1st time): ",
             Sys.time() - start_time_script_1))

## Second solve (should be quick!)
start_time_script_2 <- Sys.time()
cacheSolve(x)
print(paste0("Time taken w/ script (2nd time): ",
             Sys.time() - start_time_script_2))

