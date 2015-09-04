class ProductPicture < ActiveRecord::Base
	belongs_to :picture
	belongs_to :product
	accepts_nested_attributes_for :picture, :allow_destroy => true
end