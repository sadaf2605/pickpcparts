class CpuCasesGrid < PcPartGrid
  scope do
    CpuCase
  end
  
  scope_and_columns(url_columns=[:part_no],mandatory_columns=[:type,:included_power_supply,:external_5_25_bays])


end