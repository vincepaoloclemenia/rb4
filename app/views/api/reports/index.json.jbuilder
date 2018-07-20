total_cost_for_week = 0
total_cost_for_month = 0
json.items do |json|
    json.array! @items do |item|
        json.id item.id
        json.name item.name
        json.unit item.unit.name
        price_movement = @user.purchase_items.get_price_movement(@date, item.id)      
        last_week_found = price_movement[:last_week_amount] == 0
        last_month_found = price_movement[:last_month_amount] == 0
        last_week_difference = price_movement[:last_week_difference]
        last_month_difference = price_movement[:last_month_difference]
        json.last_week_found last_week_found
        json.last_month_found last_month_found
        json.current_amount to_peso(price_movement[:current_amount])
        json.last_week_amount to_peso(price_movement[:last_week_amount])
        json.last_week_difference to_peso(last_week_difference)
        json.last_month_difference to_peso(last_month_difference)
        json.last_month_amount to_peso(price_movement[:last_month_amount])
        json.last_week_percentage "#{price_movement[:last_week_percentage]} %" 
        json.last_month_percentage "#{price_movement[:last_month_percentage]} %" 
        json.last_week_comparison price_movement[:last_week_comparison]
        json.last_month_comparison price_movement[:last_month_comparison]
        total_cost_for_week += last_week_difference
        total_cost_for_month += last_month_difference 
    end
end
#Date Ranges
beginning_month = @date.last_month.beginning_of_month.strftime('%b %d, %Y')
ending_month = @date.last_month.end_of_month.strftime('%b %d, %Y')
json.beginning beginning_month
json.last_week_range "#{@date.last_week.beginning_of_week.strftime('%b %d, %Y')} - #{@date.last_week.end_of_week.strftime('%b %d, %Y')}"
json.last_month_range "#{beginning_month} - #{ending_month}"
json.today @date.strftime("%b %d, %Y")

json.total_cost_for_week do 
    json.value to_peso(total_cost_for_week)
    json.status total_cost_for_week < 0 
end
json.total_cost_for_month do
    json.value to_peso(total_cost_for_month)
    json.status total_cost_for_month < 0 
end
json.overall do
    json.value to_peso(total_cost_for_week + total_cost_for_month)
    json.status (total_cost_for_week + total_cost_for_month) < 0 
end 