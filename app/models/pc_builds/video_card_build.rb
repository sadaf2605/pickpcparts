class VideoCardBuild < ActiveRecord::Base
  belongs_to :video_card
  belongs_to :build
end
