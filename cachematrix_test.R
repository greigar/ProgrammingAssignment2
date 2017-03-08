source("cachematrix.R")

matrix_a  <- matrix(c(4,6,3,2,5,6,7,8,1), 3, 3) # create a matrix

matrix_b  <- makeCacheMatrix(matrix_a)  # create the special matrix object
matrix_c  <- cacheSolve(matrix_b)       # create the inverse, cache & return it

message("Result of invert")
print(matrix_c)

result <- all.equal(solve(matrix_c), matrix_a)    # check that the inverse is correct
message("Result of matrix equality: ", result)

message("Expect to retrieve cached version")
matrix_c  <- cacheSolve(matrix_b)       # return the cached inverse

