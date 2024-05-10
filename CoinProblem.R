library(markovchain)
P= matrix(c(0.5,0.5,0,0,0.5,0,0.5,0,0.5,0,0,0.5,0,0,0,1),nrow=4,byrow=TRUE)
P
X <-new("markovchain",transitionMatrix = P,states = c("0","1","2","3"),name = "Coin Problem")

print(X)
print("transientStates")
transientStates(X)
print("absorbingStates")
absorbingStates(X)
Q=X[0:3,0:3]
print(Q)
I=diag(3)
print(I)
IQ=I-Q
#Inverse of I-Q
T1 <- solve(IQ)
#The Expected number of flips needed to get 3 head in a row is the sum of the First Row of (I-Q)^-1
print(T1)
rowSums(T1)
print("The Expected number of flips = 14")
# R matrix (transient and absorbing)
#to get probability of absorbing state:
R =X[0:3,4]
R
RT <- t(R)
IQin_R = T1%*%RT
IQin_R
RT
T1
absorptionProbabilities(X)
#same result!