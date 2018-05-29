class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :restricion
  has_many :classification
end
