import os

script_dir = os.path.dirname(os.path.abspath(__file__))

folder_name = os.path.join(script_dir, "Assignment 10 - Aggregate Functions and Grouping")

os.makedirs(folder_name, exist_ok=True)

for i in range(1,2):
    file_path = os.path.join(folder_name, f"Q{i}.sql")
    with open(file_path, "w") as file:
        file.write(f'''# Assignment 10 - Aggregate Functions and Grouping \n\n/*\n Question {i}: \n\n*/\n\n''')

print("Created successfully!")
print("Folder:", folder_name)