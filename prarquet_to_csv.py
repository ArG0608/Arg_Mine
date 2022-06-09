# import libraries/modules
import csv
import pandas as pd
from pathlib import Path
import sys
import os

FromS3Dir = "C:\DIR\GIGIYA\Parquet"
# csvDir = "C:\DIR\GIGIYA\Parquet\DIR"
# for parquet_file in Path(FromS3Dir).rglob('*'):
#    print(parquet_file.name)
#    file = pd.read_parquet(parquet_file)
#    file.to_csv(csvDir + parquet_file.name + ".csv")

### This Line Added in New ... LALA ALA ALA ALA AL


##args=sys.argv

##FromS3Dir=Path(args[1])
full_df = pd.concat(pd.read_parquet(parquet_file) for parquet_file in Path(FromS3Dir).rglob('*'))
# full_df = pd.concat(pd.read_parquet(parquet_file) for parquet_file in path.glob('*'))

full_df.to_csv("C:\DIR\GIGIYA\Parquet\ affli.csv", header=True, quoting=csv.QUOTE_NONNUMERIC, doublequote=True,
               index=False)
