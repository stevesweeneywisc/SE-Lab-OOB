import ast
import sys

file_path = sys.argv[1] 

try:
    with open(file_path, 'r') as f:
        dict_string = f.read()
        my_dict = ast.literal_eval(dict_string)
except FileNotFoundError:
    print(f"Error: File '{file_path}' not found.")
except ValueError as e:
    print(f"Error: Invalid dictionary format in '{file_path}': {e}")

print (type(my_dict))
for dictionary in my_dict:
     with open ("/home/fortinet/automation/ansible/fortinet/license/"+dictionary['description']+".lic",'w') as file:
        file.write(dictionary['token'])
#     print(dictionary['description'])
#     print(dictionary['token'])
#     print("")

#for dictionary in my_dict:
#    #new_file_name = {dictionary["description"]}
#    new_file_name = "new_file.lic"
#    token = '{dictionary["token"]}'
#    with open (new_file_name,'w') as file:
#        file.write(token)
