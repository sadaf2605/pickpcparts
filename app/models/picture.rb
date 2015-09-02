class Picture < ActiveRecord::Base
	 mount_uploader :image, ProductImageUploader
end
