## cachematrix.R
## Define functions to:
## 1. create a special matrix object capable of caching its inverse
## 2. either retrieve the inverse from the cache or 
## calculate it if it's uncached

## Function to both get and set the value of a matrix,
## as well as cache or retreive the matrix's inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
    ## set the inverse to NULL at first
  ## Define a function to set the value of the matrix
  set <- function(y) {
    x <<- y ## cache x
    inv <<- NULL ## cache the inverse
  }
  ## Define a function to retreive the value of the matrix
  get <- function() x
  ## Define a function to cache the inverse of the matrix
  setinv <- function(inverse) inv <<- inverse 
  ## Define a function to retreive the value of the inverse
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## Function to calculate the inverse of a matrix, unless it is
## found in the cache, in which case, it returns the cached
## inverse instead

cacheSolve <- function(x, ...) {
  ## x: (matrix) the matrix we wish to invert

  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  ## If the "inverse" retreived is not NULL, return the cached
  ## inverse
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  ## Otherwise, calculate the inverse and cache it
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv
}
