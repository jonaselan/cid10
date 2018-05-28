class Chapter < ApplicationRecord
  belongs_to :cid10
  has_many :group
end
