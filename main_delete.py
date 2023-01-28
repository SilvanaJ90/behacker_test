#!/usr/bin/python3
""" Test delete feature
"""
from models.engine.file_storage import FileStorage
from models.category import Category

fs = FileStorage()

# All Categories
all_categories = fs.all(Category)
print("All Categories: {}".format(len(all_categories.keys())))
for categories_key in all_categories.keys():
    print(all_categories[categories_key])

# Create a new Categories
new_categories = Category()
new_categories.name = "California"
fs.new(new_categories)
fs.save()
print("New Category: {}".format(new_categories))

# All Category
all_categories = fs.all(Category)
print("All Categories: {}".format(len(all_categories.keys())))
for categories_key in all_categories.keys():
    print(all_categories[categories_key])

# Create another Categories
another_categories = Category()
another_categories.name = "Nevada"
fs.new(another_categories)
fs.save()
print("Another Categories: {}".format(another_categories))

# All Categories
all_categories = fs.all(Category)
print("All Category: {}".format(len(all_categories.keys())))
for categories_key in all_categories.keys():
    print(all_categories[categories_key])        

# Delete the new Category
fs.delete(new_categories)

# All Category
all_categories = fs.all(Category)
print("All Categories {}".format(len(all_categories.keys())))
for categories_key in all_categories.keys():
    print(all_categories[categories_key])