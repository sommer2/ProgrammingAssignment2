## These 2 functions take advantage of the lexical scoping rules of R
## and will cache the invert of an invertible matrix in order to reduce computation time

## Function makeCacheMatrix takes input of invertible  matrix x and creates a list
## containing functions to set the value of the matrix, get the value of the matrix,
## set the inverse and get the inverse
makeCacheMatrix <- function(x = matrix()) { ## declare function. x is an invertible matrix
    cachedInv <- NULL                       ## sets default value of cached inverse to NULL
    set <- function(y) {                    ## declare function to set matrix, y is an invertible matrix 
        x <<- y                             ## set x to be in the environment of matrix y
        cachedInv <<- NULL                  ## reset the cached invert of x to NULL
    }                                
    get <- function() x                     ## declare get function, takes input of matrix x         
    setInv <- function(solve){              ## declare setInv function, solve is the invert of matrix x
        cachedInv <<- solve                 ## store the invert 
    }
    getInv <- function() cachedInv          ## retrieves the invert of x
    list(set = set, get = get,              ## return value of this function
         setInv = setInv,                   ## is a list of 4 functions
         getInv = getInv)                   ## with labels identical to the function names
}

## This function takes an input of invertible matrix x,
## attempts to retrieve its cached inverse and if none  is found,
## it will compute and cache the inverse matrix
cacheSolve <- function(x, ...) {            ## declare function cacheSolve with input matrix x
    cachedInv <- x$getInv()                 ## attempts to retrieve a cached value
    if(!is.null(cachedInv)) {               ## If a value IS cached then
        message("Getting cached inverse")   ## notify user and
        return(cachedInv)                   ## return the cached value.
    }                                       ## If nothing is cached then code continues..
    unsolvedMatrix <- x$get()               ## retrieves the input matrix
    cachedInv <- solve(unsolvedMatrix)      ## Applies solve function to calculate inverse
    x$setInv(cachedInv)                     ## caches the inverse for future use.
    cachedInv                               ## returns the inverse as the function value
}
