## Put comments here that give an overall description of what your
## functions do

## The makeCacheMatrix function returns a wrapper matrix object.
## This wrapper allows to cache the result of the inverse
## this can be done using the setinverse() function it provides
## to get the cached result, use the getinverse() function
## the wrapper also allows reseting the wrapped matrix to another one
## if this is done, any previously cached inverse will be cleared

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
