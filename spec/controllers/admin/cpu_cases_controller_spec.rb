require 'rails_helper'

include Devise::TestHelpers


RSpec.describe Admin::CpuCasesController, type: :controller do
  before(:each) do
    require "factories"
    @user = FactoryGirl.create(:admin_user)
    sign_in @user
  end
  after(:each) do
    @user.destroy
  end
 

  it_should_behave_like "a child product controller", CpuCase,:cpu_case do
    let(:params_with_product){ {:cpu_case => FactoryGirl.nested_attributes(:cpu_case)} }
    let(:params_with_market_status){ {:cpu_case => FactoryGirl.nested_attributes(:cpu_case_with_market_status)} }

    let(:params_without_product){{:cpu_case => FactoryGirl.nested_attributes(:cpu_case_without_product)}}
  end

end
