json.array!(@processor_data_protections) do |processor_data_protection|
  json.extract! processor_data_protection, :id, :AES_new_nstructions, :secure_key
  json.url processor_data_protection_url(processor_data_protection, format: :json)
end
