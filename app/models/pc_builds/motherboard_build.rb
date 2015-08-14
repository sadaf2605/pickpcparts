class MotherboardBuild < ActiveRecord::Base
  belongs_to :motherboard
  belongs_to :build
end