# import libraries/modules
from pathlib import Path
import pandas as pd
import csv
import sys
csvDir = "C:/DIR/OCED/"
Csv_File="parquet_file_code.csv"
args = sys.argv
FromS3Dir = Path("C:\DIR\GIGIYA\Parquet")

full_df = pd.concat(pd.read_parquet(parquet_file) for parquet_file in FromS3Dir.glob('*'))

full_df.to_csv(csvDir + "file", header=True, quoting=csv.QUOTE_NONNUMERIC, doublequote=True, index=False)
file = '/talend_data_shared/EPICX/POC/UCRM/python_test_file.txt'
with open(file, 'a+') as f:
    f.write("\nPath:%s\nCSV:%s" % (FromS3Dir, Csv_File))
