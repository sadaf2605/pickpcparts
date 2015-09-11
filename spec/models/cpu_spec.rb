require 'rails_helper'

RSpec.describe Cpu, type: :model do
  it_should_behave_like "a child product", :cpu, Cpu


  describe "compatibility report with a valid cpu" do
      let(:static_part){
        cpu=FactoryGirl.create(:cpu)
        cpu.cpu_socket = FactoryGirl.create(:cpu_socket)
        cpu
      }

    it_should_behave_like "a report",:cpu, :cooler, "Socket" do

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

    it_should_behave_like "a report",:cpu, :motherboard,"Sockets" do
      
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