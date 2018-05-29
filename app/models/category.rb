class Category < ApplicationRecord
  belongs_to :group
  has_many :subcategories
  has_many :restrictions
  has_many :classifications

  def self.search_by(term)
    Category.where(name: term)
  end
end
