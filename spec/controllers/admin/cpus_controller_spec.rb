# spec/controllers/admin/organizations_controller_spec.rb
require 'rails_helper'

require 'nested_attr'


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
 

  it_should_behave_like "a child product controller", Cpu,:cpu do
    let(:update_factory_name){:cpu}

    let(:params_with_product){ {:cpu => NestedAttr.nested_attr_for(:cpu,has_many=[:market_statuses]) } }
    let(:params_with_market_status){ {:cpu => NestedAttr.nested_attr_for(:cpu_with_market_status,has_many=[:market_statuses]) } }

    let(:params_without_product){{:cpu => NestedAttr.nested_attr_for(:cpu_without_product,has_many=[:market_statuses])}}

    let(:child_product_with_market_status){ FactoryGirl.create(:cpu_with_market_status)}

  end
  
    

  describe "index" do
#    it 'returns posts when I create posts' do
#      cpu = FactoryGirl.create(:cpu)
#      get :index
#      expect(assigns(:cpus)).to eq( [cpu] )      
#    end
  end

  describe "create" do
    context "when there is socket" do
      let(:cpu_attribute){NestedAttr.nested_attr_for(:cpu)}
      
      it "creates with cpu socket successfully" do
        
        cpu_socket = FactoryGirl.create(:cpu_socket)
#        post :create,{"cpu"=>{"product"=>{"manufacturer"=>"", "part_no"=>""}, "cpu_socket_id"=>cpu_socket.id.to_s, "model"=>"", "data_width"=>"", "speed"=>"", "cores"=>"", "l1_cache"=>"", "l2_cache"=>"", "l3_cache"=>"", "lithography"=>"", "thermal_design_power"=>"", "includes_cpu_cooler"=>"0", "hyper_threading"=>"0", "integrated_graphics"=>""}}

        attt={"product"=>{"manufacturer"=>"", "part_no"=>""}, "cpu_socket_id"=>cpu_socket.id.to_s, "model"=>"", "data_width"=>"", "speed"=>"", "cores"=>"", "l1_cache"=>"", "l2_cache"=>"", "l3_cache"=>"", "lithography"=>"", "thermal_design_power"=>"", "includes_cpu_cooler"=>"0", "hyper_threading"=>"0", "integrated_graphics"=>""}
        post :create,{"cpu"=>attt}

        #post :create, {:cpu => FactoryGirl.nested_attributes(:cpu).stringify_keys.merge("cpu_socket_id"=> cpu_socket.id.to_s) }
        expect(Cpu.last.cpu_socket.name).to eq(cpu_socket.name)
     #   expect(Cpu.last.cpu_socket_id).to eaq(cpu_socket.id)
      end
    end
  end

  describe "update" do
    context "when update socket" do
      before(:each){
        @cpu=FactoryGirl.create(:cpu)
      }

      it "updates socket" do

        cpu_socket = FactoryGirl.create(:cpu_socket)
        
        put :update, {id:@cpu}.merge({:cpu => NestedAttr.nested_attr_for(:cpu).stringify_keys.merge("cpu_socket_id"=> cpu_socket.id.to_s) })
        @cpu.reload


        expect(@cpu.cpu_socket_id).to eq(cpu_socket.id)

      end
    end
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