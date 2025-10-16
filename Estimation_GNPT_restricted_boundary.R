# Load the required library
library(DEoptim)

# Define the negative of the log-likelihood function to be minimised, passing the parameters in log scale
# Function to calculate log(exp(logx) + exp(logy)) in numerically stable way: stable log-sum-exp for two logs
log_sum_exp2 <- function(logx, logy) {
  m <- pmax(logx, logy)
  m + log(exp(logx - m) + exp(logy - m))
}

neglog_likelihood <- function(log_params, x) {
alpha <- exp(log_params[1])
beta <- exp(log_params[2])
a <- exp(log_params[3])
b <- exp(log_params[4])

if (any(x <= b)) return(10e5)
  
n <- length(x) 
log_xa <- a * log(x)
log_ba <- a * log(b)
log_xa_plus_ba <- log_sum_exp2(log_xa, log_ba)
log_ratio <- log_xa_plus_ba - (log(2) + log_ba)

term1 <- n * log(a)
term2 <- (a - 1) * sum(log(x))
term3 <- - n * lgamma(alpha)
term4 <- - n * alpha * log(beta)
term5 <- - sum(log_xa_plus_ba)
term6 <- (alpha - 1) * sum(log(log_ratio))
term7 <- (1 / beta) * sum(-log_ratio)
  
  loglik <- term1 + term2 + term3 + term4 + term5 + term6 + term7
  return(-loglik)
}

# input the samples
samples<- samples

# Fix the upper bound a, b and c for the parameters alpha, beta and a respectively. The bounds for the parameter b is restricted to (0,minimum sample value) and 1e-5 is some small positive epsilon for stability
DEresult <- DEoptim(
fn = function(params) neglog_likelihood(params, x = samples),
lower = rep(log(1e-5), 4),
upper = c(log(a),log(b),log(c), log(min(samples)-(1e-5)) ),
control = DEoptim.control(
itermax = 1000,
trace = FALSE)
)

estimates <- exp(DEresult$optim$bestmem)

estimates