class CpuBuild < ActiveRecord::Base
  belongs_to :cpu
  belongs_to :build
end