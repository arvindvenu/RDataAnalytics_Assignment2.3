#initialize a matrix with normally distributed random numbers
rand_mat <- replicate(10,rnorm(10))

#vectorized operation begins

#record start time for vectorized operation
vectorized_start <- Sys.time()

#calculate the vectorized matrix of sines
vectorized_sin_mat <- sin(rand_vec)

#record end time for vectorized operation
vectorized_end <- Sys.time()


#non vectorized operation begins

#convert rand_mat to a data frame
rand_data_frame <- as.data.frame(rand_mat)

#record start time for non vectorized operation
non_vectorized_start <- Sys.time()

#initialize a matrix of 10 x 10
non_vectorized_sin_mat <- matrix(nrow = 10, ncol = 10)
j <- 1

# iterate throught the columns in the data frame
for(column in rand_data_frame) {
  col <- vector(mode = "numeric", length = length(column))
  
  #iterate through the rows in each column
  for(i in 1:length(column)) {
    non_vectorized_sin_mat[i,j] = sin(column[i])
  }
  j <- j + 1
}

#record end time for non vectorized operation
non_vectorized_end <- Sys.time()

#print the vectorized time difference
print(paste("Vectorized time difference is:", vectorized_end - vectorized_start))

#print the non vectorized time difference
print(paste("Non vectorized time difference is:", non_vectorized_end - non_vectorized_start))
