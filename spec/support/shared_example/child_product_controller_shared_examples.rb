
RSpec.shared_examples "a child product controller" do |child_product_class, child_product_name|
  

  describe "on #{child_product_class.name} create" do
    context "when there is product" do     
      context "with single market status"do    
        subject{
          puts params_with_market_status
          post :create, params_with_market_status}

        it "creates #{child_product_class.name} successfully" do
          expect{subject}.to change(child_product_class,:count).by(1)
        end
        it "creates product successfully" do
          expect{subject}.to change(Product,:count).by(1)
        end
        it 'redirects to newly created record' do
          expect(subject).to redirect_to :action => :show,
                                         :id => assigns(child_product_name).id
        end


        context "when shop is valid" do 
          context "when price is valid" do
            it "creates market status" do
              expect{subject}.to change(MarketStatus,:count).by(1)
            end
          end
#          context "when price is invalid" do
#            it "does not create market status"
#          end
        end
#        context "shen shop is invalid" do

#          context "when price is valid" do
#            it "does not create market status"
#          end
#          context "when price is not valid" do
#            it "does not create market status"
#          end
#        end
      end

      context "with no market status" do
        subject{ post :create, params_with_product}

        it "creates #{child_product_class.name} successfully" do
          expect{subject}.to change(child_product_class,:count).by(1)
        end
        it "creates product" do
          expect{subject}.to change(Product,:count).by(1)
        end
        it 'redirects to newly created record' do
          expect(subject).to redirect_to :action => :show,
                                         :id => assigns(child_product_name).id
        end

      end

    end

  end

end