# For true parameter values alpha, beta, a and b
comb <- c(alpha, beta, a, b)

# Sample size n
n <- 100

# Define the inverse of the lower incomplete gamma function
invlowgamma <- function(s, y) {
cumulative_prob <- y / gamma(s)
x <- qgamma(cumulative_prob, shape = s, rate = 1)
return(x)
}

# Define the quantile function as a function of parameters and uniform(0,1) random variable
Quantile<- function(params,u){
paramal<- params[1]
parambe<- params[2]
parama<- params[3]
paramb<- params[4]

Q<-(paramb*(2*exp(parambe*invlowgamma(paramal,(u*gamma(paramal))))-1)^(1/parama))
}

# Simulation using uniform (0,1)
uni <- runif(n, 0, 1)
samples <- sapply(uni, function(u) Quantile(comb, u))

samples