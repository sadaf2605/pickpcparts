json.array!(@processor_platform_protections) do |processor_platform_protection|
  json.extract! processor_platform_protection, :id, :trusted_execution_technology, :execute_disable_bit
  json.url processor_platform_protection_url(processor_platform_protection, format: :json)
end
