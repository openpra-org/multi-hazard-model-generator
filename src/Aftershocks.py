import numpy as np
from scipy.stats import norm


def mean_AF(S, T, PGAM):
    """
    Calculates the mean number of shocks Λ in a given time interval
    
    Source:  Z. Jankovsky, R. Denning, T. Aldemir, H. Sezen, and J. Hur, “APPLICATION OF DYNAMIC PROBABILISTIC RISK ASSESSMENT TO A SEISMICALLY-INDUCED INTERNAL FLOOD EVENT,” 2016.

    Parameters:
        S (float): The beginning of the time interval
        T (float): The end of the time interval
        PGAM (float or numpy array): The mainshock PGA
        
    Returns:
        float or numpy array: The mean number of shocks Λ
    """
    a = -1.67
    b = 0.91
    c = 0.05
    p = 1.08
    alpha = 2.3 

    AF_ACC = [0.25,0.5,1,2,3] # The last element is a dummy 
    

    # Ensure that PGA is a numpy array
    
    # the mean number of shocks Λ in a between Time S and T for 4 afershock bins AF_bins
    Num_AF = []
    for PGA in np.array(AF_ACC): 
        
        Num_AF.append(((10)**a) * ((PGAM/PGA)**(alpha*b))*(1/(1-p))*((T+c)**(1-p)-(S+c)**(1-p))) 
        
        
    


    geometric_means = []

    for i in range(len(AF_ACC) - 1):
        geometric_mean = np.sqrt(AF_ACC[i] * AF_ACC[i + 1])
        geometric_means.append(geometric_mean)
        
    #Freq = Num_AF
    Freq = abs(np.diff(Num_AF))
    
    return geometric_means[:-1], Freq[:-1]