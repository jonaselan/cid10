class Category < ApplicationRecord
  belongs_to :group
  has_many :subcategories
  belongs_to :restrictions
  belongs_to :classifications

  scope :search_by, -> (q) { where("name LIKE '%#{q}%' or name50 LIKE '%#{q}%'") }

end
