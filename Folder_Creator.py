# import os

# # Folder name
# folder_name = "String Problems"

# # Create folder if it doesn't exist
# os.makedirs(folder_name, exist_ok=True)

# # Create files Q1.py to Q15.py
# for i in range(1,152):
#     file_path = os.path.join(folder_name, f"Problem-{i}.py")

#     with open(file_path, "w") as file:
#         file.write(f"# Problem {i} : \n\n")

# print("Assignment folder created successfully!")
# print("Files Q1.py to Q16.py have been created.")

import os

# Get the directory where test.py is located
script_dir = os.path.dirname(os.path.abspath(__file__))

# Create the folder beside test.py
folder_name = os.path.join(script_dir, "Assignment 50 - MySQL 2")

os.makedirs(folder_name, exist_ok=True)

for i in range(1,10):
    file_path = os.path.join(folder_name, f"Q{i}.sql")
    with open(file_path, "w") as file:
        file.write(f"# Assignment 50 - MySQL 2 \n/* Question {i}: \n\n*/\n\n")

print("Created successfully!")
print("Folder:", folder_name)