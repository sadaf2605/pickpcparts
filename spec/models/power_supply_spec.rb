require 'rails_helper'

RSpec.describe PowerSupply, type: :model do
  	  it_should_behave_like "a child product", :power_supply, PowerSupply

  	  it "supports_cpu_cases"
  	  it "supports_video_card"
end
