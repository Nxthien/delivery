class Restaurant < ApplicationRecord
	has_many :listtypes

	mount_uploader :image, ImageUploader

end
