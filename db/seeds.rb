# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
=begin
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
Section.find_or_create_by name: "purchase_orders", page: "Purchase Orders"
Section.find_or_create_by name: "branch_purchase_order_setups", page: "Branch Purchase Order Setup"
puts "Done!"

puts "Loading plans.."
Plan.find_or_create_by name: "Free Trial", description: "Free trial for 2 months", amount: 0.00, plan_type: "Free", period: "monthly", brand_limit: 1, branch_limit: 3, duration_in_days: 60
Plan.find_or_create_by name: "Monthly Payment", description: "Monthly payment with unlimited usage", amount: 39.99, plan_type: "Subscription", period: "monthly", brand_limit: 0, branch_limit: 0
Plan.find_or_create_by name: "Yearly Payment", description: "Yearly payment with unlimited usage", amount: 399.99, plan_type: "Subscription", period: "yearly", brand_limit: 0, branch_limit: 0
puts "Done!"	
=end

#Sales DB population
Branch.all.includes(:sales).where( sales: { branch_id: nil } ).map do |br|
    (Date.today.beginning_of_year..Date.today).map do |date|
        sale = br.sales.new(sale_date: date)
        if sale.save
            range = Random.new
            chance = range.rand(1..100)
            br.brand.categories.main.saleable.map do |cat|
                sale.sale_by_category_entries.create(category_id: cat.id, amount: chance <= 50 ? range.rand(38000..53000) : range.rand(10000..15000))
            end
            br.client.statistics.active.map do |stat|
                sale.sales_stats.create(statistic_id: stat.id, branch_id: br.id, count: range.rand(300..2100), non_transac: stat.non_transac)
            end
            br.client.settlements.saleable.map do |stat|
                sale.sale_by_settlement_entries.create(settlement_id: stat.id, branch_id: br.id, amount: range.rand(11000..30000))
            end
            br.client.non_misces.active.map do |stat|
                sale.sales_non_misces.create(non_misce_id: stat.id, branch_id: br.id, count: range.rand(300..2100), percentage_scope: stat.percentage_scope)
            end
            sale.update_net_sales
            puts "Sale for #{sale.branch.name} #{sale.sale_date.strftime('%b %d, %Y')} created"
        else
            puts sale.errors.full_messages.join(", ")
        end
    end
end


# Purchases
Branch.all.includes(:purchases).where(purchases: { branch_id: nil } ).map do |br|
    (Date.today.beginning_of_year..Date.today).map do |date|
        if br.purchases.find_by_purchase_date(date)
            puts "Existing"
        else
            purchase = br.purchases.new(
                purchase_date: date,
                supplier_id: 1,
                invoice_number: SecureRandom.hex(5).upcase,
                user_created_by_id: User.find_by_username("vincepaoloclemenia").id,
                saved_through_po: false,
                brand_id: br.brand.id
            )
            if purchase.save
                item_total_amount = Random.new.rand(1000..13000)
                quantity = Random.new.rand(1..100)
                item_amount = (item_total_amount / quantity).round(2)
                Item.all.map do |item|
                    pi = purchase.purchase_items.new(
                        unit_id: item.unit.id,
                        quantity: quantity,
                        purchase_item_total_amount: item_total_amount,
                        purchase_item_amount: item_amount,
                        unit_name: item.unit.name,
                        date_of_purchase: Date.today,
                        packaging: "Sample",
                        item_id: item.id,
                        vat_type: "VAT-Inclusive"
                    )
                    if pi.save
                        next
                    else
                        puts pi.errors.full_messages.join(', ')
                    end
                end
                purchase.update_total_net_sum
                puts purchase.total_net_sum.to_f
            else
                puts purchase.errors.full_messages.join(', ')
            end
        end
    end
end