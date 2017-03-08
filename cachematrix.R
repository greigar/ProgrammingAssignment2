## Coursera R Programming Week 3
##
## Assignment: Caching the Inverse of a Matrix
##
## The following functions will create a special matrix object that caches the
## inverse of an *invertible* matrix.
##
## Example:
## matrix_a  <- matrix(c(4,6,3,2,5,6,7,8,1), 3, 3) # create a matrix
## matrix_b  <- makeCacheMatrix(matrix_a) # create the special matrix object
## matrix_c  <- cacheSolve(matrix_b)      # create the inverse, cache & return it
## matrix_c  <- cacheSolve(matrix_b)      # return the cached inverse


## Create a matrix and cache its inverse
## This returns a list of functions that allow the matrix data to be set and
## retrieved, the inverse to be cached and then returned.
makeCacheMatrix <- function(x = matrix()) {
        matrix_inverse <- NULL

        set <- function(y) {
            x              <<- y
            matrix_inverse <<- NULL
        }

        get <- function() x

        setmatrix_inverse <- function(inverted_matrix) {
                matrix_inverse <<- inverted_matrix
        }

        getmatrix_inverse <- function() matrix_inverse

        list(set = set,
             get = get,
             setmatrix_inverse = setmatrix_inverse,
             getmatrix_inverse = getmatrix_inverse)
}


## Return a matrix that is the inverse of 'x'
## Create and cache the matrix inverse via makeCacheMatrix() and then
## return the cached inverse
## Options can be passed to solve() via ...
cacheSolve <- function(x, ...) {

        matrix_inverse <- x$getmatrix_inverse()

        if(!is.null(matrix_inverse)) {
                message("getting cached inverted matrix")
                return(matrix_inverse)
        }

        matrix_original <- x$get()
        matrix_inverse  <- solve(matrix_original, ...)

        x$setmatrix_inverse(matrix_inverse)
        matrix_inverse
}
