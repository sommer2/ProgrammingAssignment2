## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}


## This function takes a matrix as an input and creates a list
## containing functions to set the value of the  matrix, get the value of the matrix,
## set the inverse and get the inverse
makeCacheMatrix <- function(x = matrix()) { # declare function. x is an invertible matrix
    m <- NULL                               # sets default value of cached inverse
    set <- function(y) {                    # declare function to set matrix, y is an input matrix 
        x <<- y                             # set x to be in the environment of matrix y
        m <<- NULL                          # reset the cached invert of x to NULL
    }                                
    get <- function() x                     #          
    setInv <- function(solve) m <<- solve   #    
    getInv <- function() m                  # 
    list(set = set, get = get,              # 
         setInv = setInv,                   # 
         getInv = getInv)                   # 
}                                           # 
#j <- matrix(c(1,0,1,2,4,0,3,5,7),3,3)        

cacheSolve <- function(x, ...) {            # 
    m <- x$getInv()                         # attempts to retrieve a cached value
    if(!is.null(m)) {                       # if a value IS cached..
        message("Getting cached inverse")   # notify user and
        return(m)                           # stops function here, returning the cached value
    }                                       # if nothing is cached then code continues..
    data <- x$get()                         # retrieves the input matrix
    m <- solve(data, ...)                   # Applies solve function to calculate inverse
    x$setInv(m)                             # caches the inverse for future use.
    m                                       # returns the inverse as final function value
}
