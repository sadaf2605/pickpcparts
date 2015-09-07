require 'rails_helper'
include Devise::TestHelpers

RSpec.describe Admin::MotherboardsController, type: :controller do
  before(:each) do
    require "factories"
    @user = FactoryGirl.create(:admin_user)
    sign_in @user
  end
  after(:each) do
    @user.destroy
  end
 

  it_should_behave_like "a child product controller", Motherboard,:motherboard do
    let(:params_with_product){ {:motherboard => FactoryGirl.nested_attributes(:motherboard)} }

    let(:params_with_market_status){ {:motherboard => FactoryGirl.nested_attributes(:motherboard_with_market_status)} }

    let(:params_without_product){{:motherboard => FactoryGirl.nested_attributes(:motherboard_without_product)}}


     let(:update_factory_name){ :motherboard }

    let(:child_product_with_market_status){ FactoryGirl.create(:motherboard_with_market_status)}
  end

  describe "on create" do
    context "when cpu socket is there" do
      it "creates with cpu socket" do 
        cpu_socket=FactoryGirl.create(:cpu_socket)
        post :create, motherboard: FactoryGirl.nested_attributes(:motherboard).merge({:cpu_socket_id => cpu_socket.id})
        expect(Motherboard.last.cpu_socket).to eql(cpu_socket)
      end
    end

    context "when form factor is there" do
      it "creates with form factor" do 
        form_factor=FactoryGirl.create(:form_factor)
        post :create, motherboard: FactoryGirl.nested_attributes(:motherboard).merge({:form_factor_id => form_factor.id})
        expect(Motherboard.last.form_factor).to eql(form_factor)
      end
    end
  end

  describe "on update" do
    context "when cpu socket change" do
      it "updates cpu socket" do 
        @motherboard = FactoryGirl.create(:motherboard)

        cpu_socket=FactoryGirl.create(:cpu_socket)

        put :update, ({id:@motherboard.id}).merge({  motherboard: FactoryGirl.nested_attributes(:motherboard).merge({:cpu_socket_id => cpu_socket.id}) })
        @motherboard.reload
        expect(@motherboard.cpu_socket).to eql(cpu_socket)
      end
    end

    context "when cpu socket is there" do
      it "creates with form factor" do 
        @motherboard = FactoryGirl.create(:motherboard)
        form_factor=FactoryGirl.create(:form_factor)

        put :update,({id:@motherboard.id}).merge({motherboard: FactoryGirl.nested_attributes(:motherboard).merge({:form_factor_id => form_factor.id})})
        @motherboard.reload
        expect(@motherboard.form_factor).to eql(form_factor)
      end
    end


  end
end
