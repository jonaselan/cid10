class Subcategory < ApplicationRecord
  belongs_to :category
  belongs_to :restriction, optional: true
  belongs_to :classification, optional: true
end
