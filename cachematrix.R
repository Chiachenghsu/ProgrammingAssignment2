## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL ## 定義變量i，紀錄matrix inverse的值
    set <- function(y) { ## 定義set function，指定一個新的matrix
        x <<- y
        i <<- NULL ## 重新設定變量i為NULL(空值)
    }
    get <- function() x
    setinverse <- function(inverse) i <<- inverse ## 定義setinverse function，
    ## 用來指定i值，賦值計算值為變數i 而不再是NULL
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i   
     ## Return a matrix that is the inverse of 'x'
}
