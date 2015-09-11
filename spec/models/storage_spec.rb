require 'rails_helper'

RSpec.describe Storage, type: :model do
    	  it_should_behave_like "a child product", :storage, Storage

    let(:static_part){
        storage=FactoryGirl.create(:storage_basic)
        storage.interface="SATA 6 Gb/s"
        storage
      }

    it_should_behave_like "a report",:storage, :motherboard, "interface" do

      let(:same_component){
        FactoryGirl.create(:motherboard_basic, sata_6_gbs: 1)
      }
      let(:no_component){
        FactoryGirl.create(:motherboard_basic)
      }
      let(:different_component){
        FactoryGirl.create(:motherboard_basic, sata_6_gbs: 0)
      }

    end

    #it "supports_case"

end
