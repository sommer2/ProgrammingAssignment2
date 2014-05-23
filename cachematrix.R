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
    cachedInv <- NULL                       # sets default value of cached inverse
    set <- function(y) {                    # declare function to set matrix, y is an input matrix 
        x <<- y                             # set x to be in the environment of matrix y
        cachedInv <<- NULL                  # reset the cached invert of x to NULL
    }                                
    get <- function() x                     # declare get function, takes input of matrix x         
    setInv <- function(solve){              # declare setInv function, solve is inert of matrix
        cachedInv <<- solve                 # store the invert 
    }
    getInv <- function() cachedInv          # retrieves the invert
    list(set = set, get = get,              # return value of this function
         setInv = setInv,                   # is a list of 4 functions
         getInv = getInv)                   # with labels identical to the function names
}
# example use of these funcions:
# j <- matrix(c(1,0,1,2,4,0,3,5,7),3,3)


cacheSolve <- function(x, ...) {            # declare function cacheSolve with input matrix x
    cachedInv <- x$getInv()                 # attempts to retrieve a cached value
    if(!is.null(cachedInv)) {               # If a value IS cached then
        message("Getting cached inverse")   # notify user and
        return(cachedInv)                   # return the cached value
    }                                       # if nothing is cached then code continues..
    unsolvedMatrix <- x$get()               # retrieves the input matrix
    cachedInv <- solve(unsolvedMatrix)      # Applies solve function to calculate inverse
    x$setInv(cachedInv)                     # caches the inverse for future use.
    cachedInv                               # returns the inverse as final function value
}
