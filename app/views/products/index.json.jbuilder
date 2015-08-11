json.array!(@products) do |product|
  json.extract! product, :id, :manufacturer, :part_no
  json.url product_url(product, format: :json)
end
