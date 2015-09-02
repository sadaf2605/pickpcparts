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
  end

end
