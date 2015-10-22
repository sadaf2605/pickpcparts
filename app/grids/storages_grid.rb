class StoragesGrid <PcPartGrid
  scope do
    Storage
  end

filter(:part_no)
column(:part_no, mandatory: true, url: lambda {|model| model.part_no })
column(:capacity,mandatory: true)
column(:ssd_controller,mandatory: true)
column(:price_gb, mandatory: true)


#scope_and_columns(url_columns=[:part_no],mandatory_columns=[:capacity,:ssd_controller,:price_gb])

end