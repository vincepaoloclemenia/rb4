module ApplicationHelper
	def wizard_done?
		current_user.flag >= 6 ? true : false
	end

	def to_peso(num)
		num = 0 if num == 0 || num.nil?
		number_to_currency(num, unit: "PhP ")
	end

	def to_datepicker_format(date)
		date.strftime("%m/%d/%Y")
	end

	def net_vat_total_computation(purchase_items)
		nvt = []
		vat_rate = 0.12 #12%

		purchase_items.each do |pi|
			if pi.vat_type == "VAT-Inclusive"
				total = pi.purchase_item_total_amount.to_f
				vat = (total * vat_rate).to_f
				net = (total - vat).to_f
			elsif pi.vat_type == "VAT-Exclusive"
				vat = (pi.purchase_item_total_amount.to_f * vat_rate).to_f
				net = pi.purchase_item_total_amount.to_f
				total = (net + vat).to_f
			else #VAT-Exempted
				vat = 0.00
				net = pi.purchase_item_total_amount.to_f
				total = pi.purchase_item_total_amount.to_f
			end
			nvt << { net: net, vat: vat, total: total }
		end

		total_net = 0
		total_vat = 0
		total_amount = 0
		nvt.each do |i|
			total_net += i[:net]
			total_vat += i[:vat]
			total_amount += i[:total]
		end
		return { net: total_net, vat: total_vat, total: total_amount }
	end
end
