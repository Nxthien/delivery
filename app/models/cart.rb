class Cart < ApplicationRecord
	has_many :items, dependent: :destroy
	belongs_to :user

	accepts_nested_attributes_for :items , allow_destroy: true
end
