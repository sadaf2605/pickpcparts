class DisplaysGrid < PcPartGrid


  scope do
    Display
  end
  scope_and_columns(url_columns=[:recommended_resolution],mandatory_columns=[:recommended_resolution, :screen_size, :response_time, :ips])

end
