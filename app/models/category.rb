class Category < ApplicationRecord
  belongs_to :group
  has_many :subcategories
  has_many :restrictions
  has_many :classifications

  scope :search_by, -> (q) { where("name LIKE '%#{q}%' or name50 LIKE '%#{q}%'") }

end
