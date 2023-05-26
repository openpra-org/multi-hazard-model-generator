import numpy as np
import matplotlib.pyplot as plt 
import pandas as pd
import random 
from scipy.stats import norm
import os
import shutil

# import project functions 

from Functions.MS_AF_Const import AF_MS_FW
from Functions.Seismic_Flooding import Seis_Flood

#from Functions.Aftershocks import mean_AF





main_directory = '.'  # Path to the main directory

# Read Project Input Files 

SEL = 'Input/SEL.csv'
flood_sources= 'Input/Flood_causes.csv'

df = pd.read_csv(SEL)
df_flood = pd.read_csv(flood_sources)



AF_MS_FW(df.loc[:],df_flood,2)

AF_MS_dir = 'Output/Aftershocks'  # Aftershock fault trees sub-dir 

# Specify the files to move
files_to_move = ['AF.BED', 'AF.BEI', 'AF.BEC','AF.FTD','AF.FTL','AF.GTD','AF.MARD']
# Move each specified file to the sub-directory
for file in files_to_move:
    # Specify the source file path
    source = os.path.join(main_directory, file)

    # Specify the destination file path (sub-directory)
    destination = os.path.join(AF_MS_dir, file)

    # Move the file to the sub-directory
    shutil.move(source, destination)


Seis_Flood(df.loc[:],df_flood)
SIF_dir = 'Output/Flooding'  # Seismic Induced Flooding MARD Dir

# Specify the files to move
files_to_move = ['SIF.FTD','SIF.FTL','SIF.GTD','SIF.MARD']
# Move each specified file to the sub-directory
for file in files_to_move:
    # Specify the source file path
    source = os.path.join(main_directory, file)

    # Specify the destination file path (sub-directory)
    destination = os.path.join(SIF_dir, file)

    # Move the file to the sub-directory
    shutil.move(source, destination)