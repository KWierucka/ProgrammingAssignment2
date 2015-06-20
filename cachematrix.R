## The 2 main functions cache the inverse of a matrix

## makeCacheMatrix - creates a special matrix object that can cache its inverse
    ## set - changes the vector stored in the main function, resets s to a null value
    ## get - prints x
    ## setinverse - store the inverse
    ## getinverse - prints s

makeCacheMatrix <- function(x = matrix()) {
    s<- NULL
    set<- function(y) {
        x<<- y
        s<<- NULL
    }
    get <- function () x
    setinverse <- function(solve) s<<- solve
    getinverse <- function() s
    
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## cacheSolve - computes the inverse of the matrix returned by makeCacheMatrix.
## If it has been calculated, then it will retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
    s <- x$getinverse()
    if(!is.null(s)) {
        message ("getting cached data")
        return(s)
    }
    data<- x$get()
    s<- solve(data, ...)
    x$setinverse(s)
    s
}
