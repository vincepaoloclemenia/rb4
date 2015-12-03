class LaborHourPdf < Prawn::Document::BoundingBox
  def initialize
    super

    text "hello"

    # cell_1 = make_cell(:content => "this row content comes directly ")
    # cell_2 = make_cell(:content => "from cell objects")
    # two_dimensional_array = [ ["..."], ["subtable from an array"], ["..."] ]
    # my_table = make_table([ ["..."], ["subtable from another table"], ["..."] ])
    # image_path = "#{Prawn::DATADIR}/images/stef.jpg"

    # table([ ["just a regular row", "", "", "blah blah blah"], [cell_3],

    # [cell_1, cell_2, "", ""],
    # ["", "", two_dimensional_array, ""],
    # ["just another regular row", "", "", ""],
    # [{:image => image_path}, "", my_table, ""]])
    headers
  end

  def headers
    move_down 20
    table [["1", "2"], ["3", "4"]], width: bounds.width
  end
end
  # def initialize(all_employees, brands, branches, beginning_date, ending_date)
  #   super( :page_layout => :landscape, top_margin: 20)

  #   @all_employees = all_employees
  #   @brands = brands
  #   @branches = branches
  #   @beg_date = beginning_date
  #   @end_date = ending_date

  #   #text "Labor Hours Report", style: :bold, size: 14.5
  #   #move_down(10)
  #   # employees_hours_listings
  # end

  # def employees_hours_listings
  #   @all_employees.sort_by{|t|t.branch_id}.group_by{|t| t.id}.each do |employee, laborhours|
  #     row1 = []
  #     @emp = Employee.find(employee)
  #     #if cursor <= 200 
  #     #start_new_page
  #     #end
  #     text " ", style: :bold, size: 11.5
  #     #text "#{@emp.first_name? ? @emp.first_name : " " + " " + @emp.last_name? ? @emp.last_name : " "} - #{@emp.branch.name}", style: :bold, size: 11.5
  #     #text "#{@emp.full_name} - #{@emp.branch.name}", style: :bold, size: 11.5
  #     laborhours.each do |all_emp| 
  #       row1.clear
  #       row1 << [['a', 'b','c','d','e'], colspan: 2]
  #       # row1 << [{:content => 'Employee Name', :colspan => 2 }, {:content => 'Client', :colspan => 2 }, {:content => 'Brand', :colspan => 2 }, {:content => 'Branch', :colspan => 2 }, {:content => 'Date Employed', :colspan => 2 } ]
  #       @name = all_emp.full_name
        
  #       row1 << [{:content => "#{@name}", :colspan => 2 }, {:content => "#{all_emp.brand.client.name}", :colspan => 2 }, {:content => "#{all_emp.brand.name}", :colspan => 2 }, {:content => "#{all_emp.branch.name}", :colspan => 2 }, {:content => "#{all_emp.date_employed}", :colspan => 2 } ]
  #       if @beg_date != '' && @end_date != ''
  #         beg_query_date = @beg_date
  #         end_query_date = @end_date
  #         @beginning_date = Date.parse(beg_query_date.to_s)
  #         @ending_date = Date.parse(end_query_date.to_s)
  #         @all_employees_list_lh = all_emp.labor_hours_entries.where(working_date: @beginning_date..@ending_date)
  #       else
  #         @all_employees_list_lh = all_emp.labor_hours_entries
  #       end

  #       @total_regular = Array.new
  #       @total_legal_holiday = Array.new
  #       @total_special_holiday = Array.new
  #       @total_late = Array.new
  #       @total_absent = Array.new
  #       @total_rest_day = Array.new

  #       #  regular 
  #       @hours_reg = Array.new
  #       @minutes_reg = Array.new  
        
  #       #  overtime 
  #       @hours = Array.new
  #       @minutes = Array.new  
        
  #       #  night differential 
  #       @hours2 = Array.new
  #       @minutes2 = Array.new 

  #       #  legal holidays 
  #       @hours3 = Array.new
  #       @minutes3 = Array.new

  #       #  special holidays 
  #       @hours4 = Array.new
  #       @minutes4 = Array.new

  #       #  late 
  #       @hours5 = Array.new
  #       @minutes5 = Array.new

  #       #  absent 
  #       @hours6 = Array.new
  #       @minutes6 = Array.new

  #       #  rest day 
  #       @hours7 = Array.new
  #       @minutes7 = Array.new
  #       row1 << [{:content => 'Working Date', :colspan => 2}, 'Regular', 'Overtime', 'Night Differential', 'Legal Holiday', 'Special Holiday', 'Late', 'Absent', 'Rest Day' ]
  #       if !@all_employees_list_lh.empty?
  #         @all_employees_list_lh.sort_by{|t|t.working_date}.each do |labor_hours_list|
  #           row1 << [
  #             {:content => "#{labor_hours_list.working_date}", :colspan => 2 },
  #             labor_hours_list.regular,
  #             labor_hours_list.overtime,
  #             labor_hours_list.night_differential,
  #             labor_hours_list.legal_holiday,
  #             labor_hours_list.special_holiday,
  #             labor_hours_list.late,
  #             labor_hours_list.absent,
  #             labor_hours_list.rest_day
  #           ]

  #           # regular 
  #           @x_reg = labor_hours_list.regular.to_s.split(".")
  #           @hours_reg << @x_reg[0].to_i
  #           @minutes_reg << @x_reg[1].to_i
  #           @hr_reg = @hours_reg.inject(:+)
  #           @min_reg = @minutes_reg.inject(:+)
  #           if @min_reg >= 60
  #             @hr_reg = (@min_reg / 60) + @hr_reg
  #             @min_reg = @min_reg % 60
  #           end

  #           # overtime 
  #           @x = labor_hours_list.overtime
  #           @x = @x.to_s
  #           @x = @x.split(".")
  #           @hours << @x[0].to_i
  #           @minutes << @x[1].to_i
  #           @hr = @hours.inject(:+)
  #           @min = @minutes.inject(:+)
  #           if @min >= 60
  #             @hr = (@min / 60) + @hr
  #             @min = @min % 60
  #           end

  #           # night differential 
  #           @x2 = labor_hours_list.night_differential
  #           @x2 = @x2.to_s
  #           @x2 = @x2.split(".")
  #           @hours2 << @x2[0].to_i
  #           @minutes2 << @x2[1].to_i
  #           @hr2 = @hours2.inject(:+)
  #           @min2 = @minutes2.inject(:+)
  #           if @min2 >= 60
  #             @hr2 = (@min2 / 60) + @hr2
  #             @min2 = @min2 % 60
  #           end

  #           # legal holidays 
  #           @x3 = labor_hours_list.legal_holiday
  #           @x3 = @x3.to_s
  #           @x3 = @x3.split(".")
  #           @hours3 << @x3[0].to_i
  #           @minutes3 << @x3[1].to_i
  #           @hr3 = @hours3.inject(:+)
  #           @min3 = @minutes3.inject(:+)
  #           if @min3 >= 60
  #             @hr3 = (@min3 / 60) + @hr3
  #             @min3 = @min3 % 60
  #           end

  #           # special holidays 
  #           @x4 = labor_hours_list.special_holiday
  #           @x4 = @x4.to_s
  #           @x4 = @x4.split(".")
  #           @hours4 << @x4[0].to_i
  #           @minutes4 << @x4[1].to_i
  #           @hr4 = @hours4.inject(:+)
  #           @min4 = @minutes4.inject(:+)
  #           if @min4 >= 60
  #             @hr4 = (@min4 / 60) + @hr4
  #             @min4 = @min4 % 60
  #           end

  #           # late 
  #           @x5 = labor_hours_list.late
  #           @x5 = @x5.to_s
  #           @x5 = @x5.split(".")
  #           @hours5 << @x5[0].to_i
  #           @minutes5 << @x5[1].to_i
  #           @hr5 = @hours5.inject(:+)
  #           @min5 = @minutes5.inject(:+)
  #           if @min5 >= 60
  #             @hr5 = (@min5 / 60) + @hr5
  #             @min5 = @min5 % 60
  #           end

  #           # absent 
  #           @x6 = labor_hours_list.absent
  #           @x6 = @x6.to_s
  #           @x6 = @x6.split(".")
  #           @hours6 << @x6[0].to_i
  #           @minutes6 << @x6[1].to_i
  #           @hr6 = @hours6.inject(:+)
  #           @min6 = @minutes6.inject(:+)
  #           if @min6 >= 60
  #             @hr6 = (@min6 / 60) + @hr6
  #             @min6 = @min6 % 60
  #           end

  #           # rest day 
  #           @x7 = labor_hours_list.rest_day
  #           @x7 = @x7.to_s
  #           @x7 = @x7.split(".")
  #           @hours7 << @x7[0].to_i
  #           @minutes7 << @x7[1].to_i
  #           @hr7 = @hours7.inject(:+)
  #           @min7 = @minutes7.inject(:+)
  #           if @min7 >= 60
  #             @hr7 = (@min7 / 60) + @hr7
  #             @min7 = @min7 % 60
  #           end
  #         end

  #         @total_regular = @hr_reg.to_s + "." + @min_reg.to_s
  #         @total_overtime = @hr.to_s + "." + @min.to_s
  #         @total_night_differential = @hr2.to_s + "." + @min2.to_s
  #         @total_legal_holiday = @hr3.to_s + "." + @min3.to_s
  #         @total_special_holiday = @hr4.to_s + "." + @min4.to_s
  #         @total_late = @hr5.to_s + "." + @min5.to_s
  #         @total_absent = @hr6.to_s + "." + @min6.to_s
  #         @total_rest_day = @hr7.to_s + "." + @min7.to_s
          
  #         row1 << [
  #             {:content => "TOTAL", :colspan => 2 },
  #             @total_regular,
  #             @total_overtime,
  #             @total_night_differential,
  #             @total_legal_holiday,
  #             @total_special_holiday,
  #             @total_late,
  #             @total_absent,
  #             @total_rest_day
  #             ]
  #       else
  #         row1 << [
  #           {:content => "No Records Founds", :colspan => 10}
  #         ]
  #       end
  #     end

   
  #       table(row1, :width => 720, :cell_style => {:size => 9}) do
  #         row(0).style(:background_color => 'dddddd', :size => 9, :align => :center, :font_style => :bold)
  #         row(2).style(:background_color => 'dddddd', :size => 9, :align => :center, :font_style => :bold)
  #         self.row_colors = ["FFFFFF", "FFFFFF"]
  #         self.header = false
  #         row(row_length - 1).style(:font_style => :bold, :align => :center)
  #       end
        
  #       move_down 50

  #       text "___________________________", :align => :right
  #       self.indent 610, 20 do
  #         self.text "Signature", :style => :bold, :size => 10
  #       end
  #       start_new_page
  #   end
  # end
# end