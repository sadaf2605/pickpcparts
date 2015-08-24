class CpusGrid

  include Datagrid

  scope do
    Cpu
  end
  filter(:model) do |value|
    where("model LIKE '%#{value}%'")
  end
  filter(:product) do
    #where("model LIKE '%#{value}%'")
    self.product.part_no
  end
  
#  Cpu.columns.select {|s| !s.name.to_s.end_with? "_at" }.each do |c|
#    filter(c.name, Cpu.columns_hash[c.name].type)
#  end

  column(:product) do
    self.product.part_no unless self.product.nil?
  end
  column(:model)
  column(:created_at) do |model|
    model.created_at.to_date
  end
end
