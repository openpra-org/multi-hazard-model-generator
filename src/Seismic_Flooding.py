from scipy.stats import norm
import pandas as pd

def Seis_Flood(dataframe,df_flood):

    FTL_SIF = open("SIF.FTL", "w") # .FTL file for fault tree logic
    GTD_SIF =open("SIF.GTD", "w") # .GTD file for Gates Description 
    FTD_SIF =open("SIF.FTD", "w") # .FTD file for fault tree Description 
    #GTA_SIF = open("SIF.GTA", "w")
    
    MARD_SIF = open("SIF.MARD","w")
    MARD_SIF.write(".\SIF.FTL\n")
    MARD_SIF.write(".\SIF.GTD\n")
    MARD_SIF.write(".\SIF.FTD\n")
    
    GTD_SIF.write("G-PWR  = \n")
    GTD_SIF.write("*  Name                 , Description,        Project\n")
    
    #GTA_SIF.write("G-PWR  = \n")
    #GTA_SIF.write("*  Name                 , Description,        Project\n")
    
    FTD_SIF.write("G-PWR  = \n")
    
    for index, row in dataframe.iterrows():
        
        com_name=row['Description']  # Component Description
        com_abb = row['Plant Mark Number']   # Component identifier
        
        [Am,Br,Bu]= row ['Updated Am'], row['Updated Br'], row['Updated Bu'] # fragility parameters
        
        ##--------- Seismic induced Flooding--------
            
        if row["Flooding?"] == "Yes":
            arr_SIF =[]
            for sif_index,sif_row in df_flood.iterrows():
                
                if sif_row["Floor"] == row["Floor"] and sif_row["Building"] == row["Building"]:
                    #print("ENTER")
                    arr_SIF.append(sif_row["Plant Mark Number"])
                    #print(arr_SIF)
                    
            FTL_SIF.write(f"G-PWR, {com_abb}-EQFT = \n")   # main fault tree for seismic and seismic induced failures
            
            FTL_SIF.write(f"{com_abb}-EQFT    OR  {com_abb}-SEIS-FT  {com_abb}-SIF-FT \n")
            
            FTL_SIF.write(f"{com_abb}-SIF-FT           OR  ")   # seismically induced flooding 
            for comp in arr_SIF:
                FTL_SIF.write(f"   {comp}-SEIS-FT        ")
                
            FTL_SIF.write("\n")
            
            for index_arr, SIF_comp in enumerate(arr_SIF):
                FTL_SIF.write(f"{SIF_comp}-SEIS-FT           TRAN   \n")
                                  
            FTL_SIF.write(f"{com_abb}-SEIS-FT                   TRAN\n")
            
            FTL_SIF.write("^EOS\n")
            
            # Fault Tree description 
            
            FTD_SIF.write(f"{com_abb}-EQFT,  SEISMIC AND SEISMIC INDUCED FAILURE OF {row['Description']}   ,   ,  , G-PWR \n")
            
            # Gate description
            
            GTD_SIF.write(f"{com_abb}-EQFT, SEISMIC AND SEISMIC INDUCED FAILURE OF {row['Description']}, G-PWR\n")
            GTD_SIF.write(f"{com_abb}-SIF-FT, SEISMICALLY INDUCED FLOODING OF {row['Description']}, G-PWR\n")
            
            
    FTL_SIF.close() 
    GTD_SIF.close()
    FTD_SIF.close()
    MARD_SIF.close() 
                    
