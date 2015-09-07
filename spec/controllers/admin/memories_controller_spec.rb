require 'rails_helper'
include Devise::TestHelpers

RSpec.describe Admin::MemoriesController, type: :controller do
  before(:each) do
    require "factories"
    @user = FactoryGirl.create(:admin_user)
    sign_in @user
  end
  after(:each) do
    @user.destroy
  end
 

  it_should_behave_like "a child product controller", Memory,:memory do
    let(:update_factory_name){ :memory }
    let(:params_with_product){ {:memory => FactoryGirl.nested_attributes(:memory)} }

    let(:params_with_market_status){ {:memory => FactoryGirl.nested_attributes(:memory_with_market_status)} }

    let(:params_without_product){{:memory => FactoryGirl.nested_attributes(:memory_without_product)}}

    let(:child_product_with_market_status){ FactoryGirl.create(:memory_with_market_status)}
  end

  describe "individual propertie" do
    context "on create" do 
      context "when there is memory type" do

        it "creates memory type" do
          memory_params=FactoryGirl.nested_attributes(:memory)

          memory_params=memory_params.merge({"memory_slot_id"=>MemorySlot.find_by_name(memory_params["memory_type"]["name"]).to_i.to_s})

          post :create, { "memory"=> memory_params}
          
          expect(Memory.last.memory_type).to be(memory_params["memory_type"]["name"]) 
        end

      end
    end


    context "on update" do 
      context "memory type" do
        

        it "creates memory type" do

          @memory= FactoryGirl.create(:memory)
          memory_slot = FactoryGirl.create(:memory_slot)

          attributes=FactoryGirl.nested_attributes(:memory)

          put :update, ({"id" => @memory.id}).merge({:memory => attributes.merge("memory_slot_id"=> memory_slot.id.to_s) })

          expect(@memory.memory_type).to be(memory_slot) 
        end

      end
    end


  end

end
