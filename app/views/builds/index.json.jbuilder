json.array!(@builds) do |build|
  json.extract! build, :id, :cpu, :motherboard, :cooler
  json.url build_url(build, format: :json)
end
