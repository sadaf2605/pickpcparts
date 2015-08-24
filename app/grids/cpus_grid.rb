class CpusGrid

  include Datagrid

  scope do
    Cpu
  end
  filter(:model) do |value|
    where("model LIKE '%#{value}%'")
  end
  Cpu.columns.select {|s| !s.name.to_s.end_with? "_at" }.each do |c|
    filter(c.name, Cpu.columns_hash[c.name].type)
  end


  column(:model)
  column(:speed)
  column(:cores)
end
