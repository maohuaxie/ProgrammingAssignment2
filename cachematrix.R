## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## Below are a pair of functions that are used to create a special object that 
## stores a matrix and caches its inverse.
## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  ## Initialize the inverse property
  inv <- NULL
  ## Set the matrix
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  ## Get the matrix
  get <- function(){
    ## Return the matrix
    x
  }
  ## Set the inverse of the matrix
  setInverse <- function(inverse) {
    inv <<- inverse
  }
  ## Get the inverse of the matrix
  getInverse <- function() {
    ## Return the inverse property
    inv
  }
  ## Return a list of the methods
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## Write a short comment describing this function

## This function calculates the inverse of the special "matrix" created by 
## makeCacheMatrix funcion. If the inverse has already been calculated (and the 
## matrix has not changed), then it should retrieve the inverse from the cache via the 'setinverse' fuction.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}

