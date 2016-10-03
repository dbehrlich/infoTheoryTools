
from __future__ import division
import numpy as np

def calcEntropy(x):

	h = np.zeros(len(np.unique(x)))
	for jj in range(len(np.unique(x))):

		h[jj] = - sum(x==np.unique(x)[jj])/len(x)*np.log2(sum(x==np.unique(x)[jj])/len(x))

	return h

def calcMI(x,y):
    
    numX = len(np.unique(x))
    numY = len(np.unique(y))
    
    px = np.zeros(numX)
    py = np.zeros(numY)
    pxy = np.zeros([numX,numY])
    
    mi = np.zeros([numX,numY])
    
    for ii in range(numX):
        px[ii] = np.sum(x==np.unique(x)[ii])/len(x)
    
    for jj in range(numY):
        py[jj] = np.sum(y==np.unique(y)[jj])/len(y)

    for kk in range(numX):
        for hh in range(numY):
            pxy[kk,hh] = np.sum(np.logical_and(x==np.unique(x)[kk],y==np.unique(y)[hh]))/len(x)

    for ff in range(numX):
        for gg in range(numY):
            
            mi[ff,gg] = pxy[ff,gg]*np.log2(pxy[ff,gg]/(px[ff]*py[gg]))

    return np.nansum(mi)

def calcCondEntropy(x,y):

    mi = calcMI(x,y)
    h = calcEntropy(y).sum()

    h_xy =-(mi-h)

    return h_xy


def entropyTest(n):

	p = np.arange(0,1,.01)
	sum_h = np.zeros(len(p))

	for ii in range(len(p)):
		
		x = np.random.binomial(n,p[ii],size=1000)
		h = calcEntropy(x)
		
		sum_h[ii] = sum(h)
		
		if np.mod(ii,5)==0:
			print p[ii], h, sum(h)
