require 'rails_helper'

RSpec.describe Cpu, type: :model do
  it_should_behave_like "a child product", :cpu, Cpu
end
