class Branch < ActiveRecord::Base
  belongs_to :brand
  belongs_to :subscription
  has_many :sales
  has_many :employees
  has_many :inventories, dependent: :restrict_with_error
  has_many :purchases
  has_one :branch_subscription
  has_one :subscription, through: :branch_subscription

	validates :name,
						presence: true,
						length: {
							maximum: 50
						},
            uniqueness: { scope: :brand_id, message: "already exist", case_sensitive: false }

  after_create :set_default_color

  def set_default_color
    #for nil branch color
    if self.color.nil?
      color_set = ["#60355B","#E26A6A","#FF4500","#DC143C","#FF8C00","#C71585","#1E81B4","#00A087","#DD525B",
                  "#8CAF41","#8F7260","#4F669D","#646464","#AAA786","#6F9684","#98ACD1"]
      self.update color: color_set.sample
    end
  end
end
