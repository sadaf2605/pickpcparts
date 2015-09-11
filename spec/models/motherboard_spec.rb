require 'rails_helper'

RSpec.describe Motherboard, type: :model do
	  describe "compatibility report with a valid motherboard" do
	      let(:static_part){
	        m_board=FactoryGirl.create(:motherboard_basic)
	        m_board.cpu_socket = FactoryGirl.create(:cpu_socket)
	        m_board.memory_slot = FactoryGirl.create(:memory_slot)
	        m_board.sata_6_gbs = 1
	        m_board
	      }
	    
	    it_should_behave_like "a report",:motherboard, :cpu, "Socket" do

	      let(:same_component){
	        FactoryGirl.create(:cpu_basic, cpu_socket: subject.cpu_socket)
	      }
	      let(:no_component){
	        FactoryGirl.create(:cpu_basic)
	      }
	      let(:different_component){
	        FactoryGirl.create(:cpu_basic, cpu_socket: FactoryGirl.create(:cpu_socket) )
	      }
	  	end

	    it_should_behave_like "a report",:motherboard, :cooler, "Socket" do
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
	  	
	  	it "should behave like a report for cpu case"

	    it_should_behave_like "a report",:motherboard, :memory, "Memory Type" do
	      let(:same_component){
	        FactoryGirl.create(:memory_basic, memory_type: subject.memory_slot)
	      }
	      let(:no_component){
	        FactoryGirl.create(:memory_basic)
	      }
	      let(:different_component){
	        FactoryGirl.create(:memory_basic, memory_type: FactoryGirl.create(:memory_slot))
	      }
	  	end

	  	it "should behave like a report for optical drive"
	  	it "should behave like a report for sound card"



	    it_should_behave_like "a report",:motherboard, :storage, "Memory Type" do
	      let(:same_component){
	        FactoryGirl.create(:storage_basic, interface: "SATA 6 Gb/s" )
	      }
	      let(:no_component){
	        FactoryGirl.create(:storage_basic)
	      }
	      let(:different_component){
	        FactoryGirl.create(:storage_basic, interface: "PATA 1 Gb/s")
	      }
	  	end



#		describe "storage" do
#			subject(){FactoryGirl.create(:motherboard_basic)}
#			let (:storage_interface){""}
#			let (:build) {FactoryGirl.create(:build)}
#			before(:each) do
#				storage=FactoryGirl.create(:storage_basic)
#				storage.interface = storage_interface
#				build.add_storage(storage)
#			end#

#			context "when motherboard supports SATA" do
#				subject(){
#					subject.sata_6_gbs=2
#					subject
#				}#

#				context "when storage has SATA port" do
#					let(:storage_interface){"SATA 6 Gb/s"}
#					it {expect(subject.report(build)[0]).to include "[]"}
#				end
#				context "when storage does not have SATA" do
#					let(:storage_interface){""}
#					it {expect(subject.report(build)[0]).to include "[]"}
#				end
#			end
#			context "when motherboard does not supports SATA" do
#				it {expect(subject.report(build)[0]).to include "[]"}
#			end
#		end

	  	it "should behave like a report for LAN card"
	  	it "should behave like a report for WAN card"


	end


end
