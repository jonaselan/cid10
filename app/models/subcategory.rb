class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :restrictions
  has_many :classifications
end
