require 'rails_helper'
include Devise::TestHelpers

RSpec.describe Admin::VideoCardsController, type: :controller do

  before(:each) do
    require "factories"
    @user = FactoryGirl.create(:admin_user)
    sign_in @user
  end
  after(:each) do
    @user.destroy
  end
 

  it_should_behave_like "a child product controller", VideoCard,:video_card do
    let(:params_with_product){ {:video_card => FactoryGirl.nested_attributes(:video_card)} }

    let(:params_with_market_status){ {:video_card => FactoryGirl.nested_attributes(:video_card_with_market_status)} }

    let(:params_without_product){{:video_card => FactoryGirl.nested_attributes(:video_card_without_product)}}
  end


end
