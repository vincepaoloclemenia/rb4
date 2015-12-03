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
Section.find_or_create_by name: "employees", page: "Employees"
Section.find_or_create_by name: "settlements", page: "Settlements"
Section.find_or_create_by name: "categories", page: "Categories"
Section.find_or_create_by name: "subcategories", page: "Subcategories"
Section.find_or_create_by name: "shifts", page: "Shifts"
Section.find_or_create_by name: "sales", page: "Sales"
Section.find_or_create_by name: "labor_hours", page: "Labor Hours"
Section.find_or_create_by name: "units", page: "Units"
Section.find_or_create_by name: "items", page: "Items"
Section.find_or_create_by name: "inventories", page: "Inventories"
Section.find_or_create_by name: "employee_types", page: "Employee Types"
Section.find_or_create_by name: "conversions", page: "Conversions"
Section.find_or_create_by name: "suppliers", page: "Suppliers"
Section.find_or_create_by name: "purchases", page: "Purchases"
Section.find_or_create_by name: "purchase_items", page: "Purchase Items"
Section.find_or_create_by name: "labor_hours", page: "Labor Hours"