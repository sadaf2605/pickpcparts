class MemoryBuild < ActiveRecord::Base
  belongs_to :memory
  belongs_to :build
end
