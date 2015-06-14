class Memory < ActiveRecord::Base
	belongs_to :memory_type, class_name: 'MemorySlot', foreign_key: 'memory_slot_id'
	has_many :builds
end