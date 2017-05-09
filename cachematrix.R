## This project implements custom functions to compute matrix inverse with caching feature


## makeCacheMatrix creates a specific list object to be used in cojunction with 
## cacheSolve function to compute cached matrix inverse

makeCacheMatrix <- function(x = matrix()) {
    
  inv <- NULL
  set <- function(y){
    inv <<- NULL
    x <<- y
  }
  get <- function() x
  setinv <- function(i) inv <<- i
  getinv <- function() inv
  list(set = set, get = get, setinv = setinv, getinv = getinv)

}


## cacheSolve functin computes matrix inverse and caches result for next runs

cacheSolve <- function(x, ...) {
  inv <- x$getinv()
  if (!is.null(inv)){
    message("geting cached data")
    return(inv)
  }
  
  inv <- solve(x$get(), ...)
  x$setinv(inv)
  inv
}
