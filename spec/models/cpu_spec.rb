require 'rails_helper'

RSpec.describe Cpu, type: :model do
  it_should_behave_like "a child product", :cpu, Cpu


  describe "compatibility report with a valid cpu" do
    it_should_behave_like "a report", :cooler, "Socket" do

      subject!() do
        cpu=FactoryGirl.create(:cpu)
        cpu.cpu_socket = FactoryGirl.create(:cpu_socket)
        @build = FactoryGirl.create(:build)
        cpu_build = FactoryGirl.create(:cpu_build, cpu: cpu )
        @build.add_cpu(cpu_build)
        cpu
      end
      let(:same_component){
        FactoryGirl.create(:cooler, cpu_sockets: [subject.cpu_socket])
      }
      let(:no_component){
        FactoryGirl.create(:cooler)
      }
      let(:different_component){
        FactoryGirl.create(:cooler, cpu_sockets: [FactoryGirl.create(:cpu_socket)])
      }

    end

    it_should_behave_like "a report", :motherboard,"Sockets" do

      subject!() do
        cpu=FactoryGirl.create(:cpu_basic)
        cpu.cpu_socket = FactoryGirl.create(:cpu_socket)
        @build = FactoryGirl.create(:build)
        cpu_build = FactoryGirl.create(:cpu_build, cpu: cpu )
        @build.add_cpu(cpu_build)
        cpu
      end
      let(:same_component){
        FactoryGirl.create(:motherboard_basic, cpu_socket: subject.cpu_socket)
      }
      let(:no_component){
        FactoryGirl.create(:motherboard_basic)
      }
      let(:different_component){
        FactoryGirl.create(:motherboard_basic, cpu_socket: FactoryGirl.create(:cpu_socket))
      }

    end
  end


end