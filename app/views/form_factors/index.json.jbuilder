json.array!(@form_factors) do |form_factor|
  json.extract! form_factor, :id, :string
  json.url form_factor_url(form_factor, format: :json)
end
