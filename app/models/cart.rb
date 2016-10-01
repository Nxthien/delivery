class Cart < ApplicationRecord
	has_many :foods, dependent: :destroy
	belongs_to :user
end
