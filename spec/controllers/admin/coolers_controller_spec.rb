require 'rails_helper'
include Devise::TestHelpers

RSpec.describe Admin::CoolersController, type: :controller do
  before(:each) do
    require "factories"
    @user = FactoryGirl.create(:admin_user)
    sign_in @user
  end
  after(:each) do
    @user.destroy
  end
 

 it_should_behave_like "a child product controller", Cooler,:cooler do
    let(:update_factory_name){:cooler}

    let(:params_with_product){ {:cooler => FactoryGirl.nested_attributes(:cooler) } }
    let(:params_with_market_status){ {:cooler => FactoryGirl.nested_attributes(:cooler_with_market_status) } }

    let(:params_without_product){{:cooler => FactoryGirl.nested_attributes(:cooler_without_product)}}

    let(:child_product_with_market_status){ FactoryGirl.create(:cpu_with_market_status)}

  end

  describe "create" do 
    let(:attr){FactoryGirl.nested_attributes(:cooler)}
    subject!{post :create, cooler: attr}

    context "when there are supporting cpu sockets" do
      it "adds all cpu sockets to its supporting list" do
        expect(Cooler.last.cpu_sockets.count).to eq(attr["cpu_socket_ids"].count) 
      end

      it "adds all cpu sockets to its supporting list" do
          expect(Cooler.last.cpu_sockets.map {|x| x.id.to_s}).to include(*attr["cpu_socket_ids"]) 
      end

    end
  end

  describe "update" do
    before(:each){
      @cooler=FactoryGirl.create(:cooler)
    } 

    let(:attr){FactoryGirl.nested_attributes(:cooler)}
    subject!{
      put :update, {id:@cooler}.merge( cooler: attr) 
      @cooler.reload
  }

    context "when update cpu sockets" do

      it "updates successfully" do
        
          @cooler.cpu_sockets.reload
          expect(@cooler.cpu_sockets.map {|x| x.id.to_s}).to include(*attr["cpu_socket_ids"])
         
      end

    end
  end


end
