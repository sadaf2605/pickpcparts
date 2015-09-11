require 'rails_helper'

RSpec.describe Memory, type: :model do
  it_should_behave_like "a child product", :memory, Memory


	it_should_behave_like "a report", :memory, :motherboard, "memory_slot" do
	  let(:static_part){
        mem=FactoryGirl.create(:memory)
        mem.memory_type = FactoryGirl.create(:memory_slot)
        mem
      }
      let(:same_component){
        FactoryGirl.create(:motherboard_basic, memory_slot: subject.memory_type)
      }
      let(:no_component){
        FactoryGirl.create(:motherboard_basic)
      }
      let(:different_component){
        FactoryGirl.create(:motherboard_basic, memory_slot: FactoryGirl.create(:memory_slot))
      }
	end
end
