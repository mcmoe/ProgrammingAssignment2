## The makeCacheMatrix() function creates an object
##  allowing to store a matrix and a cache of its inverse
## The cacheSolve() function allows using the cacheMatrix object
##  to cache inverse results, therefore optimizing by computing it once


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


## The cacheSolve function returns the inverse matrix of that wrapped by 'x'
## Its formal parameter is that created by the makeCacheMatrix() function
## If the inverse was previously calculated, it returns it immediately
## else, it calculates it using solve(), updates the cache and returns it

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv
}
