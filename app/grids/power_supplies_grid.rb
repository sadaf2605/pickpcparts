class PowerSuppliesGrid < PcPartGrid
  scope do
    PowerSupply
  end 
  
  scope_and_columns(url_columns=[:part_no],mandatory_columns=[:wattage,:type,:modular])
  
end
