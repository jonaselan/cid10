class Restriction < ApplicationRecord
  belongs_to :subcategory, optional: true
  belongs_to :category, optional: true
end
