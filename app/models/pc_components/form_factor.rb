class FormFactor < ActiveRecord::Base
  has_many :cpu_cases

  def to_str
    return self.name
  end
end
