class Restriction < ApplicationRecord
  has_many :subcategory, optional: true
  has_many :category, optional: true
end
