require 'rails_helper'
include Devise::TestHelpers

RSpec.describe Admin::PowerSuppliesController, type: :controller do
  before(:each) do
    require "factories"
    @user = FactoryGirl.create(:admin_user)
    sign_in @user
  end
  after(:each) do
    @user.destroy
  end
 

  it_should_behave_like "a child product controller", PowerSupply,:power_supply do
    let(:params_with_product){ {:power_supply => FactoryGirl.nested_attributes(:power_supply)} }

    let(:params_with_market_status){ {:power_supply => FactoryGirl.nested_attributes(:power_supply_with_market_status)} }

    let(:params_without_product){{:power_supply => FactoryGirl.nested_attributes(:power_supply_without_product)}}
  end

end
