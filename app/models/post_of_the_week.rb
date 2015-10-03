class PostOfTheWeek < ActiveRecord::Base
	belongs_to :build_post, :dependent => :delete
	
end
