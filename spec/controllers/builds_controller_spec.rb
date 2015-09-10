require 'rails_helper'

RSpec.describe BuildsController, type: :controller do
	[:cpu,:cooler,:motherboard, :memory, :storage, :video_card,:cpu_case, :power_supply].each do |p|
		describe "on build with #{p}" do
			context "when we add single #{p} to build" do
				it "it adds to build successfully" do
					part=FactoryGirl.create("#{p}_with_market_status".to_sym)

					post "add_#{p}".to_sym, {"#{p}_id".to_sym => part, qty:1, market_status:part.product.market_statuses[0].id}
					expect(Build.last.send("#{p.to_s.pluralize}")[0]).to eql(part)
				end
			end
			context "when we remove single single #{p} from single #{p}" do
				it "removes #{p} to build successfully" do
					b=FactoryGirl.create(:build)
					part=FactoryGirl.create("#{p}_with_market_status".to_sym)
					
					b.send("#{p.to_s.pluralize}").push (part)
					post "remove_#{p}".to_sym, {"#{p}_id".to_sym => part}
					expect(Build.last.send("#{p.to_s.pluralize}").length).to be 0
				end 
			end
		end
	end


end
