class Subcategory < ApplicationRecord
  belongs_to :category
  belongs_to :restrictions
  belongs_to :classifications
end
