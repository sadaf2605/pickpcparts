class FormFactor < ActiveRecord::Base

  def to_str
    return self.name
  end
end
