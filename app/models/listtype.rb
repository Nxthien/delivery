class Listtype < ApplicationRecord
	belongs_to :restaurant
	has_many :foods, dependent: :destroy
end
