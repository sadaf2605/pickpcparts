json.array!(@processor_expansions) do |processor_expansion|
  json.extract! processor_expansion, :id, :PCI_express_revision, :max_no_of_PCI_express_lanes
  json.url processor_expansion_url(processor_expansion, format: :json)
end
