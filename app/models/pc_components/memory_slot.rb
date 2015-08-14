class MemorySlot < ActiveRecord::Base
	has_many :motherboards
	has_many :memories
end
