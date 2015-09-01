RSpec.shared_examples "a child product controller" do |factory_name, child_product_class|
  
  let(:product_params){ FactoryGirl.nested_attributes(:cpu_with_market_status) }

  describe "create" do    
    context "when there is product with market status" do
      subject{ post :create, cpu: cpu_params }
      let(:product_params){ FactoryGirl.nested_attributes(:cpu_with_market_status) }

      it 'creates cpu' do
        expect{subject}.to change(Cpu,:count).by(1)
      end
    end
  end
end
