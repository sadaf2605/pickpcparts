json.array!(@storages) do |storage|
  json.extract! storage, :id, :manufacturer, :part_no, :capacity, :interface, :cache, :form_factor, :ssd_controller, :nand_flash_type, :gb_1, :price_gb
  json.url storage_url(storage, format: :json)
end
