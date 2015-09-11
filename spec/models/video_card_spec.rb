require 'rails_helper'

RSpec.describe VideoCard, type: :model do
	it_should_behave_like "a child product", :video_card, VideoCard
	
	it "should show video card" #todo
	it "should support case" #todo
end
