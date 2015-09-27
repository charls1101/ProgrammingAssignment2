## The following functions work together to create a square invertible matrix
## and make the inverse of the matrix available in the cache environment

a<-makeCacheMatrix()             create functions
a$aset(matrix(1:4,2,2))          create matrix in working environment
cacheSolve(a)                    1st run returns inverted matrix
                                 from working environment
[,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5

cacheSolve(a)                   2nd and subsequent runs
                                returns inverted matrix from cache
getting cached data

[,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5

## makeCacheMatrix creates and returns a list functions

makeCacheMatrix <- function(x = matrix()) {
cache<-NULL

set<-fuction(y){
x<<-y
cache<<-NULL
}

#get the value of the matrix
get<-function() x
#inverted the matrix and store in cache
setMatrix<-Function(inverse) cache <<-inverse
#get the inverted matrix from cache
getInverse<-function() cache

#return the created functions to the working environment
list(set=set,get=get,
setMatrix=setMatrix,
getInverse=getInverse)
}

## cacheSolve calculates the inverse of the matrix created in makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        cache<-x$getInverse()
        
        if(!is.null(cache)){
        message("getting cached data")
        
        return(cache)
}
