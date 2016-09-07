class Cart < ApplicationRecord
	has_many :foods
	belongs_to :user
end
