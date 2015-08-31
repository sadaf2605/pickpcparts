RSpec.shared_examples "a child product" do |child_product_name, child_product_class|
  
  describe "has a valid factory" do
    it {  expect(FactoryGirl.build(child_product_name)).to be_valid }
  end
  
  describe "#create" do

    it "creates sucessfully" do
      expect{ FactoryGirl.create(child_product_name) }.to change(child_product_class,:count).by(1)
    end
    

    context "without product" do
      it "does not create anything" do
        expect(FactoryGirl.build(child_product_name, product:nil) ).to be_invalid
      end
    end
  
  end
  
  describe "#destroy" do

    subject!(:product){ return FactoryGirl.create(child_product_name)}
     
    it "destroys sucessfully" do
      
      expect{product.destroy}.to change(child_product_class,:count).by(-1)
    end

    it "also destroys product" do
      
      expect{product.destroy}.to change(Product,:count).by(-1)
    end
    
  end
  
  
end
