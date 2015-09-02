require 'rails_helper'
include Devise::TestHelpers

RSpec.describe Admin::StoragesController, type: :controller do
  before(:each) do
    require "factories"
    @user = FactoryGirl.create(:admin_user)
    sign_in @user
  end
  after(:each) do
    @user.destroy
  end
 

  it_should_behave_like "a child product controller", Storage,:storage do
    let(:params_with_product){ {:storage => FactoryGirl.nested_attributes(:storage)} }

    let(:params_with_market_status){ {:storage => FactoryGirl.nested_attributes(:storage_with_market_status)} }

    let(:params_without_product){{:storage => FactoryGirl.nested_attributes(:storage_without_product)}}
  end
end
