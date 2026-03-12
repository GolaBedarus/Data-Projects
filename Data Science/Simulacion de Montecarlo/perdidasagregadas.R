# Frecuencia: N = # de siniestros al dia - Poisson(lambda = 3)
# Severidad: X = perdidas por siniestro - Paretto_II(alpha = 3, theta = 3500)
# Pérdidas agregadas: S = suma de todas las perdidas en todos los siniestros
# Muestra 365 dias:

N <- rpois(n = 365, lambda = 3)
N

## Pareto (tipo II): 

rpareto <- function(p, alpha, theta){
  
  pareto <- theta*((1/(1-p))^(1/alpha)-1)
  
  return(pareto)
  
}

rpareto(runif(1), alpha = 3, theta = 3500)

X <- matrix(nrow = 365, ncol = max(N))
dim(X)

for(i in 1:365){
  if(N[i] == 0){
    X[i,] <- rep(NA, max(N))
  } else {
    X[i,] <- c(rpareto(runif(N[i]), alpha = 3, theta = 3500), rep(NA, max(N) - N[i]))
  }
}

X[1:6,]
N

S <- rowSums(X, na.rm = TRUE)
S

hist(S)
mean(S)
max(S)
median(S)

# Simulaciones: 

sim <- 10000

N <- S <- matrix(nrow = 365, ncol = sim)
X <- list()

for(k in 1:sim){
  N[,k] <- rpois(n = 365, lambda = 3)
  X[[k]] <- matrix(nrow = 365, ncol = max(N[,k]))
  
  for(i in 1:365){
    if(N[i,k] == 0){
      X[[k]][i,] <- rep(NA, max(N[,k]))
    } else {
      X[[k]][i,] <- c(rpareto(runif(N[i,k]), alpha = 3, theta = 3500),
                              rep(NA, max(N[,k]) - N[i,k]))
    }
  }
  
  S[,k] <- rowSums(X[[k]], na.rm = TRUE)
}

dim(S)

medias <- apply(S, 2, mean)
hist(medias)
