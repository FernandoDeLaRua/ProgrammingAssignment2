## The program is quite similar to the one in the example, but for 
## caching an inverse matrix

## This function stores a matrix and (if asked) its inverse

makeCacheMatrix <- function(x = matrix()) {
    inversa <- NULL
    set_matriz <- function(y){
        x <<- y
        m <<- NULL
    }
    get_matriz <- function() x
    set_inversa <- function(solve) inversa <<- solve
    get_inversa <- function() inversa
    list(set_matriz = set_matriz,
         get_matriz = get_matriz,
         set_inversa = set_inversa,
         get_inversa = get_inversa)
}


## and this one caches the inverse matrix (if absent) into an object
## created by the previous function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inversa <- x$get_inversa()
    if(!is.null(inversa)){
        message("gettin' dat cached data")
        return(inversa)
    }
    data <- x$get_matriz()
    inversa <- solve(data,...)
    x$set_inversa(inversa)
    inversa
}

## to test them you can run:
## a <- matrix (c(2,3,3,2), nrow=2)
## f <- makeCacheMatrix(a)
## to create an object f containing matrix a and by running:
## cacheSolve(f)
## a first time the inverse matrix is cached in f$get_inversa(). Subsequent
## uses return the cached value.
