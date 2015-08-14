class StorageBuild < ActiveRecord::Base
  belongs_to :storage
  belongs_to :build
  
end
