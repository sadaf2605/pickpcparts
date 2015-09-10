require 'rails_helper'

RSpec.describe Cpu, type: :model do
  it_should_behave_like "a child product", :cpu, Cpu


  describe "compatibility report for cpu" do    
    context "when there is cpu in build" do
      let(:socket_a){ FactoryGirl.create(:cpu_socket)}
      let(:socket_b){ socket_a}

      subject(:cpu) do
        cpu=FactoryGirl.create(:cpu)
        cpu.cpu_socket = socket_a
        cpu
      end
      
            
      before :each do
        @build = FactoryGirl.create(:build)
        cpu_build = FactoryGirl.create(:cpu_build, cpu: cpu )
        @build.add_cpu(cpu_build)
      end



      it "build really has a cpu" do
        expect(@build.cpus[0]).to eql(cpu) 
      end

      context "when there is cooler in the build" do
        before :each do
          @cooler=FactoryGirl.create(:cooler)
          
          if socket_b
            @cooler.cpu_sockets = [socket_b]
          end

          cooler_build = FactoryGirl.create(:cooler_build, cooler: @cooler )
          @build.add_cooler(cooler_build)          
        end
        context "when cooler has same socket in its supported list" do
          it "should return compatible" do
              expect(cpu.report(@build).length ).to be 1 
              expect(cpu.report(@build)[0] ).to include("[compatible]") 
          end
        end
        context "when cooler does not have same socket in its supported list" do
          let(:socket_b){FactoryGirl.create(:cpu_socket)}
          it "should return incompatible" do
            expect(cpu.report(@build).length ).to be 1 
            expect(cpu.report(@build)[0] ).to include("[incompatible]") 
          end
          context "when cooler does not have any supported list" do
            let(:socket_b){}
            it "should return incompatible" do
              expect(cpu.report(@build).length ).to be 1 
              expect(cpu.report(@build)[0]).to include("[incompatible]")  
            end
          end
        end
      end
    end
  end

end