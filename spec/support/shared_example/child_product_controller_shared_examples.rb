RSpec.shared_examples "a child product controller" do |child_product_class|
  

  describe "create" do    
    context "when there is product with market status"do    
      subject{ post :create, params_with_market_status}

      it 'creates cpu' do
        expect{subject}.to change(child_product_class,:count).by(1)
      end
      it "creates product" do
        expect{subject}.to change(Product,:count).by(1)
      end
      it 'redirect to correct cpu' do
        expect(subject).to redirect_to admin_cpu_path( assigns(:cpu) )
      end
    end

    context "when there is product but no market status" do
      subject{ post :create, params_with_product}

      it "creates cpu" do
        expect{subject}.to change(child_product_class,:count).by(0)
      end
      it "creates product" do
        expect{subject}.to change(Product,:count).by(0)
      end
      it "renders new" do
        subject    
        expect(response).to render_template(:new)
      end
    end



  end

end
