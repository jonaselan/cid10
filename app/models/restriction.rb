class Restriction < ApplicationRecord
  has_many :subcategories
  has_many :categories
end
