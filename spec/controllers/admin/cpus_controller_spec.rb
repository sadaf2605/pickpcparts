# spec/controllers/admin/organizations_controller_spec.rb
require 'rails_helper'
require 'spec_helper'
require 'devise'


include Devise::TestHelpers

describe Admin::CpusController, :type => :controller do
  # render_views

  before(:each) do
    require "factories"
    @user = FactoryGirl.create(:admin_user)
    sign_in @user
  end
  after(:each) do
    @user.destroy
  end
  
  
  describe "index" do
    it 'returns posts when I create posts' do
      cpu = FactoryGirl.create(:cpu)
      get :index
      expect(assigns(:cpus)).to eq( [cpu] )      
    end
  end
  
  
  describe "create"
    subject{ post :create, cpu: FactoryGirl.nested_attributes(:cpu)}

    it 'redirect to correct cpu' do
      expect(subject).to redirect_to admin_cpu_path( assigns(:cpu) )
    end

    it 'creates cpu' do
      expect{subject}.to change(Cpu,:count).by(1)
    end
    
    describe "has no socket" do
      it "redirect to edit page"
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