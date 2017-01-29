# modeling when y and x are covariates
model{
  for(i in 1:I){ # species
    for(j in 1:J){ # individuals
      yy[i,j] ~ dnorm(mm[i,j],vv[i])
      mm[i,j] = BB[i,1]+BB[i,2]*xx[i,j]
      }
    BB[i,1:2] ~ dmnorm(MM,EE[,])
    vv[i] ~ dgamma(aa,bb)
    }  
  MM[1:2] = c(mu0,mu1) # mean for betas
  EE = inverse(invE)
  
  # Priors
  mu0 ~ dnorm(0,mu0.prec)
  mu1 ~ dnorm(0,mu1.prec)
  invE[1:2,1:2] ~ dwish(Sinv[,],df) # df>=(p-1), being p the size of a square matrix (p = 2 in this case)
  VV[1,1] = p.sigma00
  VV[1,2] = p.sigma01
  VV[2,1] = p.sigma01
  VV[2,2] = p.sigma11
  Sinv = inverse(VV)/df
  
  }

# data
#list(xx=?,yy=?,df=4,p.sigma00=?,p.sigma01=?,p.sigma01=?,p.sigma11=?,mu0.prec=?,mu1.prec=?,I=?,J=?,aa=4,bb=?)





