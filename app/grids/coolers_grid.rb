class CoolersGrid <ParentProductGrid
  
  scope do
    Cooler
  end
  
  scope_and_columns(url_columns=[:noise_level],mandatory_columns=[:noise_level, :fan_rpm])

end