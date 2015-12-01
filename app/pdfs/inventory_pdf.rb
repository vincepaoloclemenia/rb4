class InventoryPdf < Prawn::Document
  def initialize(items, brand, branch)
    super(top_margin: 40)
    @items = items
    @brand = brand
    @branch = branch
    text "Inventory Item List", style: :bold, size: 14.5
    move_down(15)
    items_header
    move_down(10)
    move_down(10)
    items_count
  end


  def items_header

    items_header = []
    items_header << [{:content => 'Brand: ', :borders => []}, {:content => @brand.name, :borders => []}, 
    {:content => 'Branch: ', :borders => []}, {:content => @branch.name, :borders => []}]
    items_header << [{:content => 'Date: ', :borders => []}, {:content => '__________________________', :borders => []}, 
    {:content => 'Counted By:', :borders => []}, {:content => '__________________________', :borders => []}]
    table(items_header) do 
        row(0).style :align => :left
      end
  end


  def items_count
    @items.group_by {|t| t.category.parent }.each do |category, items|
      text " ", style: :bold, size: 11.5
      text category.name, style: :bold, size: 12.5

      itemcounts = []
      headers = ['Subcategory', 'Item', 'Unit', 'Quantity', 'Count']
      itemcounts << headers
      
        items.each do |i|
          itemcounts << 
              [
              i.category.name, i.name, i.unit.name, " ", " "
              ] 
        end
      
      table(itemcounts, :width => 540, :cell_style => {:size => 9, :border_color => "000000"}, header: true ) do 
        row(0).style :align => :center 
        column(0).style :align => :center 
        column(1).style :align => :center 
        column(2).style :align => :center
        column(3).style :align => :center
        column(4).style :align => :center
        row(0).style :text_color => '000000'
        row(0).style :background_color => 'ffffff'
      end
    end
  end
end