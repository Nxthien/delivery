class Food < ApplicationRecord
	belongs_to :listtype
	belongs_to :cart
end
