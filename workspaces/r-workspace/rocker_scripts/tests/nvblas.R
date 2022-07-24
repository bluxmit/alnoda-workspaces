install.packages("callr")


callr::r(function(){
  system.time({
  N <- 2^14
  M <- matrix(rnorm(N*N), nrow=N, ncol=N)
  M %*% M
  })
  }, env = c(LD_PRELOAD="libnvblas.so")
)
