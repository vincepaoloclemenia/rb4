class Directional 
  def initialize(beginning_date, ending_date, branch)
    @beginning_date = beginning_date
    @ending_date = ending_date
    @branch = branch
		
    @sale = Sale.where(sale_date: @beginning_date..@ending_date, branch_id: @branch)
	end
  
  def sales_entries(chosen_query)
    hash_entries = Hash.new
    chosen_query.each do |name, amount|
      hash_entries[name] = amount.map(&:amount).reject{|a| a.nil?}.inject(:+)
    end
    hash_entries
  end

  def total_sales(chosen_query)
    total = 0
    sales_entries(chosen_query).each do |name, amount|
      total += amount
    end
    return total
  end

  def sales_percentage(amount, chosen_query)
    return ((amount.to_f / total_sales(chosen_query)) * 100).round(2)
  end
  
  def resource_count(column_name, act, chosen_query)
    amount = @sale.map(&column_name).reject{|c| c.nil? }.inject(:+)
    if act == 'n'
      return amount
    else
      return if total_sales(chosen_query).nil? || amount.nil?
      (total_sales(chosen_query).to_f / amount.to_f).round(2)
    end
  end
end
