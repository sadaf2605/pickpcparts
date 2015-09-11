RSpec.shared_examples "a report" do |with_part, test_component|




      context "when #{with_part} is in the build" do
        before :each do
          part_build = FactoryGirl.create(:"#{with_part}_build", with_part => part )
          eval("@build.add_#{with_part}(part_build)")          
        end

        context "when #{test_component} matches" do
          let(:part){same_component}

          it "returns compatible" do
              expect(subject.report(@build).length ).to be 1 
              expect(subject.report(@build)[0] ).to include("[compatible]") 
          end
        end
        context "when #{test_component} does not match" do
        
          let(:part){different_component}
          it "returns incompatible" do
            expect(subject.report(@build).length ).to be 1 
            expect(subject.report(@build)[0] ).to include("[incompatible]") 
          end
        end
        context "when there is no #{test_component}" do
          
          let(:part){no_component}
          
          it "returns incompatible" do
            expect(subject.report(@build).length ).to be 1 
            expect(subject.report(@build)[0]).to include("[incompatible]")  
          end
        end



  end
end