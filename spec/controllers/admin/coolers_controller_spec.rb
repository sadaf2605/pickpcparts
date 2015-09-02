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
 

  it_should_behave_like "a child product controller", Cooler,:cooler,'' do
    let(:params_with_product){ {:cooler => FactoryGirl.nested_attributes(:cooler)} }

    let(:params_with_market_status){ {:cooler => FactoryGirl.nested_attributes(:cooler_with_market_status)} }

    let(:params_without_product){{:cooler => FactoryGirl.nested_attributes(:cooler_without_product)}}
  end

end
