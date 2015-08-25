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
    
    if [:model].include? c.name.to_sym
      column(c.name,:mandatory =>true, :url => lambda {|model| "cpus/#{model.id}" })
    else
      column(c.name,:mandatory => if [:model,:speed,:cores].include? c.name.to_sym then true else false end)
    end
    
  end


    
  column_names_filter(:header => "Extra Columns", checkboxes: true)

end