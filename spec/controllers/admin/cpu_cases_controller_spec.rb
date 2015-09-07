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

    let(:update_factory_name){ :cpu_case }
 
    let(:child_product_with_market_status){ FactoryGirl.create(:cpu_case_with_market_status)}
  end

  

  describe "create" do 

    let(:attr){FactoryGirl.nested_attributes(:cpu_case).merge({"form_factor_ids" => FormFactor.all.map{|m| m.id.to_s}})}
    subject!{post :create, cpu_case: attr}

    context "when there are supporting cpu sockets" do
      it "adds all cpu sockets to its supporting list" do
        expect(CpuCase.last.form_factors.count).to eq(attr["form_factor_ids"].count) 
      end

      it "adds all form factors to its supporting list" do
          expect(CpuCase.last.form_factors.map {|x| x.id.to_s}).to include(*attr["form_factor_ids"]) 
      end

    end
  end

  describe "update" do
    before(:each){
      @cpu_case=FactoryGirl.create(:cpu_case)
    } 

    let(:attr){FactoryGirl.nested_attributes(:cpu_case)}
    subject!{
      put :update, {id:@cpu_case}.merge( cpu_case: attr) 
      @cpu_case.reload
  }

    context "when update cpu sockets" do

      it "updates successfully" do
        
          expect(@cpu_case.form_factors.map {|x| x.id.to_s}).to include(*attr["cpu_case_ids"])
         
      end

    end
  end



end
