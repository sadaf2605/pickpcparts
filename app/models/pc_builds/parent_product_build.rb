class ParentProductBuild < ActiveRecord::Base
    self.abstract_class = true
  belongs_to :build
  belongs_to :market_status
end