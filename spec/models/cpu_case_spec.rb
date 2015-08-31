require 'rails_helper'

RSpec.describe CpuCase, type: :model do
	it_should_behave_like "a child product", :cpu_case, CpuCase
end
