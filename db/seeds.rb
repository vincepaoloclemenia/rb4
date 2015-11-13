# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Section.create name: "clients", page: "Company"
Section.create name: "brands", page: "Brands"
Section.create name: "branches", page: "Branches"
Section.create name: "permissions", page: "Permissions"
Section.create name: "roles", page: "Roles"
Section.create name: "users", page: "Users"