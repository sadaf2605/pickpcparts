class CpusControllerSpec
require 'spec_helper'

include Devise::TestHelpers


describe Admin::PostsController do
  render_views

  before(:each) do
    @user = mock_model(User, :email => "tester@localspecs.com")
    request.env['tester'] = mock(Tester, :authenticate => @user, :authenticate! => @user)
  end

  describe "Get cpus" do
    before(:each) do
      @cpu = Cpu.create! valid_attributes
      Cpu.should_receive(:find).at_least(:once).and_return(@cpu)
      get :comments, :id => @post.id
    end

    after(:each) do
      @post.destroy
    end

    it "gets the proper record to update" do
      assigns(:post).should eq(@post)
    end

    it "should render the actual template" do
      response.should contain("Comments")
      response.body.should =~ /Comments/m
    end
  end
end
end