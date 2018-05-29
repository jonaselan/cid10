class Classification < ApplicationRecord
  belongs_to :subcategory, optional: true
end
