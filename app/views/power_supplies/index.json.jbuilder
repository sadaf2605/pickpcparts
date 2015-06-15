json.array!(@power_supplies) do |power_supply|
  json.extract! power_supply, :id, :manufacturer, :part_no, :type, :wattage, :fans, :modular, :efficiency_certification, :efficiency, :output, :pci_express_6_plus_2_pin_connectors
  json.url power_supply_url(power_supply, format: :json)
end
