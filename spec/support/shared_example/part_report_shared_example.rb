RSpec.shared_examples "a report" do |static_part_name,test_part_name, test_component|



      subject!() do  
        @build = FactoryGirl.create(:build)
        part_build = FactoryGirl.create("#{static_part_name}_build".to_sym, static_part_name => static_part )
        eval("@build.add_#{static_part_name}(part_build)")
        static_part
      end


      context "when #{test_part_name} is in the build" do
        before :each do
          part_build = FactoryGirl.create(:"#{test_part_name}_build", test_part_name => part )
          eval("@build.add_#{test_part_name}(part_build)")          
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