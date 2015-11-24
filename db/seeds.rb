# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Section.find_or_create_by name: "clients", page: "Company"
Section.find_or_create_by name: "brands", page: "Brands"
Section.find_or_create_by name: "branches", page: "Branches"
Section.find_or_create_by name: "permissions", page: "Permissions"
Section.find_or_create_by name: "roles", page: "Roles"
Section.find_or_create_by name: "users", page: "Users"
Section.find_or_create_by name: "settlements", page: "Settlements"
Section.find_or_create_by name: "categories", page: "Categories"
Section.find_or_create_by name: "subcategories", page: "Subcategories"