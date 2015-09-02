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
    let(:params_with_product){ {:memory => FactoryGirl.nested_attributes(:memory)} }

    let(:params_with_market_status){ {:memory => FactoryGirl.nested_attributes(:memory_with_market_status)} }

    let(:params_without_product){{:memory => FactoryGirl.nested_attributes(:memory_without_product)}}
  end

end
