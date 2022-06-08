import codecs
import sys

filename = "C:/Users/aghosh/Downloads/clinc_d_20220511.csv"
new_filename = "C:/Users/aghosh/Downloads/new_clinc_d_20220511.csv"

#filename = sys.argv[1]

try:

    with codecs.open(filename, 'r') as file_for_conversion:
        read_file_for_conversion = file_for_conversion.read()
    with codecs.open(filename, 'w', 'utf-8') as converted_file:
        converted_file.write(read_file_for_conversion)
except:
    print("An Error Occured during Convertion")
