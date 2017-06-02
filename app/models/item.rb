class Item < ApplicationRecord
	belongs_to :cart
  validates :name, presence: true
end
