# R Codes for GNPT Distribution Study

This repository contains the R scripts used in the simulation studies on the **Gamma New Pareto-Type(GNPT)** distribution.

## 📂 Contents

- `Simulation_GNPT.R` — Code for simulating random samples from the GNPT distribution  
- `Estimation_GNPT_fixed_boundary.R` — Parameter estimation using DEoptim with fixed boundary parameter
- `Estimation_GNPT_restricted_boundary.R` — Parameter estimation using DEoptim with restricted boundary parameter

## ⚙️ Requirements

R Software: 
R Core Team (2025). _R: A Language and Environment for Statistical
  Computing_. R Foundation for Statistical Computing, Vienna, Austria.
  <https://www.R-project.org/>.


The following R packages are required:
install.packages("DEoptim")

Katharine Mullen, David Ardia, David Gil, Donald Windover, James
  Cline (2011). 'DEoptim': An R Package for Global Optimization by
  Differential Evolution. Journal of Statistical Software, 40(6), 1-26.
  doi:10.18637/jss.v040.i06.

  Ardia, D., Boudt, K., Carl, P., Mullen, K.M., Peterson, B.G. (2010).
  Differential Evolution with 'DEoptim': An Application to Non-Convex
  Portfolio Optimization. R Journal, 3(1), 27-34.
  doi:10.32614/RJ-2011-005
