class ParentProductBuild < ActiveRecord::Base
  belongs_to :build
  belongs_to :market_status
end