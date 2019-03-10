## Put comments here that give an overall description of what your
## functions do

## this function invert matrix and cache it inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  
  ## creates list of methods to get/set of the original matrix and its 
  ## inverse
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}

## retrieve or compute the inverse of a matrix

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data") 
    return(m)# return the inverse if it was cached
  }
  data <- x$get()
  m <- solve(data)
  x$setsolve(m)
  m     ## Return a matrix that is the inverse of 'x'
}

amatrix <- makeCacheMatrix(matrix(1:9,3,3))
amatrix$get() 
amatrix$setsolve()
amatrix$set(matrix(1:4,2,2))
amatrix$get()
cacheSolve(amatrix)
cacheSolve(amatrix)
