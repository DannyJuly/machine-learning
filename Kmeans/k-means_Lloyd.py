import numpy as np
import matplotlib.pyplot as plt
from __future__ import division

def disEclud(a,b):
    return np.sqrt(sum(np.power(a-b,2)))  #the distance between two data point

def randCent(data,k):             #get k random centroids
    n = np.shape(data)[1]
    centroids = np.zeros((k,n))
    for i in range(n):
        mini = min(data[:,i])
        maxi = max(data[:,i])
        range_i = float(maxi-mini)
        centroids[:,i] = mini + range_i * np.random.rand(1,k)
    return centroids

def kMeans(data, k):   #k is the number of cluster we want
    m = np.shape(data)[0]
    clusterinfo = np.zeros((m,2)) #store the distance and labels of every data
    centroids = randCent(data,k)
    flag = True 
    while flag:
        flag = False;
        for i in range(m):
            mindist = np.inf
            minindex = -1
            for j in range(k):
                dis_j = disEclud(centroids[j],data[i])
                if mindist > dis_j:                   #find the nearest centroid
                    mindist = dis_j
                    minindex = j
                    #print(j)
            if clusterinfo[i,0] != minindex:
                flag = True
            clusterinfo[i] = minindex,mindist            #store the distance and labels of every data
        for center in range(k):   #calculate the new centroids again
            clusterdata = data[np.where(clusterinfo[:,0]==center)]
            centroids[center] = np.mean(clusterdata,axis = 0)
    return centroids, clusterinfo                       #return the final centroids and cluster information
