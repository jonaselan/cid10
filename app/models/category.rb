class Category < ApplicationRecord
  belongs_to :group
  belongs_to :restriction, optional: true
  belongs_to :classification, optional: true
  has_many :subcategories

  scope :search_by, -> (q) { where("name LIKE '%#{q}%' or name50 LIKE '%#{q}%'") }

end
