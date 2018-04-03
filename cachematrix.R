## makeCashMatrix creates a speicial "matrix" object that can cache its verse.
## The function below is to set the matrix and the inverse value.

makeCacheMatrix <- function(x = matrix()) {
        m<null
        set<function(y){                                   ## Initiate the function to create new matrix
                x <<- y
                m<<- NULL
        }
        get <- function() x                                 ## Return the matrix
        setinverse <- function(inverse) m <<- inverse      ## set the inverse value of the matrix
        getinverse <- function() m                         ## get value of the inverse matrix
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)      
}

## cashSolve computes the inverse of the special "matrix" returned by makeCacheMatrix above.


cacheSolve <- function(x, ...) {
                                                                 ## Return a matrix that is the inverse of 'x'
        m<- x$getinverse()                                      
        if(!is.null(m)){
                 message("getting cached data")
                 return(m)
}
        data<- x$get()                                          ## Initiate the function to get the matrix
        m<- Solve(data,...)                                     ## Get the inverse using the function
        x$setinverse(m)
        m                                                       ## Return the matrix
}               
