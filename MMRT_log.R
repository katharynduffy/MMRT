MMRT_log <- function (H0,S0,Cp,Tem){
  # Inputs
  # H0  - The standard enthalpy, J mol-1
  # S0  - The standard entropy,J mol-1 K-1
  # Cp  - Heat capacity, J mol-1 K-1
  # Tem - Temperature in Kelvin, K
  
  # define the constants
  T0  <- 298.15 # reference temperature at Kelvin
  R   <- 8.314  # gas constant,J mol-1 K-1
  kB  <- 1.38064852E-23  #Boltzmann constant,J K-1
  h   <- 6.62607004E-34  #Planck's constant,J s
  # 
  A   <- kB / h
  dH  <- H0 + Cp * (Tem-T0)# change in enthalpy
  dS  <- S0 + Cp * log(Tem/T0)#change in entropy
  RT  <- R * Tem
  # calculate the lnR,Topt and Tinf
  lnR  <- log(A * Tem) - dH/RT + dS/R
  # if Cp is negative, calculate the Topt and Tinf
  if (Cp < 0){
    Topt <- (H0-Cp*T0)/(-Cp-R)-273.15 #in Celsius
    Tinf <- (H0-Cp*T0)/(-Cp+sqrt(-Cp*R))-273.15}
  else {
    Topt <- NA
    Topt <- NA}
  #output the rate, Topt and Tinf
  output <- list("rate" = lnR, "Topt" = Topt, "Tinf" = Tinf)
  return(output)
}
