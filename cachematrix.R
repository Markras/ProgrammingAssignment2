## Put comments here that give an overall description of what your
## functions do

## Well, this function does exactly what the function "makeVector" already provided by coursera,
#but instead of creating a variable of a vector with a cached mean, it creates a variaable containing a matrix with a cached inverse.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function allows you to manipulate variables created using makeCacheMatrix. It either calculates the inverse of the matrix, or if the inverse is already cached in a variable, it retrieves it.

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
