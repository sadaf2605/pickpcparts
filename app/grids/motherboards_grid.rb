class MotherboardsGrid<ParentProductGrid
  scope do
    Motherboard
  end
  
  scope_and_columns(url_columns=[:chipset],mandatory_columns=[:max_memory, :memory_slot_num])

end