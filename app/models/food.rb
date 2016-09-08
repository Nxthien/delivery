class Food < ApplicationRecord
	belongs_to :listtype
	belongs_to :cart
	mount_uploader :image, ImageUploader

end
