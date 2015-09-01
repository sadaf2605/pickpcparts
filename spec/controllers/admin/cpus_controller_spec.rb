# spec/controllers/admin/organizations_controller_spec.rb
require 'rails_helper'
require 'spec_helper'
require 'devise'
load 'spec/support/shared_example/child_product_controller_shared_examples.rb'


include Devise::TestHelpers

describe Admin::CpusController, :type => :controller do
  before(:each) do
    require "factories"
    @user = FactoryGirl.create(:admin_user)
    sign_in @user
  end
  after(:each) do
    @user.destroy
  end
 

  it_should_behave_like "a child product controller", Cpu do
    let(:params_with_market_status){ {:cpu => FactoryGirl.nested_attributes(:cpu_with_market_status)} }
    let(:params_with_product){ {:cpu => FactoryGirl.nested_attributes(:cpu_with_product)} }
  end
    
  

  describe "index" do
#    it 'returns posts when I create posts' do
#      cpu = FactoryGirl.create(:cpu)
#      get :index
#      expect(assigns(:cpus)).to eq( [cpu] )      
#    end
  end      
  end


#RSpec.controller C
#  require 'spec_helper'
#  require 'devise'
#  include Devise::TestHelpers


#  describe Admin::CpusController do
#    render_views

#    before(:each) do
#     @user = mock_model(User, :email => "tester@localspecs.com")
#     request.env['tester'] = mock(Tester, :authenticate => @user, :authenticate! => @user)
#    end

    
#    it "redirects to the home page upon save" do
#      post :create, cpu: Factory.attributes_for(:cpu)
#      response.should redirect_to admin_root_url
#    end

#describe "Get comments" do
# before(:each) do
#   @post = Post.create! valid_attributes
#   Post.should_receive(:find).at_least(:once).and_return(@post)
#   get :comments, :id => @post.id
# end
#
# after(:each) do
#   @post.destroy
# end
#
# it "gets the proper record to update" do
#   assigns(:post).should eq(@post)
# end
#
# it "should render the actual template" do
#   response.should contain("Comments")
#   response.body.should =~ /Comments/m
# end

#end
#end