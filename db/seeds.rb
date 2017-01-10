# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Loading sections.."
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
Section.find_or_create_by name: "settings", page: "Settings"
Section.find_or_create_by name: "subscriptions", page: "Subscriptions"
Section.find_or_create_by name: "bills", page: "Bills"
puts "Done!"

puts "Loading plans.."
Plan.find_or_create_by name: "Free Trial", description: "Free trial for 2 months", amount: 0.00, plan_type: "Free", period: "monthly", brand_limit: 1, branch_limit: 3, duration_in_days: 60
Plan.find_or_create_by name: "Monthly Payment", description: "Monthly payment with unlimited usage", amount: 39.99, plan_type: "Subscription", period: "monthly", brand_limit: 0, branch_limit: 0
Plan.find_or_create_by name: "Yearly Payment", description: "Yearly payment with unlimited usage", amount: 399.99, plan_type: "Subscription", period: "yearly", brand_limit: 0, branch_limit: 0
puts "Done!"	