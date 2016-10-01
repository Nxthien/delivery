class Restaurant < ApplicationRecord
	has_many :listtypes, dependent: :destroy

	mount_uploader :image, ImageUploader

end
