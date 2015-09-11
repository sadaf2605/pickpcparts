require 'rails_helper'

RSpec.describe Cooler, type: :model do

  it_should_behave_like "a child product", :cpu, Cpu

  
  describe "compatibility report with a valid cpu" do
    it_should_behave_like "a report", :cpu, "Socket" do

      subject!() do
        cooler=FactoryGirl.create(:cooler_basic)
        cooler.cpu_sockets = [FactoryGirl.create(:cpu_socket)]
        @build = FactoryGirl.create(:build)
        cooler_build = FactoryGirl.create(:cooler_build, cooler: cooler )
        @build.add_cooler(cooler_build)
        cooler
      end
      let(:same_component){
        FactoryGirl.create(:cpu_basic, cpu_socket: subject.cpu_sockets[0])
      }
      let(:no_component){
        FactoryGirl.create(:cpu_basic, cpu_socket:nil)
      }
      let(:different_component){
        FactoryGirl.create(:cpu_basic, cpu_socket: FactoryGirl.create(:cpu_socket))
      }

    end

  

    it '_should_behave_like "a report", :cpu_case"'


    it_should_behave_like "a report", :motherboard, "Socket" do

      subject!() do
        cooler=FactoryGirl.create(:cooler)
        cooler.cpu_sockets = [FactoryGirl.create(:cpu_socket)]
        @build = FactoryGirl.create(:build)
        cooler_build = FactoryGirl.create(:cooler_build, cooler: cooler )
        @build.add_cooler(cooler_build)
        cooler
      end
      let(:same_component){
        FactoryGirl.create(:motherboard_basic, cpu_socket: subject.cpu_sockets[0])
      }
      let(:no_component){
        FactoryGirl.create(:motherboard_basic, cpu_socket:nil)
      }
      let(:different_component){
        FactoryGirl.create(:motherboard_basic, cpu_socket: FactoryGirl.create(:cpu_socket))
      }

   end



 end
end
