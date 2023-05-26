import numpy as np
import matplotlib.pyplot as plt 
import pandas as pd
import random 
from scipy.stats import norm


#from Aftershocks import mean_AF

def AF_MS_FW(dataframe,df_flood,t_bins): # This function takes a Pandas DataFrame as an input 
    
    

    MS_ACC = [0.173,0.387,0.612,0.866,1.23,2,3.5,5]
    AF_bins = [1,2,3]
    MS_bins = list(range(1, len(MS_ACC)+1))
    

    

    
      ## -------------- Damage Accumulation -----------------
     
    MS_accum = [1,0.95,0.8,0.55,0.25,0.1,0.05,0.01]
    #MS_accum = [1,1,1,1,1,1,1]
    AF_accum = [0.95,0.70,0.1]
    #AF_accum = [1,1,1]
    ##------------ Dictionaries-------------------- 
    
    
    
    Model_name= "G-PWR"
    # Dictionaries for FTs, Gates and Basic Events 
    
    # Aftershock Dictionaries
    
    AF_Fault_Trees ={} # Aftershock Fault Trees
    
    AF_Gates ={}  # Aftershock Gates
    AF_Basic ={}  # Aftershock Basic Events
    T_Basic ={}   # Time House Events
    
    # Mainshock/Aftershock Gates and FTs 
    
    MS_AF_Gates= {} # Gates under AFTERSHOCKS COMMING AFTER MAINSHOCK BIN n FT
    
    
    # ----------- Exclusive Mainshock FTs and BEs--------
    MS_Gates = {}
    MS_HE= {}   # Mainshock  House Events
    
    
    # -----------MAR-D Files for seismic failure------------------ 
    # ---------- FAULT TREE FILES-----------------
    FTL = open("AF.FTL", "w") # .FTL file for fault tree logic
    GTD =open("AF.GTD", "w") # .GTD file for Gates Description 
    FTD =open("AF.FTD", "w") # .FTD file for fault tree Description 
    
    #------------------BASIC EVENT FILES----------
    
    BED = open("AF.BED", "w")
    BEI = open("AF.BEI","w")
    BEC= open("AF.BEC","w")
    MARD = open("AF.MARD","w")
    MARD.write(".\AF.FTD\n")
    
    MARD.write(".\AF.FTL\n")
    MARD.write(".\AF.GTD\n")
    MARD.write(".\AF.BED\n")
    MARD.write(".\AF.BEI\n")
    MARD.write(".\AF.BEC\n")
    
    
    
    ##----------------------------------------------------## 
    
    GTD.write("G-PWR=\n")
    GTD.write("*  Name                 , Description,        Project\n")
    
    FTD.write("G-PWR=\n")
    FTD.write("*  Name                 , Description,   SubTree,  Alternative,  Project\n")
    
    BED.write("G-PWR=\n")
    BED.write("*  Name                 , Description,          Project\n")
    
    BEI.write("*Saphire 8.2.6\n") 
    BEI.write("G-PWR        = \n" ) 
    BEI.write("* Name                                          ,FdT,UdC                     ,UdT, UdValue,   Prob,       Lambda,     Tau,        Mission, Init,PF, UdValue2,   Calc. Prob, Freq, Analysis Type        , Phase Type              , Project\n")
    
    
    BEC.write("*Saphire 8.2.6\n")
    BEC.write("G-PWR  = \n")
    BEC.write("* Name  , tTypeName, COM, DLL Name, Proc Name, ModelType, PhaseType, Project\n")
    BEC.write("* consts, params, ...\n")
    BEC.write("* ^EOS\n") 
    
    
    
    
    
    for index, row in dataframe.iterrows():
        
        com_name=row['Description']  # Component Description
        com_abb = row['Plant Mark Number']   # Component identifier
        
        [Am,Br,Bu]= row ['Updated Am'], row['Updated Br'], row['Updated Bu'] # fragility parameters
        
     
                    

                    
                    
                    
                    
                    
                 
            
            
        
        for MS_bin in MS_bins:
            
            
            
            
            
            
            for t in range(1,t_bins+1):
                
                Am_dmg= float(Am)*MS_accum[MS_bin-1]  # Damage due to Mainshock 
                
                if MS_bin ==1:
                    T_Basic[f"HE-T-{t}"] = [f"TIME BIN {t} OCCURS","F"] 
                    
                    BEI.write(f"HE-T-{t}, F, 0.000E+000 ,  , 0.000E+000, 0.000E+000, 0.000E+000, 0.000E+000, 0.000E+000,  ,  , 0.000E+000, 0.000E+000, Y, RANDOM, CD , G-PWR \n")

                    #BED.write(f"HE-T-{t}, TIME BIN {t} OCCURS,  G-PWR\n")
                ## - ------------ LEVEL 3 Gates: Aftershock Fault Trees  -------------------
                
                # Aftershock Fault Tree is defined at a certain mainshock Bin and Time Bin 
                
                # AF_Fault_Trees is a dictionary where the key is the Name of the FT and the value is its Description and the logic
                
                AF_Fault_Trees[f"{com_abb}-MS-{MS_bin}-T-{t}-FT"] = [f'AFTERSHOCKS AFTER MAINSHOCK BIN {MS_bin} IN TIME BIN {t}','OR']
                            
                # Aftershock Fault Tree Logic 
                            
                FTL.write(f"{Model_name}, {com_abb}-MS-{MS_bin}-T-{t}-FT = \n")
                FTL.write(f"{com_abb}-MS-{MS_bin}-T-{t}-FT          OR ")   
                
                
                
                

                time_int = np.linspace(0, 24, num=t_bins+1)  # [0,4,8,12,....]  (hr)
                    
                FRQ_AF=mean_AF(time_int[t-1],time_int[t],MS_ACC[MS_bin-1])[1] # This should give the frequcny of every AF BE
               
                
                ACC_AF_arr =mean_AF(time_int[t-1],time_int[t],MS_ACC[MS_bin-1])[0]  # the geometric means of the AFs 
                
                #print(time_bins[t],ACC_AF_arr,FRQ_AF)
                
                
                
                
                # Aftershock Gates and Basic Events
                for AF_bin in AF_bins:
                    
                    AF_Gates[f"{com_abb}-MS-{MS_bin}-T-{t}-AF-{AF_bin}-FT"] =[f'AFTERSHOCKS BIN {AF_bin} IN TIME BIN {t} AFTER MAINSHOCK BIN {MS_bin}','AND']

                    # This is a compound Event--------
                    
                    AF_Basic[f"{com_abb}-MS-{MS_bin}-T-{t}-AF-{AF_bin}-BE"] =[f'{com_name} FAILURE DUE TO AFTERSHOCK BIN {AF_bin} (TIME BIN {t})',"BE",]
                    
                    # Frequency Event and AF failure Event
                    BED.write(f"{com_abb}-MS-{MS_bin}-T-{t}-AF-{AF_bin}-FQ,FQ-{com_name} FAILURE DUE TO AFTERSHOCK BIN {AF_bin} (TIME BIN {t}),  G-PWR\n") 
                    BED.write(f"{com_abb}-MS-{MS_bin}-T-{t}-AF-{AF_bin}-FA,FA OF {com_name} FAILURE DUE TO AFTERSHOCK BIN {AF_bin} (TIME BIN {t}),  G-PWR\n")
                    
                    #--------- Linking the Frequency Event and AF failure Event to the compound event ------
                    BEC.write(f"{com_abb}-MS-{MS_bin}-T-{t}-AF-{AF_bin}-BE,   0, COM, PLUGUTIL, MULTIPLY , RANDOM    , CD,G-PWR \n")
                    BEC.write(f"{com_abb}-MS-{MS_bin}-T-{t}-AF-{AF_bin}-FA  ,  {com_abb}-MS-{MS_bin}-T-{t}-AF-{AF_bin}-FQ  \n")
                    BEC.write("^EOS\n")
                    
                    
                    ##--------- Aftershock Damage---------
                     
                    if t != 1: 
                        
                        
                        FRQ_AF_prev=mean_AF(time_int[t-1],time_int[t],MS_ACC[MS_bin-1])[1]
                        
                        
                        Am_dmg = float(Am_dmg)*(FRQ_AF_prev[0]*AF_accum[0]+ FRQ_AF_prev[1]*AF_accum[1]+ FRQ_AF_prev[2]*AF_accum[2])
                        
                        
                        #Am_dmg = sum(Am_dmg*np.multiply(FRQ_AF_prev,AF_accum))
                        
                        
                        
                    
                    #------------------ BEI Lines of Frequency Event and AF failure Event---------- 
                    
                        fpA = norm.cdf((np.log(float(ACC_AF_arr[AF_bin-1]))/float(Am))/np.sqrt(float(Bu)**2+float(Br)**2))

                        BEI.write(f"{com_abb}-MS-{MS_bin}-T-{t}-AF-{AF_bin}-FA, J, , S,{str(Br)}, {str(Am_dmg)},{str(ACC_AF_arr[AF_bin-1])},0.00E+00, 0.00E+00, , , {str(Bu)} , {str(fpA)} , , RANDOM, CD, G-PWR \n")
                        BEI.write(f"{com_abb}-MS-{MS_bin}-T-{t}-AF-{AF_bin}-FQ ,V , , , 0.000E+000, {str(FRQ_AF[AF_bin-1])}, 0.000E+000, 0.000E+000, 0.000E+000,  ,  , 0.000E+000, {str(FRQ_AF[AF_bin-1])}, , RANDOM, CD, G-PWR\n")
                        ##------- BEI line of aF compund Event----------- 
                        BEI.write(f"{com_abb}-MS-{MS_bin}-T-{t}-AF-{AF_bin}-BE, C,  ,  , 0.000E+000,{str(fpA*FRQ_AF[AF_bin-1])}, 0.000E+000, 0.000E+000, 0.000E+000,  ,  , 0.000E+000, {str(fpA*FRQ_AF[AF_bin-1])}, , RANDOM , CD\n")
                        
                    else:
                        
                        Am_dmg= float(Am)*MS_accum[MS_bin-1]
                        
                        fpA = norm.cdf((np.log(float(ACC_AF_arr[AF_bin-1]))/float(Am))/np.sqrt(float(Bu)**2+float(Br)**2))

                        BEI.write(f"{com_abb}-MS-{MS_bin}-T-{t}-AF-{AF_bin}-FA, J, , S,{str(Br)}, {str(Am_dmg)},{str(ACC_AF_arr[AF_bin-1])},0.00E+00, 0.00E+00, , , {str(Bu)} , {str(fpA)} , , RANDOM, CD, G-PWR \n")
                        BEI.write(f"{com_abb}-MS-{MS_bin}-T-{t}-AF-{AF_bin}-FQ ,V , , , 0.000E+000, {str(FRQ_AF[AF_bin-1])}, 0.000E+000, 0.000E+000, 0.000E+000,  ,  , 0.000E+000, {str(FRQ_AF[AF_bin-1])}, , RANDOM, CD, G-PWR\n")
                        ##------- BEI line of aF compund Event----------- 
                        BEI.write(f"{com_abb}-MS-{MS_bin}-T-{t}-AF-{AF_bin}-BE, C,  ,  , 0.000E+000,{str(fpA*FRQ_AF[AF_bin-1])}, 0.000E+000, 0.000E+000, 0.000E+000,  ,  , 0.000E+000, {str(fpA*FRQ_AF[AF_bin-1])}, , RANDOM , CD\n")
                        
                        
                   
                    
                    
                    
                    FTL.write(f"  {com_abb}-MS-{MS_bin}-T-{t}-AF-{AF_bin}-FT   ") 
                    
                    
                FTL.write("\n")
                              
                for AF_bin in AF_bins:              
                    FTL.write(f"{com_abb}-MS-{MS_bin}-T-{t}-AF-{AF_bin}-FT       AND {com_abb}-MS-{MS_bin}-T-{t}-AF-{AF_bin}-BE \n")
                
                FTL.write("^EOS\n")
                
                # %%----- Level 2 Gates : The AFs coming after a certain MS bin
                
            MS_AF_Gates[f"{com_abb}-MS-{MS_bin}-AF-FT"] = [f"AFTERSHOCKS COMING AFTER MAINSHOCK BIN {MS_bin}","AND"]  # Top Gate
            FTD.write(f"{com_abb}-MS-{MS_bin}-AF-FT , AFTERSHOCKS COMING AFTER MAINSHOCK BIN {MS_bin}, S , , G-PWR\n")
            MS_AF_Gates[f"{com_abb}-MS-{MS_bin}-AF-SFT"] =[f"AFTERSHOCKS  AFTER MAINSHOCK BIN {MS_bin}","OR"] 
            MS_HE[f"HE-EQ-{MS_bin}"] = [f" BIN {MS_bin} OCCURS","FALSE"]
            FTL.write(f"{Model_name}, {com_abb}-MS-{MS_bin}-AF-FT = \n")
            FTL.write(f"{com_abb}-MS-{MS_bin}-AF-FT            AND    HE-EQ-{MS_bin}  {com_abb}-MS-{MS_bin}-AF-FT1\n") 
            MS_AF_Gates[f"{com_abb}-MS-{MS_bin}-AF-FT1"]= [f"AFTERSHOCKS AFTER MAINSHOCK BIN {MS_bin}","OR"]
            
            FTL.write(f"{com_abb}-MS-{MS_bin}-AF-FT1         OR  ") 
            Temp_list_T =[]        
            for t in range(1,t_bins+1):
                
                FTL.write(f"{com_abb}-MS-{MS_bin}-T-{t}-GT  ")
                MS_AF_Gates[f"{com_abb}-MS-{MS_bin}-T-{t}-GT"] = [f"TIME BIN {t}", "AND"]
                #Temp_list_T.append(f"{com_abb}-MS-{MS_bin}-T-{t}-FT")
            FTL.write("\n")
            
            for t in range(1,t_bins+1):
                if t==1: 
                    FTL.write(f"{com_abb}-MS-{MS_bin}-T-{t}-GT          AND      HE-T-{t}  {com_abb}-MS-{MS_bin}-T-{t}-FT\n")           
                    MS_AF_Gates 
                    FTL.write(f"{com_abb}-MS-{MS_bin}-T-{t}-FT           TRAN\n")
                    
                else:
                      
                    FTL.write(f"{com_abb}-MS-{MS_bin}-T-{t}-GT          AND      HE-T-{t} {com_abb}-MS-{MS_bin}-T-{t}-FT ") 
                    for time in range(1,t):
                      
                       FTL.write(f"NOT-{com_abb}-MS-{MS_bin}-T-{time}-AF-GT ")
                       GTD.write(f"NOT-{com_abb}-MS-{MS_bin}-T-{time}-AF-GT,   NO FAILURE IN TIME BIN {time}  , , G-PWR\n") 
                    
                       # MS_AF_Gates[f"NOT-{com_abb}-MS-{MS_bin}-T-{time}"] = [f"NO FAILURE IN TIME BIN {t}","NOR"] 
                    FTL.write("\n")
            for time in range(2,t_bins+1):
                FTL.write(f"{com_abb}-MS-{MS_bin}-T-{time}-FT           TRAN   \n")
                        
            for time in range(1,t_bins):
                FTL.write(f"NOT-{com_abb}-MS-{MS_bin}-T-{time}-AF-GT      NOR  {com_abb}-MS-{MS_bin}-T-{time}-FT\n")
                        
            FTL.write("^EOS\n")
            
            ##---------- LEVEL 1 GATES--------------- 
            
        FTL.write(f"G-PWR, {com_abb}-SEIS-FT = \n")
        FTL.write(f"{com_abb}-SEIS-FT           OR  {com_abb}-SEIS-MS-FT {com_abb}-SEIS-AS-GT \n" )
        FTL.write(f"{com_abb}-SEIS-MS-FT           TRAN \n" )
        
        FTD.write(f"{com_abb}-SEIS-FT, SEISMIC FAILURE OF {com_name} ,      ,      ,G-PWR\n")
        GTD.write(f"{com_abb}-SEIS-FT, SEISMIC FAILURE OF {com_name} , , G-PWR\n")
        
        FTD.write(f"{com_abb}-SEIS-MS-FT, MAINSHOCK FAILURE OF {com_name},S , , G-PWR\n")
        GTD.write(f"{com_abb}-SEIS-MS-FT, MAINSHOCK FAILURE OF {com_name},   , G-PWR\n")
        ## -----------AFTERSHOCKS GATES-------
        
        FTL.write(f"{com_abb}-SEIS-AS-GT       AND  {com_abb}-SEIS-AS-F-GT  NOT-{com_abb}-SEIS-MS \n")
        GTD.write(f"{com_abb}-SEIS-AS-GT, AFTERSHOCK FAILURES, , G-PWR\n")
        GTD.write(f"{com_abb}-SEIS-AS-F-GT, {com_name} AFTERSHOCK FAILURES, , G-PWR\n")
        FTL.write(f"NOT-{com_abb}-SEIS-MS       NOR  {com_abb}-SEIS-MS-FT \n")
        MS_AF_Gates[f"NOT-{com_abb}-SEIS-MS"] = ["NO FAILURE FROM THE MAINSHOCK", "NOR"]
       
        FTL.write(f"{com_abb}-SEIS-AS-F-GT       OR  ")
        for MS_bin in MS_bins:
            
            FTL.write(f"{com_abb}-MS-{MS_bin}-AF-FT  ")
        FTL.write("\n")
        for MS_bin in MS_bins:
            
            FTL.write(f"{com_abb}-MS-{MS_bin}-AF-FT     TRAN \n")
        
        
        
        FTL.write("^EOS\n")
            
       
        ##------------- Mainshock FT-----------------
        FTL.write(f"G-PWR, {com_abb}-SEIS-MS-FT = \n")
        FTL.write(f"{com_abb}-SEIS-MS-FT         OR  ")
        
        for MS_bin in MS_bins:
            MS_Gates[f"{com_abb}-MS-{MS_bin}-GT"] = [f"SEISMIC BIN {MS_bin}", "AND"]
            FTL.write(f"{com_abb}-MS-{MS_bin}-GT ") 
            
        
        FTL.write("\n")
        
        for MS_bin in MS_bins:
            
            
            FTL.write(f"{com_abb}-MS-{MS_bin}-GT        AND  HE-EQ-{MS_bin}   {com_abb}-MS-{MS_bin}-BE\n")
            BED.write(f"{com_abb}-MS-{MS_bin}-BE, MAINSHOCK BIN {MS_bin} FAILURE OF {com_name}, G-PWR\n")
            
            fp = norm.cdf((np.log(float(MS_ACC[MS_bin-1])/float(Am))/np.sqrt(float(Bu)**2+float(Br)**2)))
            
            BEI.write(f"{com_abb}-MS-{MS_bin}-BE, J, , S,{str(Br)}, {str(Am)},{str(MS_ACC[MS_bin-1])},0.00E+00, 0.00E+00, , , {str(Bu)} , {str(fp)} , , RANDOM, CD, G-PWR \n")
            
            
        FTL.write("^EOS\n")    
            
    for key, value in AF_Fault_Trees.items():
        
        GTD.write(f"{key}, {value[0]}, , G-PWR\n") 
        FTD.write(f"{key}, {value[0]}, S, , G-PWR\n") 
        
    for key, value in MS_AF_Gates.items():
        GTD.write(f"{key}, {value[0]}, , G-PWR\n")
        
    for key, value in MS_Gates.items():
        GTD.write(f"{key}, {value[0]}, , G-PWR\n")
         
    for key, value in AF_Gates.items():
        GTD.write(f"{key}, {value[0]}, , G-PWR\n")
        
    
    for key, value in MS_HE.items():
        BED.write(f"{key}, {value[0]},  G-PWR\n") 
        BEI.write(f"{key}, F, 0.000E+000 ,  , 0.000E+000, 0.000E+000, 0.000E+000, 0.000E+000, 0.000E+000,  ,  , 0.000E+000, 0.000E+000, Y, RANDOM \n")
        
    for key, value in AF_Basic.items():
        BED.write(f"{key}, {value[0]},  G-PWR\n")
        
        
                  
    for key, value in T_Basic.items():
        BED.write(f"{key}, {value[0]},  G-PWR\n")
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    FTL.close()   
    GTD.close()
    FTD.close()
    BED.close()
    BEI.close()                      
    BEC.close()        
    MARD.close()                
      
   
        
        
       #row['Updated Am'] 
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