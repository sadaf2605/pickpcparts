class CpusGrid < PcPartGrid
  
  scope do
    Cpu
  end
  
  scope_and_columns(url_columns=[:model],mandatory_columns=[:model,:speed,:cores])

end